# Omnivector Slurm Distribution Bundles

This suite provides a set of codified operations to assemble, install, deploy,
and operate Slurm.

## Overview

The [Slurm Charms](https://github.com/omnivector-solutions/slurm-charms/) are a
custom curated suite of tools and automation that facilitate the lifecycle
events and continuous operation of a Slurm cluster.

Assuming you have Juju installed and bootstrapped, deploying a Slurm cluster
involves running only a single command:

```bash
$ juju deploy slurm
```

This command will deploy and configure a Slurm cluster with one of each of the
following components:
- `slurmctld` node: the central management node
- `slurmdbd` node: the database accounting node
- `slurmd` node: the compute node
- `slurmrestd` node: the REST API interface to Slurm
- `percona-cluster` node: the MySQL database

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

The Slurm charms are maintained under the Apache-2.0 license. See `LICENSE` file in
this directory for full preamble.

Copyright &copy; Omnivector Solutions 2021 - 2023.
