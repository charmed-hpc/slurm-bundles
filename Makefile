clean: ## Remove all deployed applications
	juju remove-application --force percona-cluster \
	                                slurmctld \
	                                slurmd \
	                                slurmdbd \
	                                slurmrestd

lxd-focal: ## Deploy slurm-core in a local LXD Ubuntu Focal cluster
	juju deploy ./slurm-core/bundle.yaml \
	            --overlay ./slurm-core/clouds/lxd.yaml \
	            --overlay ./slurm-core/series/focal.yaml

lxd-centos: ## Deploy slurm-core in a local LXD CentOS7 cluster
	juju deploy ./slurm-core/bundle.yaml \
	            --overlay ./slurm-core/clouds/lxd.yaml \
	            --overlay ./slurm-core/series/centos7.yaml \

aws-focal: ## Deploy slurm-core in a AWS Ubuntu Focal cluster
	juju deploy ./slurm-core/bundle.yaml \
	            --overlay ./slurm-core/clouds/aws.yaml \
	            --overlay ./slurm-core/series/focal.yaml

aws-centos: ## Deploy slurm-core in a AWS CentOS7 cluster
	juju deploy ./slurm-core/bundle.yaml \
	            --overlay ./slurm-core/clouds/aws.yaml \
	            --overlay ./slurm-core/series/centos7.yaml

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# SETTINGS
# Use one shell for all commands in a target recipe
.ONESHELL:
# Set default goal
.DEFAULT_GOAL := help
# Use bash shell in Make instead of sh 
SHELL := /bin/bash
