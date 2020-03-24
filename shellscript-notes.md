# Shell scripting notes <!-- omit in toc -->

Bash scripts and commands

## Table of contents <!-- omit in toc -->

- [Using the terminal to navigate through directories](#using-the-terminal-to-navigate-through-directories)
- [Copy files from one directory to another, ignoring all .files and .dirs](#copy-files-from-one-directory-to-another-ignoring-all-files-and-dirs)
- [Running commands stored in a file](#running-commands-stored-in-a-file)
- [Python package installation](#python-package-installation)
- [Saving the output of a terminal command to a file](#saving-the-output-of-a-terminal-command-to-a-file)
- [Extracting tarballs](#extracting-tarballs)
- [Running multiple commands in a single line](#running-multiple-commands-in-a-single-line)

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

## [Saving the output of a terminal command to a file](https://askubuntu.com/a/420983/714808)

```sh
SomeCommand > SomeFile.txt
```

To append data:

```sh
SomeCommand >> SomeFile.txt
```

If you want [`stderr`](https://en.wikipedia.org/wiki/Standard_streams#Standard_error_.28stderr.29) as well:

```sh
SomeCommand &> SomeFile.txt
```

`stderr` and append:

```sh
SomeCommand &>> SomeFile.txt
```

`stderr` and output displayed on the console and in a file:

```sh
SomeCommand 2>&1 | tee SomeFile.txt
```

(If you want the output only, drop the `2` above)

## [Extracting tarballs](https://askubuntu.com/a/25962/714808)

```sh
tar xzf file.tar.gz
tar xjf file.tar.bz2
```

To see the files being extracted during unpacking:

```sh
tar xzvf file.tar.gz
```

## [Running multiple commands in a single line](https://stackoverflow.com/q/5130847/4573584)

> `|` pipes (pipelines) the standard output (`stdout`) of one command into the standard input of another one. Note that `stderr` still goes into its default destination, whatever that happen to be.
>
> `|&` pipes both `stdout` and `stderr` of one command into the standard input of another one.
>
> `&&` executes the right-hand command of `&&` only if the previous one succeeded.
>
> `||` executes the right-hand command of `||` only it the previous one failed.
>
> `;` executes the right-hand command of `;` always regardless whether the previous command succeeded or failed. Unless `set -e` was previously invoked, which causes bash to fail on an error.
