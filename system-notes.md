# System notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->
- [Turn on or off secure boot](#turn-on-or-off-secure-boot)
- [Fix boot order / Grub menu not appearing on startup](#fix-boot-order--grub-menu-not-appearing-on-startup)
- [Windows](#windows)
  - [Setting or changing the PATH system variable](#setting-or-changing-the-path-system-variable)
- [Linux](#linux)
  - [Drivers and applications](#drivers-and-applications)
  - [Realtek wifi problems](#realtek-wifi-problems)
  - [Making Ubuntu look like Windows](#making-ubuntu-look-like-windows)
  - [File syncing using rclone](#file-syncing-using-rclone)
  - [Adding directory to PATH](#adding-directory-to-path)
  - [What to do when Ubuntu freezes](#what-to-do-when-ubuntu-freezes)
  - [Globally customise system UI font on Ubuntu](#globally-customise-system-ui-font-on-ubuntu)


## [Turn on or off secure boot](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/disabling-secure-boot)

Open the PC BIOS menu. You can often access this menu by pressing a key during the bootup sequence, such as F1, F2, F12, or Esc.

Or, from Windows: go to **Settings charm** > **Change PC settings** > **Update and Recovery** > **Recovery** > **Advanced Startup: Restart now**. When the PC reboots, go to **Troubleshoot** > **Advanced Options: UEFI Firmware Settings**.

Find the **Secure Boot** setting, and if possible, set it to **Enabled**. This option is usually in either the **Security** tab, the **Boot** tab, or the **Authentication** tab.


## Fix boot order / Grub menu not appearing on startup 

Windows: go to **Settings charm** > **Change PC settings** > **Update and Recovery** > **Recovery** > **Advanced Startup: Restart now**. When the PC reboots, go to **Troubleshoot** > **Advanced Options: UEFI Firmware Settings**. Change the order of the OS in boot settings.


## Windows

### [Setting or changing the PATH system variable](https://www.java.com/en/download/help/path.xml)

* The **PATH** is the system variable that your operating system uses to locate needed executables from the command line or Terminal window.
* The **PATH** system variable can be set using **System Utility** in control panel on Windows.
* In Windows 10, search for 'Edit the system environment variables'
* Click on 'Environment Variables'.
* In the section System Variables, find the **PATH** environment variable and select it. Click Edit. If the **PATH** environment variable does not exist, click New.
* In the Edit System Variable (or New System Variable) window, specify the value of the **PATH** environment variable. Click OK. Close all remaining windows by clicking OK.


## Linux 

### Drivers and applications

* [Radeon Software for Linux Installation](https://www.amd.com/en/support/kb/release-notes/AMDGPU-INSTALLATION)
* [Radeon™ Software for Linux® 18.20 Release Notes](https://www.amd.com/en/support/kb/release-notes/rn-prorad-lin-18-20)
* [VSCodium installation](https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo)


### Realtek wifi problems

Secure boot should be disabled before installing these drivers.


### [Making Ubuntu look like Windows](https://www.howtogeek.com/353819/how-to-make-ubuntu-look-more-like-windows/)

* [Dash to panel](https://github.com/home-sweet-gnome/dash-to-panel)


### File syncing using rclone

* https://www.techrepublic.com/article/how-to-sync-from-linux-to-google-drive-with-rclone/
* https://github.com/ncw/rclone
* https://rclone.org/


### [Adding directory to PATH](https://askubuntu.com/a/688998/714808)

These are added to the `.bashrc` (shell startup) file, which can be found in the Home directory.

```sh
echo export PATH=\"$(echo path/to/file/):\$PATH\" >> ~/.bashrc
```


### [What to do when Ubuntu freezes](https://askubuntu.com/a/36717/714808)

If it's completely frozen, REISUB it (safer than rebooting)

> While holding `Alt` and the `SysReq` (Print Screen) keys, type `R` `E` `I` `S` `U` `B`.

```
R:  Switch to XLATE mode
E:  Send Terminate signal to all processes except for init
I:  Send Kill signal to all processes except for init
S:  Sync all mounted file-systems
U:  Remount file-systems as read-only
B:  Reboot
```

> REISUB is BUSIER backwards, as in "The System is **busier** than it should be", if you need to remember it. Or mnemonically - **R**eboot; **E**ven; **I**f; **S**ystem; **U**tterly; **B**roken.

> **NOTE:** There exists less radical way than rebooting the whole system. If `SysReq` key works, you can kill processes one-by-one using `Alt`+`SysReq`+`F`. Kernel will kill the mostly «expensive» process each time. If you want to kill all processes for one console, you can issue `Alt`+`SysReq`+`K`.


### [Globally customise system UI font on Ubuntu](https://github.com/Microsoft/vscode/issues/10144#issuecomment-337490205)

Paste the following in your local font configuration file (`/etc/fonts/conf.avail/local.conf`) and replace `Lato` with the font of your choice:

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
	<!-- Load local system customization file -->
	<match target="pattern"> 
		<test qual="any" name="family"><string>Ubuntu</string></test>
		<edit name="family" mode="assign" binding="same"><string>Lato</string></edit>
	</match>	
	<include ignore_missing="yes">local.conf</include>
</fontconfig>
```
