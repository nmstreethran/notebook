# Shell scripting notes <!-- omit in toc -->

Shell scripts and commands, including Bash, AWK, sed, grep.

## Table of contents <!-- omit in toc -->

- [Using the terminal to navigate through directories](#using-the-terminal-to-navigate-through-directories)
- [Finding files](#finding-files)
- [Copy files from one directory to another, ignoring all .files and .dirs](#copy-files-from-one-directory-to-another-ignoring-all-files-and-dirs)
- [Copy all files with a certain name or extension from one directory into another](#copy-all-files-with-a-certain-name-or-extension-from-one-directory-into-another)
- [Get a list of folder names in a directory and save to file](#get-a-list-of-folder-names-in-a-directory-and-save-to-file)
- [Copy a file](#copy-a-file)
- [Rename a file or directory](#rename-a-file-or-directory)
- [Delete a file](#delete-a-file)
- [Delete a directory](#delete-a-directory)
- [Running commands stored in a file](#running-commands-stored-in-a-file)
- [Saving the output of a terminal command to a file](#saving-the-output-of-a-terminal-command-to-a-file)
- [Running multiple commands in a single line](#running-multiple-commands-in-a-single-line)
- [Using the home directory](#using-the-home-directory)
- [Replace a string in a file](#replace-a-string-in-a-file)
- [Delete all lines containing a string in a file](#delete-all-lines-containing-a-string-in-a-file)

## [Using the terminal to navigate through directories](https://help.ubuntu.com/community/UsingTheTerminal)

Changing directories using `cd`:

- To navigate into the root directory: `cd /`
- To navigate to your home directory: `cd` or `cd ~`
- To navigate up one directory level: `cd ..`
- To navigate to the previous directory (or back): `cd -`

## [Finding files](https://www.lifewire.com/uses-of-linux-command-find-2201100)

Searching in the current active path:

```sh
find filename
```

Searching the entire drive:

```sh
find / filename
```

Searching in the current folder:

```sh
find . filename
```

## [Copy files from one directory to another, ignoring all .files and .dirs](https://stackoverflow.com/a/11557164/4573584)

```sh
cp -r SRC_DIR/* DEST_DIR
```

## Copy all files with a certain name or extension from one directory into another

```sh
cp -a SRC_DIR/*notes.md DEST_DIR
```

## Get a list of folder names in a directory and save to file

```sh
# using -1d to specify depth
ls -1d SRC_DIR/*/ | awk -F "/" "{print \$(NF-1)}" > DEST_DIR/filename.txt
```

## Copy a file

```sh
cp file1.txt DEST_DIR/file2.txt
```

## Rename a file or directory

```sh
mv oldname.txt newname.txt
mv OLDNAME NEWNAME
```

## Delete a file

```sh
rm file.txt
```

## Delete a directory

```sh
rm -r DIR
```

## [Running commands stored in a file](https://stackoverflow.com/a/13568021/4573584)

```sh
bash file
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

## Using the home directory

```sh
$HOME
```

## [Replace a string in a file](https://www.cyberciti.biz/faq/how-to-use-sed-to-find-and-replace-text-in-files-in-linux-unix-shell/)

```sh
sed -i -e "s/string to be replaced/replacement/g" filename.txt
```

## [Delete all lines containing a string in a file](https://stackoverflow.com/a/13188531/4573584)

```sh
grep -v "string to delete" filename.txt > filename_temp.txt
mv filename_temp.txt filename.txt
```
