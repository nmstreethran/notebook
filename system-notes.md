# System notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->
- [Setting or changing the PATH system variable](#setting-or-changing-the-path-system-variable)
- [Turn on or off secure boot](#turn-on-or-off-secure-boot)
- [Linux](#linux)
  - [Fix Grub menu not showing for Windows 10 dual boot](#fix-grub-menu-not-showing-for-windows-10-dual-boot)

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

* [Radeon Software for Linux Installation](https://www.amd.com/en/support/kb/release-notes/AMDGPU-INSTALLATION)
* [Radeon™ Software for Linux® 18.20 Release Notes](https://www.amd.com/en/support/kb/release-notes/rn-prorad-lin-18-20)
* [VSCodium installation](https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo)

### [Fix Grub menu not showing for Windows 10 dual boot](https://itsfoss.com/no-grub-windows-linux/)

Run shell (Command Prompt with admin rights) and the command below

```shell
bcdedit /set {bootmgr} path \EFI\ubuntu\grubx64.efi
```

If this command did not work, reverse it:

```shell
bcdedit /deletevalue {bootmgr} path \EFI\ubuntu\grubx64.efi
```

This command sets the boot back to Windows, if the commands above did not work:

```shell
bcdedit /set {bootmgr} path \EFI\Microsoft\Boot\bootmgfw.efi
```