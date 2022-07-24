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

- Create a new partition which is about 50 GB
- Create a small partition for the swap file of about 4 GB
- Disable secure boot
- Download the Arch Linux ISO and copy it to a USB flash drive:

  ```sh
  sudo bash -c "cat path/to/archlinux-version-x86_64.iso > /dev/sdx"
  ```

- Connect computer to the internet using an ethernet cable
- Follow the steps in `.linux/archlinux-install.sh`
- See <https://wiki.archlinux.org/title/Installation_guide> for more info
