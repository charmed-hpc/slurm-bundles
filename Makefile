ETCD=etcd-v3.5.0-linux-amd64.tar.gz

.PHONY: clean
clean: ## Remove all deployed applications
	juju remove-application --force percona-cluster \
	                                slurmctld \
	                                slurmd \
	                                slurmdbd \
	                                slurmrestd

${ETCD}: ## Download etcd resource
	wget https://github.com/etcd-io/etcd/releases/download/v3.5.0/${ETCD}

SINGULARITY_DEB=singularity-ce_3.10.2-focal_amd64.deb
SINGULARITY_RPM=singularity-ce-3.10.2-1.el7.x86_64.rpm

${SINGULARITY_DEB}:
	wget https://github.com/sylabs/singularity/releases/download/v3.10.2/${SINGULARITY_DEB}

${SINGULARITY_RPM}:
	wget https://github.com/sylabs/singularity/releases/download/v3.10.2/${SINGULARITY_RPM}

singularity: ${SINGULARITY_DEB} ${SINGULARITY_RPM} ## Donwload singularity .deb and .rpm

.PHONY: lxd-focal
lxd-focal: ${ETCD} singularity ## Deploy slurm-core in a local LXD Ubuntu Focal cluster
	juju deploy ./slurm-core/bundle.yaml \
	            --overlay ./slurm-core/clouds/lxd.yaml \
	            --overlay ./slurm-core/series/focal.yaml \
	            --overlay ./slurm-core/charms/local-development.yaml

.PHONY: lxd-centos
lxd-centos: ${ETCD} singularity ## Deploy slurm-core in a local LXD CentOS7 cluster
	juju deploy ./slurm-core/bundle.yaml \
	            --overlay ./slurm-core/clouds/lxd.yaml \
	            --overlay ./slurm-core/series/centos7.yaml \
	            --overlay ./slurm-core/charms/local-development.yaml

.PHONY: aws-focal
aws-focal: ${ETCD} singularity ## Deploy slurm-core in a AWS Ubuntu Focal cluster
	juju deploy ./slurm-core/bundle.yaml \
	            --overlay ./slurm-core/clouds/aws.yaml \
	            --overlay ./slurm-core/series/focal.yaml \
	            --overlay ./slurm-core/charms/local-development.yaml

.PHONY: aws-centos
aws-centos: ${ETCD} singularity ## Deploy slurm-core in a AWS CentOS7 cluster
	juju deploy ./slurm-core/bundle.yaml \
	            --overlay ./slurm-core/clouds/aws.yaml \
	            --overlay ./slurm-core/series/centos7.yaml \
	            --overlay ./slurm-core/charms/local-development.yaml

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# SETTINGS
# Use one shell for all commands in a target recipe
.ONESHELL:
# Set default goal
.DEFAULT_GOAL := help
# Use bash shell in Make instead of sh
SHELL := /bin/bash
