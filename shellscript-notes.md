# Shell scripting notes <!-- omit in toc -->

Bash scripts and commands

## Table of contents <!-- omit in toc -->

- [Using the terminal to navigate through directories](#using-the-terminal-to-navigate-through-directories)
- [Copy files from one directory to another, ignoring all .files and .dirs](#copy-files-from-one-directory-to-another-ignoring-all-files-and-dirs)
- [Running commands stored in a file](#running-commands-stored-in-a-file)
- [Python package installation](#python-package-installation)

## [Using the terminal to navigate through directories](https://help.ubuntu.com/community/UsingTheTerminal)

Changing directories using `cd`:

- To navigate into the root directory: `cd /`
- To navigate to your home directory: `cd` or `cd ~`
- To navigate up one directory level: `cd ..`
- To navigate to the previous directory (or back): `cd -`

## [Copy files from one directory to another, ignoring all .files and .dirs](https://stackoverflow.com/a/11557164/4573584)

```sh
cp -r SRC_DIR/* DEST_DIR
```

## [Running commands stored in a file](https://stackoverflow.com/a/13568021/4573584)

```sh
bash file
```

## [Python package installation](https://stackoverflow.com/a/50893981/4573584)

```sh
ERROR: Could not install packages due to an EnvironmentError: [Errno 13] Permission denied: '/installation/path/'
Consider using the `--user` option or check the permissions.
```

Fixed using:

```sh
pip3 install --user package-name  # for Python3
pip install --user package-name   # for Python2
```
