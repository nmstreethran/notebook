# Python package management <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Anaconda](#anaconda)
  - [Searching for packages](#searching-for-packages)
  - [Managing environments](#managing-environments)
  - [Installing packages](#installing-packages)
  - [Viewing a list of installed packages](#viewing-a-list-of-installed-packages)
  - [Updating packages](#updating-packages)
  - [Removing packages](#removing-packages)
  - [Fix `NotWritableError`](#fix-notwritableerror)
- [Python](#python)
  - [Getting a list of locally installed packages](#getting-a-list-of-locally-installed-packages)
  - [Updating packages](#updating-packages-1)
  - [Virtual environments](#virtual-environments)
  - [Installing for a specific Python version](#installing-for-a-specific-python-version)
  - [Uninstalling packages](#uninstalling-packages)
  - [Prevent conda from activating the base environment by default](#prevent-conda-from-activating-the-base-environment-by-default)
  - [Environment error](#environment-error)
  - [Fixing `error: invalid command 'bdist_wheel'`](#fixing-error-invalid-command-bdist_wheel)
- [Creating a requirements file](#creating-a-requirements-file)
- [References](#references)

## Anaconda

### Searching for packages

To see if a specific package is available for installation:

```sh
conda search package
```

To see if a specific package is available for installation from Anaconda:

```sh
conda search --override-channels --channel defaults package
```

To see if a specific package exists in a specific channel and is available for installation:

```sh
conda search --override-channels --channel <channel url> package
```

### Managing environments

Creating a new environment:

```sh
conda create --name yourenvname python=x.y
```

Activating an environment:

```sh
conda activate yourenvname
```

Deactivating an environment:

```sh
conda deactivate
```

Viewing a list of environments:

```sh
conda info --envs
```

or:

```sh
conda env list
```

Removing an environment:

```sh
conda remove --name myenv --all
```

### Installing packages

To install a specific package into an existing environment:

```sh
conda install --name myenv package
```

If you do not specify the environment name, the package installs into the current environment:

```sh
conda install package
```

To install a specific version of a package:

```sh
conda install package=x.y.z
```

To install multiple packages at once:

```sh
conda install package1 package2
```

To install multiple packages at once and specify the version of the package:

```sh
conda install package1=x1.y1.z1 package2=x2.y2.z2
```

To install a package for a specific Python version:

```sh
conda install package1=x1.y1.z1 package2=x2.y2.z2 -n py34_env
```

Installing packages from Anaconda:

```sh
conda install -c channelname package
```

Installing non-conda packages:

```sh
pip install packagename
```

[**Note:**](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#using-pip-in-an-environment)

> - Use pip only after conda
>   - Install as many requirements as possible with conda then use pip
>   - Pip should be run with `--upgrade-strategy only-if-needed` (the default)
>   - Do not use pip with the `--user argument`, avoid all "users" installs
>
> - Use conda environments for isolation
>   - Create a conda environment to isolate any changes pip makes
>   - Environments take up little space thanks to hard links
>   - Care should be taken to avoid running pip in the “root” environment
>
> - Recreate the environment if changes are needed
>   - Once pip has been used, conda will be unaware of the changes
>   - To install additional conda packages, it is best to recreate the environment
>
> - Store conda and pip requirements in text files
>   - Package requirements can be passed to conda via the `--file` argument
>   - Pip accepts a list of Python packages with `-r` or `--requirements`
>   - Conda env will export or create environments based on a file with conda and pip requirements

Installing commercial packages:

```sh
conda install --name myenv package
```

### Viewing a list of installed packages

To list all of the packages in the active environment:

```sh
conda list
```

To list all of the packages in a deactivated environment:

```sh
conda list -n myenv
```

### Updating packages

To update a specific package:

```sh
conda update packagename
```

To update Python:

```sh
conda update python
```

To update the Anaconda metapackage:

```sh
conda update conda
conda update anaconda
```

Update all installed packages:

```sh
conda update --all
```

Update all packages unprompted:

```sh
conda update --all -y
```

List packages that can be updated:

```sh
conda search --outdated
```

### Removing packages

To remove a package in an environment :

```sh
conda remove -n myenv package
```

To remove a package in the current environment:

```sh
conda remove package
```

To remove multiple packages at once:

```sh
conda remove package1 package2
```

To confirm that a package has been removed:

```sh
conda list
```

### Fix `NotWritableError`

[Remove root ownership of Anaconda folder](https://stackoverflow.com/a/57144988/4573584):

```sh
sudo chown -R $USER:$USER anaconda3
```

## Python

### [Getting a list of locally installed packages](https://stackoverflow.com/q/739993/4573584)

In a Python shell:

```py
help('modules')
```

or:

```py
pydoc modules
```

Using pip:

```sh
pip list
```

### [Updating packages](https://stackoverflow.com/a/44412503/4573584)

```sh
pip list --outdated
```

[Finding pip version](https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/#linux-and-macos):

```sh
python3 -m pip --version
```

### [Virtual environments](https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/)

Installing `virtualenv`:

```sh
python3 -m pip install --user virtualenv
```

Creating a virtual environment (`virtualenv` not needed -- `venv` is part of Python's base):

```sh
python3 -m venv env
```

Activating a virtual environment:

```sh
source env/bin/activate
```

Leaving the virtual environment:

```sh
deactivate
```

### Installing for a specific Python version

```sh
pip3 install package
```

or:

```sh
python3 -m pip install package
```

### [Uninstalling packages](https://stackoverflow.com/a/3297564/4573584)

```sh
pip uninstall package
```

### Prevent conda from activating the base environment by default

<https://stackoverflow.com/questions/54429210/how-do-i-prevent-conda-from-activating-the-base-environment-by-default>

### [Environment error](https://stackoverflow.com/a/50893981/4573584)

```sh
ERROR: Could not install packages due to an EnvironmentError: [Errno 13] Permission denied: '/installation/path/'
Consider using the `--user` option or check the permissions.
```

Fixed using:

```sh
pip3 install --user package-name  # for Python3
pip install --user package-name   # for Python2
```

### Fixing `error: invalid command 'bdist_wheel'`

Installing `wheel` fixes the issue:

```sh
pip install wheel
```

Upgrading `pip` or `setuptools`, or reinstalling `wheel` could also potentially fix it.

The issue could be caused by the absence of `setup_requires=['wheel']` in `setup.py`.

See <https://stackoverflow.com/q/34819221/4573584> for more information.

## Creating a requirements file

Using [PIP Chill](https://pip-chill.readthedocs.io/en/latest/), which lists only the packages that are not dependencies of installed packages. This is an alternative to `pip freeze`.

Version 1.0.1 of PIP Chill has the following options:

```text
# pip-chill --help
usage: pip-chill [-h] [--no-version] [--no-chill] [-a] [-v]

Like `pip freeze`, but more relaxed.

optional arguments:
  -h, --help            show this help message and exit
  --no-version          omit version numbers.
  --no-chill            don't show installed pip-chill.
  -a, --all, --show-all
                        show all packages.
  -v, --verbose         list commented out dependencies too.
```

To save the output of PIP Chill as requirements.txt:

```sh
pip-chill --no-chill > requirements.txt
```

Install PIP Chill via pip:

```sh
pip install pip-chill
```

The requirements file generated through PIP Chill can be used to install all dependencies via both pip and conda:

```sh
# using pip
pip install -r requirements.txt

# using conda
conda create --file requirements.txt
```

## References

1. <https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/index.html>
2. <https://pythonfix.com/code/conda-upgrade-all/>
3. <https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html>
4. <https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/>
