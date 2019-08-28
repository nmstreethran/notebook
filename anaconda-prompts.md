# Anaconda prompts <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Searching for packages](#searching-for-packages)
- [Managing environments](#managing-environments)
- [Installing packages](#installing-packages)
- [Viewing a list of installed packages](#viewing-a-list-of-installed-packages)
- [Updating packages](#updating-packages)
- [Removing packages](#removing-packages)
- [References](#references)

## Searching for packages

To see if a specific package is available for installation:

```shell
conda search package
```

To see if a specific package is available for installation from Anaconda.org:

```shell
conda search --override-channels --channel defaults package
```

To see if a specific package exists in a specific channel and is available for installation:

```shell
conda search --override-channels --channel http://channel.url package
```

## Managing environments

Creating a new environment:

```shell
conda create -n yourenvname python=x.y
```

Activating an environment:

```shell
activate yourenvname
```

Deactivating an environment:

```shell
deactivate
```

## Installing packages

To install a specific package into an existing environment:

```shell
conda install --name myenv package
```

If you do not specify the environment name, the package installs into the current environment:

```shell
conda install package
```

To install a specific version of a package:

```shell
conda install package=x.y.z
```

To install multiple packages at once:

```shell
conda install package1 package2
```

To install multiple packages at once and specify the version of the package:

```shell
conda install package1=x1.y1.z1 package2=x2.y2.z2
```

To install a package for a specific Python version:

```shell
conda install package1=x1.y1.z1 package2=x2.y2.z2 -n py34_env
```

Installing packages from Anaconda.org:

```shell
conda install -c channelname package
```

Installing non-conda packages:

```shell
pip install package
```

Installing commercial packages:

```shell
conda install --name myenv package
```

## Viewing a list of installed packages

To list all of the packages in the active environment:

```shell
conda list
```

To list all of the packages in a deactivated environment:

```shell
conda list -n myenv
```

## Updating packages

To update a specific package:

```shell
conda update packagename
```

To update Python:

```shell
conda update python
```

To update the Anaconda metapackage:

```shell
conda update conda
conda update anaconda
``` 

Update all installed packages: 

```shell
conda update --all
```

Update all packages unprompted:

```shell
conda update --all -y
```

List packages that can be updated:

```shell
conda search --outdated
```

## Removing packages

To remove a package in an environment :

```shell
conda remove -n myenv package
```

To remove a package in the current environment:

```shell
conda remove package
```

To remove multiple packages at once:

```shell
conda remove package1 package2
```

To confirm that a package has been removed:

```shell
conda list
```

## References

1. https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/index.html
2. https://pythonfix.com/code/conda-upgrade-all/
