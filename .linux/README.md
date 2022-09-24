# Linux

```text
$ neofetch
                   -`                    nms@nms-msi-archlinux
                  .o+`                   ---------------------
                 `ooo/                   OS: Arch Linux x86_64
                `+oooo:                  Host: GF63 Thin 11UD REV:1.0
               `+oooooo:                 Kernel: 5.15.63-1-lts
               -+oooooo+:                Uptime: 7 days, 7 mins
             `/:-:++oooo+:               Packages: 1095 (pacman)
            `/++++/+++++++:              Shell: bash 5.1.16
           `/++++++++++++++:             Resolution: 1920x1080
          `/+++ooooooooooooo/`           DE: Plasma 5.25.4
         ./ooosssso++osssssso+`          WM: KWin
        .oossssso-````/ossssss+`         Theme: [Plasma], Breeze [GTK2/3]
       -osssssso.      :ssssssso.        Icons: Papirus-Dark [Plasma], Papirus-Dark [GTK2/3]
      :osssssss/        osssso+++.       Terminal: yakuake
     /ossssssss/        +ssssooo/-       CPU: 11th Gen Intel i7-11800H (16) @ 4.600GHz
   `/ossssso+/:-        -:/+osssso+-     GPU: Intel TigerLake-H GT1 [UHD Graphics]
  `+sso+:-`                 `.-/+oso:    GPU: NVIDIA GeForce RTX 3050 Ti Mobile
 `++:.                           `-/+/   Memory: 4765MiB / 7650MiB
 .`                                 `/
```

## Packages

To get a list of foreign packages and save it as a file:

```sh
pacman -Qqem > .linux/pkgs-aur.txt
```

To get a list of explicitly installed packages:

```sh
pacman -Qqen > .linux/pkgs.txt
```

## Installation

- Create a new partition of about 50 GB
- Create a small partition of about 4 GB for the swap
- Disable secure boot
- Download the Arch Linux ISO and [create an installation medium using a USB flash drive](https://wiki.archlinux.org/title/USB_flash_installation_medium):

  ```sh
  sudo bash -c "cat path/to/archlinux-version-x86_64.iso > /dev/sdx"
  ```

  See [this comparison](https://unix.stackexchange.com/questions/224277/is-it-better-to-use-cat-dd-pv-or-another-procedure-to-copy-a-cd-dvd) of command line utilities for the copying process.

  Note that the USB flash drive must be unmounted. Check the name of the USB drive using `lsblk`.

- Connect computer to the internet using an ethernet cable
- Follow the steps in `.linux/archlinux-install.sh`
- See <https://wiki.archlinux.org/title/Installation_guide> for more info
- When logged in to Windows, open Disk Management and unassign any drive letters for the two Linux partitions
- Also open power management and turn off all hibernate options. Then, open PowerShell with administrative rights, and [run](https://learn.microsoft.com/en-us/troubleshoot/windows-client/deployment/disable-and-re-enable-hibernation) `powercfg.exe /hibernate off`. This will prevent Windows from blocking write access to drives when logged in to Linux.
