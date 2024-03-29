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
conda search --override-channels --channel ${channel-url} package
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
python -m pip install packagename
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
>   - Care should be taken to avoid running pip in the "root" environment
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

### Desktop shortcut

Example with `qgis`:

1.  Create a shell script, e.g. `~/bin/launch_qgis.sh`:

    ```sh
    #! /bin/bash

    conda activate py-geo && qgis
    ```

2.  Create a desktop file, e.g. `~/.local/share/applications/qgis.desktop`; copy and paste the programme's desktop configuration. Modify the configurations with the following (may have to remove the `TryExec` line if it exists):

    ```conf
    Exec=bash -i ~/bin/launch_qgis.sh
    Terminal=true
    ```

## Python

### [Getting a list of locally installed packages](https://stackoverflow.com/q/739993)

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

### [Updating packages](https://stackoverflow.com/a/44412503)

```sh
pip list --outdated
```

[Finding pip version](https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/):

```sh
python3 -m pip --version
```

### [Virtual environments](https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/)

Installing `virtualenv`:

```sh
python -m pip install --user virtualenv
```

Creating and activating a virtual environment (`virtualenv` not needed -- `venv` is part of Python's base):

On Linux:

```sh
python3 -m venv env
source env/bin/activate
```

On Windows:

```ps1
py -3 -m venv env
.\env\Scripts\activate
```

Leaving the virtual environment:

```sh
deactivate
```

### Installing for a specific Python version

```sh
python3 -m pip install package
```

[On Windows:](https://stackoverflow.com/a/13211456)

- `py -3` for latest version of Python 3
- `py -3.x` for a specific version of Python 3

### [Uninstalling packages](https://stackoverflow.com/a/3297564)

```sh
pip uninstall package
```

### Prevent conda from activating the base environment by default

<https://stackoverflow.com/q/54429210>

### [Environment error](https://stackoverflow.com/a/50893981)

```sh
ERROR: Could not install packages due to an EnvironmentError: [Errno 13] Permission denied: '/installation/path/'
Consider using the `--user` option or check the permissions.
```

Fixed using:

```sh
python -m pip install --user package-name
```

### Fixing `error: invalid command 'bdist_wheel'`

Installing `wheel` fixes the issue:

```sh
python -m pip install wheel
```

Upgrading `pip` or `setuptools`, or reinstalling `wheel` could also potentially fix it.

The issue could be caused by the absence of `setup_requires=['wheel']` in `setup.py`.

See <https://stackoverflow.com/q/34819221> for more information.

## requirements.txt

The requirements file can be used to install all dependencies via both pip and conda:

```sh
# using pip
python -m pip install -r requirements.txt

# using conda
conda create --file requirements.txt
```

## References

1. <https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/index.html>
2. <https://pythonfix.com/code/conda-upgrade-all/>
3. <https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html>
4. <https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/>
