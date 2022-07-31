# Linux

## Packages

To get a list of foreign packages and save it as a file:

```sh
pacman -Qqem > .linux/pkgs-aur.txt
```

To get a list of explicitly installed packages:

```sh
pacman -Qqen > .linux/pkgs.txt
```

## Settings

- `.zshrc` copied to `.linux/.zshrc`
- Konsole profiles (`~/.local/share/konsole/*.profile`) - copied to `.linux/konsole/`
- KDE global configurations (`~/.kde4/share/config/kdeglobals`) - copied to `.linux/kdeglobals.conf`
- Okular configurations (`~/.local/share/kxmlgui5/okular/part.rc`) - copied to `.linux/okular-part.xml`

## Installation

- Create a new partition of about 50 GB
- Create a small partition of about 4 GB for the swap
- Disable secure boot
- Download the Arch Linux ISO and https://wiki.archlinux.org/title/USB_flash_installation_medium:

  ```sh
  sudo bash -c "cat path/to/archlinux-version-x86_64.iso > /dev/sdx"
  ```

  See [this comparison](https://unix.stackexchange.com/questions/224277/is-it-better-to-use-cat-dd-pv-or-another-procedure-to-copy-a-cd-dvd) of command line utilities for the copying process.

  Note that the USB flash drive must be unmounted. Check the name of the USB drive using `lsblk`.

- Connect computer to the internet using an ethernet cable
- Follow the steps in `.linux/archlinux-install.sh`
- See <https://wiki.archlinux.org/title/Installation_guide> for more info
