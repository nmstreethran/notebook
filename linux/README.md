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

## Installation

- Create a new partition of about 70 GB.
- Create a small partition of about 4 GB for the swap.
- Disable secure boot in the UEFI settings.
- Download the Arch Linux ISO and [create an installation medium using a USB flash drive](https://wiki.archlinux.org/title/USB_flash_installation_medium):

  ```sh
  sudo bash -c "cat path/to/archlinux-version-x86_64.iso > /dev/sdx"
  ```

  See [this comparison](https://unix.stackexchange.com/q/224277) of command line utilities for the copying process.

  Note that the USB flash drive must be unmounted. Check the name of the USB drive using `lsblk`.

- Connect computer to the internet using an ethernet cable.
- Follow the steps in `.linux/archlinux-install.sh`. See <https://wiki.archlinux.org/title/Installation_guide> for more info.
- When logged in to Windows:
  - Open Disk Management and unassign any drive letters for the two Linux partitions.
  - For MSI computers, use the MSI Dragon Centre to set battery charging limits.
  - Also open power management and turn off all hibernate options. Then, open PowerShell with administrative rights, and [run](https://learn.microsoft.com/en-us/troubleshoot/windows-client/deployment/disable-and-re-enable-hibernation) `powercfg.exe /hibernate off`. This will prevent Windows from blocking write access to drives when logged in to Linux.
<!-- - [Disable USB autosuspend in TLP](https://wiki.archlinux.org/title/TLP#USB_autosuspend) to allow USB charging. -->

Other considerations:

- Disable [C-states](https://learn.microsoft.com/en-us/previous-versions/windows/desktop/xperf/p-states-and-c-states) if performance issues are encountered
- Have a [separate `/home` directory](https://help.ubuntu.com/community/Partitioning/Home/Moving) - ~20 GB for `/` and ~50 GB for `/home`
