# Manjaro packages

To get a list of foreign packages and save it as a file:

```sh
pamac list --foreign --quiet > aur.txt
# or
pamac list -m -q > aur.txt
```

To get a list of explicitly installed packages:

```sh
pamac list --explicitly-installed
# or
pamac list -e
```
