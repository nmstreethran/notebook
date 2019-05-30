# System notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->
- [Setting or changing the PATH system variable](#setting-or-changing-the-path-system-variable)
- [Turn on or off secure boot](#turn-on-or-off-secure-boot)
- [Linux](#linux)
  - [Using the terminal](#using-the-terminal)
  - [Copy files from one directory to another, ignoring all .files and .dirs](#copy-files-from-one-directory-to-another-ignoring-all-files-and-dirs)
  - [Running commands stored in a file](#running-commands-stored-in-a-file)
  - [Drivers and applications](#drivers-and-applications)
  - [Fix boot order / Grub menu not appearing on startup](#fix-boot-order--grub-menu-not-appearing-on-startup)
  - [Realtek wifi problems](#realtek-wifi-problems)
  - [Making Ubuntu look like Windows](#making-ubuntu-look-like-windows)
  - [File syncing using rclone](#file-syncing-using-rclone)

## [Setting or changing the PATH system variable](https://www.java.com/en/download/help/path.xml)

* The **PATH** is the system variable that your operating system uses to locate needed executables from the command line or Terminal window.
* The **PATH** system variable can be set using **System Utility** in control panel on Windows, or in your shell's startup file on Linux and Solaris.
* In Windows 10, search for 'Edit the system environment variables'
* Click on 'Environment Variables'.
* In the section System Variables, find the **PATH** environment variable and select it. Click Edit. If the **PATH** environment variable does not exist, click New.
* In the Edit System Variable (or New System Variable) window, specify the value of the **PATH** environment variable. Click OK. Close all remaining windows by clicking OK.

## [Turn on or off secure boot](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/disabling-secure-boot)

Open the PC BIOS menu. You can often access this menu by pressing a key during the bootup sequence, such as F1, F2, F12, or Esc.

Or, from Windows: go to **Settings charm** > **Change PC settings** > **Update and Recovery** > **Recovery** > **Advanced Startup: Restart now**. When the PC reboots, go to **Troubleshoot** > **Advanced Options: UEFI Firmware Settings**.

Find the **Secure Boot** setting, and if possible, set it to **Enabled**. This option is usually in either the **Security** tab, the **Boot** tab, or the **Authentication** tab.

## Linux

### [Using the terminal](https://help.ubuntu.com/community/UsingTheTerminal)

Changing directories using `cd`:

* To navigate into the root directory: `cd /`
* To navigate to your home directory: `cd` or `cd ~`
* To navigate up one directory level: `cd ..`
* To navigate to the previous directory (or back): `cd -`

### [Copy files from one directory to another, ignoring all .files and .dirs](https://stackoverflow.com/a/11557164/4573584)

```sh
cp -r SRC_DIR/* DEST_DIR
```

### [Running commands stored in a file](https://stackoverflow.com/a/13568021/4573584)

```sh
bash file
```

### Drivers and applications

* [Radeon Software for Linux Installation](https://www.amd.com/en/support/kb/release-notes/AMDGPU-INSTALLATION)
* [Radeon™ Software for Linux® 18.20 Release Notes](https://www.amd.com/en/support/kb/release-notes/rn-prorad-lin-18-20)
* [VSCodium installation](https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo)

### Fix boot order / Grub menu not appearing on startup 

Windows: go to **Settings charm** > **Change PC settings** > **Update and Recovery** > **Recovery** > **Advanced Startup: Restart now**. When the PC reboots, go to **Troubleshoot** > **Advanced Options: UEFI Firmware Settings**. Change the order of the OS in boot settings.

### Realtek wifi problems

Secure boot should be disabled before installing these drivers.

### [Making Ubuntu look like Windows](https://www.howtogeek.com/353819/how-to-make-ubuntu-look-more-like-windows/)

* [Dash to panel](https://github.com/home-sweet-gnome/dash-to-panel)

### File syncing using rclone

* https://www.techrepublic.com/article/how-to-sync-from-linux-to-google-drive-with-rclone/
* https://github.com/ncw/rclone
* https://rclone.org/
