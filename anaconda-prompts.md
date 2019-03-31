# Anaconda prompts

## Searching for packages

To see if a specific package is available for installation:

`conda search package`

To see if a specific package is available for installation from Anaconda.org:

`conda search --override-channels --channel defaults package`

To see if a specific package exists in a specific channel and is available for installation:

`conda search --override-channels --channel http://channel.url package`

## Managing environments

Creating a new environment:

`conda create -n yourenvname python=x.y`

Activating an environment:

`activate yourenvname`

Deactivating an environment:

`deactivate`

## Installing packages

To install a specific package into an existing environment:

`conda install --name myenv package`

If you do not specify the environment name, the package installs into the current environment:

`conda install package`

To install a specific version of a package:

`conda install package=x.y.z`

To install multiple packages at once:

`conda install package1 package2`

To install multiple packages at once and specify the version of the package:

`conda install package1=x1.y1.z1 package2=x2.y2.z2`

To install a package for a specific Python version:

`conda install package1=x1.y1.z1 package2=x2.y2.z2 -n py34_env`

Installing packages from Anaconda.org:

`conda install -c channelname package`

Installing non-conda packages:

`pip install package`

Installing commercial packages:

`conda install --name myenv package`

## Viewing a list of installed packages

To list all of the packages in the active environment:

`conda list`

To list all of the packages in a deactivated environment:

`conda list -n myenv`

## Updating packages

To update a specific package:

`conda update packagename`

To update Python:

`conda update python`

To update the Anaconda metapackage:

```
conda update conda
conda update anaconda
``` 

Update all installed packages: 

`conda update --all`

Update all packages unprompted:

`conda update --all -y`

List packages that can be updated:

`conda search --outdated`

## Removing packages

To remove a package in an environment :

`conda remove -n myenv package`

To remove a package in the current environment:

`conda remove package`

To remove multiple packages at once:

`conda remove package1 package2`

To confirm that a package has been removed:

`conda list`

## Sources 

https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/index.html
https://pythonfix.com/code/conda-upgrade-all/