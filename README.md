# Omnivector Slurm Distribution Bundles

A suite of codified operations to assemble, install, deploy, and operate
Slurm.

## Overview

The [Slurm Charms](https://github.com/omnivector-solutions/slurm-charms/) are a
custom curated suite of tools and automation that facilitate the lifecycle
events and continuous operation of a Slurm cluster.

Assuming you have Juju installed and bootstrapped, deploying a Slurm cluster
involves running only a single command:

```bash
$ juju deploy slurm
```

This command will deploy and configure a Slurm cluster with:
- 1 `slurmctld` node: the central management node
- 1 `slurmdbd` node: the database accounting node
- 1 `slurmd` node: the compute node
- 1 `slurmrestd` node: the REST API interface to Slurm
- 1 `percona-cluster` node: the MySQL database

## Documentation

Please visit the [OSD documentation](https://omnivector-solutions.github.io/osd-documentation/master/)
for extended details on how to operate, extend, and scale Slurm using OSD.

## Contact

**We want to hear from you!**

Email us @ [info@omnivector.solutions](mailto:info@omnivector.solutions)

## Bugs

In the case things aren't working as expected, please
[file a bug](https://github.com/omnivector-solutions/slurm-charms/issues).

## License

The Slurm charms are maintained under the MIT license. See `LICENSE` file in
this directory for full preamble.

Copyright &copy; Omnivector Solutions 2021 - 2022.
