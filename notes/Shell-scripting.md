## [Using the terminal to navigate through directories](https://help.ubuntu.com/community/UsingTheTerminal)

Changing directories using `cd`:

- To navigate into the root directory: `cd /`
- To navigate to your home directory: `cd` or `cd ~`
- To navigate up one directory level: `cd ..`
- To navigate to the previous directory (or back): `cd -`

## [Finding files](https://www.lifewire.com/how-to-open-command-prompt-2618089)

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

## [Copy files from one directory to another, ignoring all .files and .dirs](https://stackoverflow.com/a/11557164)

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

## [Running commands stored in a file](https://stackoverflow.com/a/13568021)

```sh
bash file
```

## [Saving the output of a terminal command to a file](https://askubuntu.com/a/420983)

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

## [Running multiple commands in a single line](https://stackoverflow.com/q/5130847)

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

## Sed

Note that the `-i.bak` option will create a backup of the original file.

### [Replace a string in a file](https://unix.stackexchange.com/q/26284)

```sh
sed -i.bak "s/string to be replaced/replacement/g" filename.txt
```

Replace part of a string:

```sh
sed -i.bak "s/^string.*$/replacement/" filename.txt
```

### [Substituting a string](https://www.unix.com/shell-programming-and-scripting/266684-using-sed-find-append-insert-same-line.html)

```sh
sed -i.bak "s/OK$/_DLY-&/" filename.txt
```

- `$` will ensure only `OK`s at the end of the line are affected
- `&` will append the string to be replaced, i.e. `OK`, resulting in `_DLY-OK`

### [Delete specific lines from a text file](https://stackoverflow.com/a/2112496)

```sh
sed -i.bak "<lines_to_delete>" filename.txt
```

`<lines_to_delete>`:

- line 5: `5d`
- lines 5 to 10: `5,10d`
- lines 5 and 10: `5d;10d`
- lines 5 to 10, and 12: `5,10d;12d`
- line 5 to the final line: `5,$d`

### [Inserting text in a new line before or after a string](https://unix.stackexchange.com/q/121161)

After:

```sh
sed -i.bak "/pattern/a some text here" filename.txt
```

Before:

```sh
sed -i.bak "/pattern/i some text here" filename.txt
```

## Grep

### [Delete all lines containing a string in a file](https://stackoverflow.com/a/13188531)

```sh
grep -v "string to delete" filename.txt > filename_temp.txt
mv filename_temp.txt filename.txt
```
