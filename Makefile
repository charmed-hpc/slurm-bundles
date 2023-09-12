NHC=lbnl-nhc-1.4.3.tar.gz

.PHONY: clean
clean: ## Remove all deployed applications
	juju remove-application --force mysql \
									slurmdbd-mysql-router \
	                                slurmctld \
	                                slurmd \
	                                slurmdbd \
	                                slurmrestd

${NHC}: ## Download NHC resource
	wget https://github.com/mej/nhc/releases/download/1.4.3/${NHC}

resources: ${NHC} ## Download all resources

.PHONY: lxd
lxd: resources ## Deploy slurm-core in a local LXD Ubuntu Jammy cluster
	juju deploy ./slurm-core/bundle.yaml \
	            --overlay ./slurm-core/clouds/lxd.yaml \
	            --overlay ./slurm-core/series/jammy.yaml \
	            --overlay ./slurm-core/charms/local-development.yaml


.PHONY: aws
aws: resources ## Deploy slurm-core in a AWS Ubuntu Jammy cluster
	juju deploy ./slurm-core/bundle.yaml \
	            --overlay ./slurm-core/clouds/aws.yaml \
	            --overlay ./slurm-core/series/jammy.yaml \
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
