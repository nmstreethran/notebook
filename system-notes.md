# System notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Turn on or off secure boot](#turn-on-or-off-secure-boot)
- [Fix boot order / Grub menu not appearing on startup](#fix-boot-order--grub-menu-not-appearing-on-startup)
- [Booting into a USB device using Grub2](#booting-into-a-usb-device-using-grub2)
- [Changing default Grub boot OS](#changing-default-grub-boot-os)
- [Windows](#windows)
  - [Setting or changing the PATH system variable](#setting-or-changing-the-path-system-variable)
  - [Securely delete files on Windows 10 without third-party tools](#securely-delete-files-on-windows-10-without-third-party-tools)
  - [Closing windows that are open](#closing-windows-that-are-open)
  - [Editing hosts file - Windows 10](#editing-hosts-file---windows-10)
  - [Resetting PC on Windows 10](#resetting-pc-on-windows-10)
  - [Computer shuts down or hibernates immediately after waking from sleep](#computer-shuts-down-or-hibernates-immediately-after-waking-from-sleep)
- [Linux](#linux)
  - [Adding directory to PATH environment variables](#adding-directory-to-path-environment-variables)
  - [Editing hosts file - Ubuntu](#editing-hosts-file---ubuntu)
  - [What to do when Ubuntu freezes](#what-to-do-when-ubuntu-freezes)
  - [Changing the default display manager](#changing-the-default-display-manager)
  - [Installing Firefox Developer Edition](#installing-firefox-developer-edition)
  - [CheckInstall](#checkinstall)
  - [Uninstalling software](#uninstalling-software)
  - [Useful packages](#useful-packages)
  - [Handling held back packages](#handling-held-back-packages)
  - [Installing Zotero](#installing-zotero)
  - [Creating and extracting archives](#creating-and-extracting-archives)
  - [Installing from an archive](#installing-from-an-archive)
  - [Automount hard disks on boot](#automount-hard-disks-on-boot)
  - [Preventing applications from launching on boot](#preventing-applications-from-launching-on-boot)
  - [Fixing 'Setting locale failed'](#fixing-setting-locale-failed)
  - [Snap / Flatpak sandboxing issues](#snap--flatpak-sandboxing-issues)
  - [Using a custom icon for an application](#using-a-custom-icon-for-an-application)
  - [Troubleshooting WiFi issues](#troubleshooting-wifi-issues)
- [Android](#android)
  - [Finding the list of devices attached via USB using Android SDK tools](#finding-the-list-of-devices-attached-via-usb-using-android-sdk-tools)
  - [ADB commands](#adb-commands)
  - [Flashing Samsung phones - Heimdall vs Odin](#flashing-samsung-phones---heimdall-vs-odin)
  - [Booting devices into bootloader](#booting-devices-into-bootloader)
  - [Using Heimdall to install TWRP](#using-heimdall-to-install-twrp)
  - [Installing TWRP with ADB](#installing-twrp-with-adb)
  - [Using TWRP](#using-twrp)
  - [Links](#links)
- [Old](#old)

## [Turn on or off secure boot](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/disabling-secure-boot)

Open the PC BIOS menu. You can often access this menu by pressing a key during the boot up sequence, such as F1, F2, F12, or Esc.

Or, from Windows: go to **Settings charm** > **Change PC settings** > **Update and Recovery** > **Recovery** > **Advanced Startup: Restart now**. When the PC reboots, go to **Troubleshoot** > **Advanced Options: UEFI Firmware Settings**.

Find the **Secure Boot** setting, and if possible, set it to **Enabled**. This option is usually in either the **Security** tab, the **Boot** tab, or the **Authentication** tab.

## Fix boot order / Grub menu not appearing on startup

Windows: go to **Settings charm** > **Change PC settings** > **Update and Recovery** > **Recovery** > **Advanced Startup: Restart now**. When the PC reboots, go to **Troubleshoot** > **Advanced Options: UEFI Firmware Settings**. Change the order of the OS in boot settings.

## Booting into a USB device using Grub2

The Grub2 command line might show up if you had a dual boot system with Windows 10 and Linux, and the Linux partition has been deleted. This will remove the usual Grub menu which lets you choose between operating systems or UEFI settings. It will not boot into Windows 10 automatically like it did pre-Linux installation, as the master boot record (MBR) has been removed.

This is not an issue for older Windows versions, as the BIOS screen will show up on start up.

If you have not restarted and are still running Windows 10, plug in the USB device and use the advanced startup options in the settings to boot from USB. If you have already restarted, use a Windows 10 installation/recovery medium to restore the MBR. Alternatively, follow the instructions below, which uses the Grub2 command line and do not require a Windows 10 recovery medium.

When creating a bootable USB, note where the `vmlinuz` and `initrd.*` files are located. In my case, it was in `cdrom/casper`.

Plug in the USB and turn on the device.

In the Grub2 command line, use `ls` to get a list of partitions available:

```grub
grub> ls
(hd0) (hd0,msdos5) (hd1) (hd1,msdos0)
```

The root partition of the USB device will probably be the last in the list (i.e, `(hd1,msdos0)`).

Finally, boot the system using the following set of commands:

```grub
grub> linux (hd1,msdos1)/casper/vmlinuz root=/dev/sdb1
grub> initrd (hd1,msdos1)/casper/initrd
grub> boot
```

Source: <https://blog.viktorpetersson.com/2014/07/29/how-to-boot-from-usb-with-grub2.html>

## [Changing default Grub boot OS](https://askubuntu.com/a/110738/714808)

On Linux, create a backup of the Grub file:

```sh
sudo cp /etc/default/grub /etc/default/grub.bak
```

Open `/boot/grub/grub.cfg` which has a `menuentry` for each Grub menu item. Note the name of the `menuentry` which you want to set as default. An example for Windows 7:

```txt
menuentry 'Microsoft Windows XP Professional (on /dev/sda1)' [options] {
```

Open `/etc/default/grub` using a text editor with `sudo` or administrative privileges. Find the line that contains `GRUB_DEFAULT=0`. Replace `0` with the name of the `menuentry` and save the file:

```txt
GRUB_DEFAULT='Microsoft Windows XP Professional (on /dev/sda1)'
```

Finally, update the Grub menu:

```sh
sudo update-grub
```

If anything goes wrong, restore using the backup.

## Windows

### [Setting or changing the PATH system variable](https://www.java.com/en/download/help/path.html)

- The **PATH** is the system variable that your operating system uses to locate needed executables from the command line or Terminal window.
- The **PATH** system variable can be set using **System Utility** in control panel on Windows.
- In Windows 10, search for 'Edit the system environment variables'
- Click on 'Environment Variables'.
- In the section System Variables, find the **PATH** environment variable and select it. Click Edit. If the **PATH** environment variable does not exist, click New.
- In the Edit System Variable (or New System Variable) window, specify the value of the **PATH** environment variable. Click OK. Close all remaining windows by clicking OK.

### [Securely delete files on Windows 10 without third-party tools](https://www.techrepublic.com/article/how-to-securely-and-completely-delete-files-in-windows-10-without-third-party-software/)

Using the [SDelete](https://docs.microsoft.com/en-us/sysinternals/downloads/sdelete) Sysinternals software.

### [Closing windows that are open](https://superuser.com/a/81477/752084)

Ensure the window to be closed is in focus. Press `Alt` + `F4` to close.

### [Editing hosts file - Windows 10](https://www.howtogeek.com/howto/27350/beginner-geek-how-to-edit-your-hosts-file/)

Open `c:\windows\system32\drivers\etc\hosts` as an administrator using a text editor.

### Resetting PC on Windows 10

When reinstalling Windows 10, there are two options:

- keep personal files and remove all apps and settings (refresh)
- remove all personal files, apps, and setting (reset)

When resetting, if there are multiple drives or partitions, it will ask if you want to clear all drives, or only the drive with Windows installed. Selecting the latter will only format the Windows drive.

Source: <https://www.neowin.net/forum/topic/1266840-windows-10-reset-this-pc-will-it-delete-files-on-another-partition/>

### [Computer shuts down or hibernates immediately after waking from sleep](https://www.dell.com/community/Laptops-General-Read-Only/Laptop-shuts-down-immediately-after-waking-from-sleep/td-p/5162536)

This is most likely caused by a critical thermal event, which could happen due to a malfunctioning cooling fan. Check the event viewer.

## Linux

### [Adding directory to PATH environment variables](https://askubuntu.com/a/688998/714808)

These are added to the `.bashrc` (shell startup) file, which can be found in the Home directory.

```sh
echo export PATH=\"$(echo path/to/file/):\$PATH\" >> ~/.bashrc
```

### [Editing hosts file - Ubuntu](https://www.howtogeek.com/howto/27350/beginner-geek-how-to-edit-your-hosts-file/)

Open `/etc/hosts` as an administrator using a text editor.

### [What to do when Ubuntu freezes](https://askubuntu.com/a/36717/714808)

If it's completely frozen, REISUB it (safer than rebooting)

> While holding `Alt` and the `SysReq` (Print Screen) keys, type `R` `E` `I` `S` `U` `B`.
>
> R:  Switch to XLATE mode \
> E:  Send Terminate signal to all processes except for init \
> I:  Send Kill signal to all processes except for init \
> S:  Sync all mounted file-systems \
> U:  Remount file-systems as read-only \
> B:  Reboot
>
> REISUB is BUSIER backwards, as in "The System is **busier** than it should be", if you need to remember it. Or mnemonically - **R**eboot; **E**ven; **I**f; **S**ystem; **U**tterly; **B**roken.
>
> **NOTE:** There exists less radical way than rebooting the whole system. If `SysReq` key works, you can kill processes one-by-one using `Alt`+`SysReq`+`F`. Kernel will kill the mostly «expensive» process each time. If you want to kill all processes for one console, you can issue `Alt`+`SysReq`+`K`.

### [Changing the default display manager](https://askubuntu.com/a/58024/714808)

The following command will create a prompt to select the default display manager (GDM3 in this case):

```sh
sudo dpkg-reconfigure gdm3
```

The same command can be used to [reset the display manager](https://askubuntu.com/q/1043048/714808) should something go wrong with the GUI, or the original CSS files get corrupted.

<https://wiki.archlinux.org/index.php/Display_manager>

### [Installing Firefox Developer Edition](https://askubuntu.com/a/584704/714808)

Firefox Developer Edition will work alongside other Firefox installations with separate profiles.

First, install [Ubuntu Make](https://wiki.ubuntu.com/ubuntu-make):

Using Snap:

```sh
snap install ubuntu-make
```

Using PPA:

```sh
sudo add-apt-repository ppa:lyzardking/ubuntu-make
sudo apt-get update
sudo apt-get install ubuntu-make
```

Then, install Firefox Developer Edition:

```sh
umake web firefox-dev
```

Restart if the application does not appear in the dashboard.

### [CheckInstall](https://help.ubuntu.com/community/CheckInstall)

> CheckInstall keeps track of all files installed by a "make install" or equivalent, creates a Slackware, RPM, or Debian package with those files, and adds it to the installed packages database, allowing for easy package removal or distribution.

Install using:

```sh
sudo apt-get update && sudo apt-get install checkinstall
```

Instead of

```sh
sudo make install
```

you will use

```sh
sudo checkinstall
```

### [Uninstalling software](https://askubuntu.com/a/1144/714808)

If installed via package manager:

```sh
sudo apt-get remove <application_name>
```

To uninstall all related packages and configuration files:

```sh
sudo apt-get purge <package-name>
```

Otherwise, use Synaptic Package Manager, and 'Mark for complete removal'.

### Useful packages

- [HardInfo](https://help.ubuntu.com/community/HardInfo)
- [Ubuntu Make](https://wiki.ubuntu.com/ubuntu-make)
- [Synaptic Package Manager](https://www.nongnu.org/synaptic/)

### [Handling held back packages](https://askubuntu.com/a/602/714808)

`apt-get upgrade` gives `The following packages have been kept back`.

Solution 1:

```sh
sudo apt-get --with-new-pkgs upgrade
```

Solution 2 (replace `packages` with the list of packages held back):

```sh
sudo apt-get install packages
```

### Installing Zotero

Download the tarball from Zotero's [download page](https://www.zotero.org/download/). Extract the contents and move them to a location of your choice, such as `/opt/zotero`. Open the terminal in this location and run `./set_launcher_icon` to update the `zotero.desktop` file for that location. Create a symlink for `zotero.desktop` by running `ln -s "$PWD/zotero.desktop" ~/.local/share/applications/` from the same location. All of these commands can be run in succession from the same terminal window, i.e., `nms@nms-notebook:~/opt/zotero`.

***Note:*** If using a custom icon theme, replace the absolute path for the icon with `zotero` in `./set_launcher_icon` prior to running it.

References:

- <https://www.zotero.org/support/installation>
- <https://askubuntu.com/a/1147073/714808>

### Creating and extracting archives

#### [Extracting tarballs](https://askubuntu.com/a/25962/714808)

```sh
tar xzf file.tar.gz
tar xjf file.tar.bz2
```

To see the files being extracted during unpacking:

```sh
tar xzvf file.tar.gz
```

#### [Extracting ZIP files](https://askubuntu.com/a/86852/714808)

```sh
unzip file.zip -d destination_folder
```

If the source and destination are the same:

```sh
unzip file.zip
```

If `unzip` is not installed:

```sh
sudo apt-get install unzip
```

#### Zipping and unzipping files

- <https://www.howtogeek.com/414082/how-to-zip-or-unzip-files-from-the-linux-terminal/>
- <https://www.ubuntupit.com/how-to-zip-and-unzip-files-on-ubuntu-linux-an-ultimate-guide/>

### [Installing from an archive](https://askubuntu.com/a/1030/714808)

First, extract the archive. Then, open a terminal and navigate to the directory of the extracted folder.

Installation (depends on instructions):

```sh
xdg-open INSTALL
```

### Automount hard disks on boot

For Ubuntu, see <https://www.fosslinux.com/4216/how-to-automount-hard-disk-partitions-in-ubuntu.htm>

For Kubuntu, search for 'Removable Devices' and change the settings there.

### [Preventing applications from launching on boot](https://www.reddit.com/r/Kubuntu/comments/bcae00/how_to_prevent_qbittorrent_from_launching_at/)

System Settings > Startup and Shutdown > Desktop Session > On Login > Enable 'Start with an empty session'

### Fixing 'Setting locale failed'

The error looks like this:

```txt
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
[...]
    are supported and installed on your system.
perl: warning: Falling back to a fallback locale ("en_US.UTF-8").
locale: Cannot set LC_ALL to default locale: No such file or directory
```

Run `locale` to list all locales defined for the user.

To reconfigure locales, identify the locale name (e.g., `en_GB.UTF-8`), generate it, and then reconfigure:

```sh
sudo locale-gen "en_GB.UTF-8"
sudo dpkg-reconfigure locales
```

<https://draculaservers.com/tutorials/setting-locale-failed-ubuntu/>

Alternatively, when installing Ubuntu, select a region which has the desired locale (e.g., United Kingdom for `en_GB.UTF-8`), and change the timezone manually once the installation is complete.

### Snap / Flatpak sandboxing issues

- must use full path for LaTeX commands in VSCodium, despite being added to the environment variables
- extra script to set up KeePassXC browser extension
- icon themes not respected
- missing icons in KDE
- VSCodium opens a new, sandboxed instance of the web browser, which often crashes

Use PPA or Ubuntu package with a complete icon theme wherever possible to avoid these issues. Alternatively, to fix icon issues, use the [Hardcoded Icon Fixer](https://github.com/Foggalong/hardcode-fixer) and [Hardcode-Tray](https://github.com/bilelmoussaoui/Hardcode-Tray) (recommended for [Papirus icon theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)).

### [Using a custom icon for an application](https://askubuntu.com/a/80634/714808)

Copy the `.desktop` file of the application to the local applications folder:

```sh
cp /usr/share/applications/app.desktop ~/.local/share/applications/
```

Open the copied file and change the value of `Icon`, e.g., change absolute path to relative, use a custom icon, etc. Save the file after making changes.

### Troubleshooting WiFi issues

See <https://askubuntu.com/a/235280/714808>.

## Android

### Finding the list of devices attached via USB using Android SDK tools

- Install Android SDK tools on computer (via [Android Studio](https://developer.android.com/studio))
- Enable USB debugging on the device
- Connect device to computer using USB cable
- Navigate to the `platform-tools` directory (in my case, `$HOME/Android/Sdk/platform-tools`)
- Run `adb devices` (in my case, `./adb devices`)

See [How to Install and Use ADB, the Android Debug Bridge Utility - How-To Geek](https://www.howtogeek.com/125769/how-to-install-and-use-abd-the-android-debug-bridge-utility/).

### ADB commands

The list of ADB commands can be viewed [here](https://technastic.com/adb-commands-list-adb-cheat-sheet/). See [here](https://technastic.com/adb-shell-commands-list/) for ADB shell commands.

### Flashing Samsung phones - Heimdall vs Odin

From the [Android Enthusiasts SE](https://android.stackexchange.com/a/162667/304762):

> *[...] Samsung devices do not support fastboot, you use Odin or Heimdall to flash what you need.*

Why use Heimdall, not Odin (from [Heimdall's homepage](https://glassechidna.com.au/heimdall/)):

> *For internal use, Samsung developed their own firmware flashing tool known as 'Odin' [...]*
>
> *Aside from being slow and generally unreliable, Odin only runs on Windows systems. Furthermore, Odin is 'leaked software' that is not officially supported by Samsung, freely available, or well understood by the community at large.*

### [Booting devices into bootloader](https://technastic.com/samsung-download-recovery-mode/)

- **Option 1:** Ensure USB debugging is enabled. Turn off the device and hold the Volume Up, Volume Down and Power buttons for a few seconds.
- **Option 2:**
  - Follow the steps detailed in [this section](#finding-the-list-of-devices-attached-via-usb-using-android-sdk-tools).
  - If `adb devices` produces an output, proceed to the next step.
  - Run `adb reboot bootloader`.

### Using Heimdall to install TWRP

First, install Heimdall. Use the [heimdall-flash package for Ubuntu Focal](https://packages.ubuntu.com/focal/heimdall-flash), or download the source code from [GitLab](https://gitlab.com/BenjaminDobell/Heimdall). Typing `heimdall` in the terminal will display all available actions or arguments.

Next, prepare the recovery image. Download the latest version of [TWRP (this is for Samsung Galaxy Tab 2 - espresso3g)](https://twrp.me/samsung/samsunggalaxytab2gmsunified.html).

Follow the instructions in [this section](#booting-devices-into-bootloader) to boot the device into the bootloader.

Connect the device using a USB cable. To ensure the device is properly connected via USB, run `heimdall detect`.

Navigate to the path of the recovery image using the terminal. Then, run the following to install TWRP, replacing `twrpfilename` with the name of the TWRP image:

```sh
heimdall flash --recovery twrpfilename.img
```

Source: [Heimdall tutorial - XDA Developers](https://forum.xda-developers.com/showthread.php?t=2118100)

### Installing TWRP with ADB

Install Android SDK tools (as noted [here](#finding-the-list-of-devices-attached-via-usb-using-android-sdk-tools)).

Next, prepare the recovery image. Download the latest version of [TWRP (this is for Samsung Galaxy Tab 2 - espresso3g)](https://twrp.me/samsung/samsunggalaxytab2gmsunified.html).

Follow the instructions in [this section](#booting-devices-into-bootloader) to boot the device into the bootloader.

Connect the device to the computer using a USB cable. Navigate to the `platform-tools` directory and open a terminal window. Run `fastboot devices` to verify that the device is connected properly via USB. To flash TWRP, run:

```sh
fastboot flash recovery twrpfilename.img
```

Source: [How to Flash the TWRP Recovery Environment to Your Android Phone - How-To Geek](https://www.howtogeek.com/240582/how-to-back-up-and-restore-your-android-phone-with-twrp/)

### Using TWRP

After installing, boot into recovery mode, as noted in [this section](#booting-devices-into-bootloader), to access TWRP.

Select Read Only mode if you only want TWRP to exist on the phone until reboot.

To make a Nandroid backup of the current ROM, choose the Backup option on TWRP and select which partitions to include (usually System, Data, and Boot).

From [Android Tips and Hacks](https://www.androidtipsandhacks.com/root/twrp-the-complete-guide-to-using-recovery-on-android/):

> *Don’t tick the Skip MD5 generation option, as this ensures the integrity of your backups and guards against errors when restoring them.*

From [How-To Geek](https://www.howtogeek.com/240047/how-to-flash-twrp-recovery-on-your-android-phone/):

> *The backup will take a while, so give it time. When it finishes, head back into the Backup menu. Uncheck all the options and scroll to the bottom. If you have a special partition listed after “Recovery”, such as WiMAX, PDS, or EFS, check it, and perform one more backup. This partition usually contains your EFS or IMEI information, which is crucial. If it ever becomes corrupted, you’ll lose data connectivity and can restore this backup to make your phone function again.*
>
> *Lastly, if TWRP ever asks if you want to root your phone, choose “Do Not Install”. It’s best to flash the latest version of SuperSU yourself rather than having TWRP do it for you.*

To restore a Nandroid backup, boot back into TWRP and use the Restore button to choose from the list of available backups. Once restored, reboot the phone into Android.

To flash a custom ROM, copy the ROM's ZIP file into the device's internal storage. Tap Install on TWRP to proceed.

Links:

- [What is a data/media device? - TWRP](https://twrp.me/faq/datamedia.html)
- [What is EXCLUDED from a TWRP backup? - TWRP](https://twrp.me/faq/backupexclusions.html)
- [How to Back Up and Restore Your Android Phone with TWRP - How-To Geek](https://www.howtogeek.com/240582/how-to-back-up-and-restore-your-android-phone-with-twrp/)
- [LineageOS for Galaxy Tab 2](https://andi34.github.io/roms_tab2_lineage.html)
- [LineageOS 13.0 (Marshmallow - Android 6.0) for Galaxy Tab 2 GMS - XDA Developers](https://forum.xda-developers.com/galaxy-tab-2/galaxy-tab-2-unified/rom-cyanogenmod-13-cm13-0-t3303798)
- [LineageOS Samsung espresso3g - GitHub](https://github.com/LineageOS/android_device_samsung_espresso3g)

### Links

How-To Geek Guides:

- <https://www.howtogeek.com/125375/how-to-create-a-full-android-phone-or-tablet-backup-without-rooting-or-unlocking-your-device/>
- <https://www.howtogeek.com/239798/how-to-unlock-your-android-phones-bootloader-the-official-way/>
- <https://www.howtogeek.com/193055/what-is-a-custom-recovery-on-android-and-why-would-i-want-one/>
- <https://www.howtogeek.com/115297/how-to-root-your-android-why-you-might-want-to/>

Additional links:

- [heimdall-flash-frontend package - Ubuntu Focal](https://packages.ubuntu.com/focal/heimdall-flash-frontend)
- [Heimdall guide - XDA Developers Wiki](https://forum.xda-developers.com/wiki/Heimdall)
- [[HOW TO] Unlock Bootloader & Root GSM Nexus (4.0.x devices only) - XDA Developers](https://forum.xda-developers.com/galaxy-nexus/how-to-unlock-bootloader-root-gsm-nexus-t1362957)

## Old

<details>
<summary>
Click to expand
</summary>

### GNOME <!-- omit in toc -->

#### [Install GNOME tweak tool](https://askubuntu.com/a/968630/714808)

```sh
sudo apt install gnome-tweak-tool
```

#### Useful GNOME extensions

- [Dash to Panel](https://github.com/home-sweet-gnome/dash-to-panel)
- [Caffeine](https://extensions.gnome.org/extension/517/caffeine/)
- [User Themes](https://extensions.gnome.org/extension/19/user-themes/)
- [Applications Overview Tooltip](https://extensions.gnome.org/extension/1071/applications-overview-tooltip/)
- [Applications Menu](https://extensions.gnome.org/extension/6/applications-menu/)
- [Start Overlay in Application View](https://extensions.gnome.org/extension/1198/start-overlay-in-application-view/)
- [OpenWeather](https://extensions.gnome.org/extension/750/openweather/)

### Installing Wine and fixing dependency issues <!-- omit in toc -->

Enable 32-bit architecture if system is 64-bit:

```sh
sudo dpkg --add-architecture i386
```

Download and add repository key:

```sh
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
```

Add the repository (replace `bionic` with your Ubuntu version):

```sh
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
```

Update packages:

```sh
sudo apt update
```

Install Wine package (from stable branch):

```sh
sudo apt install --install-recommends winehq-stable
```

This may throw dependency errors:

```sh
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 winehq-stable : Depends: wine-stable (= 5.0.0~bionic)
E: Unable to correct problems, you have held broken packages.
```

To fix the error, use the following command:

```sh
sudo apt-get install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64
```

This resulted in additional dependency errors on my system:

```sh
 wine-stable-amd64 : Depends: libfaudio0 but it is not installable
                     Recommends: libcapi20-3 but it is not going to be installed
                     Recommends: libosmesa6 but it is not going to be installed
 wine-stable-i386:i386 : Depends: libfaudio0:i386 but it is not installable
                         Recommends: libcapi20-3:i386 but it is not going to be installed
                         Recommends: libcups2:i386 but it is not going to be installed
                         Recommends: libglu1-mesa:i386 but it is not going to be installed or
                                     libglu1:i386
                         Recommends: libgsm1:i386 but it is not going to be installed
                         Recommends: libgssapi-krb5-2:i386 but it is not going to be installed
                         Recommends: libkrb5-3:i386 but it is not going to be installed
                         Recommends: libodbc1:i386 but it is not going to be installed
                         Recommends: libosmesa6:i386 but it is not going to be installed
                         Recommends: libsane:i386 or
                                     libsane1:i386 but it is not going to be installed
                         Recommends: libv4l-0:i386 but it is not going to be installed
                         Recommends: libxcomposite1:i386 but it is not going to be installed
                         Recommends: libxslt1.1:i386 but it is not going to be installed
```

Install the required [`libfaudio0`](https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/) libraries as recommended:

```sh
cd Downloads
wget https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/amd64/libfaudio0_19.07-0~bionic_amd64.deb
wget https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/i386/libfaudio0_19.07-0~bionic_i386.deb
sudo dpkg -i libfaudio0_19.07-0~bionic_amd64.deb libfaudio0_19.07-0~bionic_i386.deb
sudo apt --fix-broken install
cd ..
```

Install all remaining dependencies and these additional libraries for compatibility reasons:

```sh
sudo apt-get install libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libxml2:i386 libasound2-plugins:i386 libsdl2-2.0-0:i386 libfreetype6:i386 libdbus-1-3:i386 libsqlite3-0:i386
```

Finally, install Wine using the same command used earlier:

```sh
sudo apt-get install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64
```

References:

- <https://askubuntu.com/a/1145491/714808>
- <https://wiki.winehq.org/Ubuntu>
- <https://github.com/lutris/lutris/wiki/Wine-Dependencies>
- <https://wiki.winehq.org/FAQ#How_do_I_solve_dependency_errors_when_trying_to_install_Wine.3F>
- <https://forum.winehq.org/viewtopic.php?f=8&t=32192>

### Packages and GNOME extensions <!-- omit in toc -->

- [GRUB Customizer](https://launchpad.net/grub-customizer)
- [Open Graphics Drivers](https://launchpad.net/~oibaf/+archive/ubuntu/graphics-drivers)
- [nautilus-admin (**archived**)](https://github.com/brunonova/nautilus-admin)
- [windowNavigator](https://extensions.gnome.org/extension/10/windownavigator/)
- [No Screen Blank](https://extensions.gnome.org/extension/2413/no-screen-blank/)
- [No Topleft Hot Corner](https://extensions.gnome.org/extension/118/no-topleft-hot-corner/)
- [Dynamic Panel Transparency](https://extensions.gnome.org/extension/1011/dynamic-panel-transparency/)
- [AlternateTab](https://extensions.gnome.org/extension/15/alternatetab/)

#### [Changing GNOME screenshot directory](https://askubuntu.com/a/1102530/714808) <!-- omit in toc -->

Use an extension:

- <https://extensions.gnome.org/extension/1179/screenshot-locations/>
- <https://github.com/kiyui/gnome-shell-screenshotlocations-extension>

### Problems with drivers <!-- omit in toc -->

#### Realtek WiFi problems <!-- omit in toc -->

Secure boot should be disabled before installing these drivers.

See <https://askubuntu.com/a/635629/714808>.

#### [Computer boots to blank screen after Ubuntu upgrade](https://askubuntu.com/a/162076/714808) <!-- omit in toc -->

**Note:** It is recommended to upgrade using a **bootable USB or disk**. Upgrading through the Software Updater could potentially cause driver-related problems which can otherwise be avoided.

This is likely due to proprietary graphics card software not being installed by Ubuntu during the upgrade. To fix this, boot Ubuntu in `nomodeset` to bypass the blank screen. In the Grub menu, highlight 'Ubuntu' and press `e` to edit the entry. Replace `quiet splash` with `nomodeset`. Then, press `ctrl` + `x` to boot. Download and install the proprietary graphics card drivers and reboot to fix this permanently. See below, and <https://askubuntu.com/q/47506/714808> for more information about installing additional drivers.

**Note:** If this still doesn't fix the problem, set `nomodeset` permanently through the Grub Customiser.

**AMD Radeon software** - downloading directly from the AMD website:

- [Radeon™ Software for Linux® Installation](https://amdgpu-install.readthedocs.io/en/latest/)
- [Radeon™ Software for Linux® 20.10 Release Notes](https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-20-10)
- <https://www.amd.com/en/support/kb/faq/amdgpupro-install>
- <https://www.amd.com/en/support/kb/release-notes/amdgpu-installation>

Open source PPAs:

- <https://askubuntu.com/a/1066106/714808>
- <https://help.ubuntu.com/community/AMDGPU-Driver>

Checking graphics card name and chipset:

```sh
sudo update-pciids # optional command, requires internet
lspci -nn | grep -E 'VGA|Display'
```

Add [the Open Graphics Drivers PPA](https://launchpad.net/~oibaf/+archive/ubuntu/graphics-drivers) and update:

```sh
sudo add-apt-repository ppa:oibaf/graphics-drivers
sudo apt-get update
sudo apt upgrade
```

Reconfigure to be safe:

```sh
sudo apt install --reinstall xserver-xorg-video-amdgpu
sudo dpkg --configure -a
sudo dpkg-reconfigure gdm3 ubuntu-session xserver-xorg-video-amdgpu
```

To enable accelerated video:

```sh
sudo apt-get install mesa-vdpau-drivers
```

To test the vdpau driver with mpv:

```sh
mpv --hwdec=vdpau yourvideofile
```

Reboot computer and see if everything works as intended.

### Guides <!-- omit in toc -->

- [Making Ubuntu look like Windows](https://www.howtogeek.com/353819/how-to-make-ubuntu-look-more-like-windows/)

### Prevent the screen from turning off when the lockscreen is active  <!-- omit in toc -->

Using an extension by [u/SomeGenericUsername](https://old.reddit.com/r/gnome/comments/2hj8bx/has_anyone_figured_out_a_way_to_keep_the_screen/cktqjqd/)

> I don't think it is possible to achieve that with config options alone as it is not intended to work that way and certain parts of the sequence from fading to blanking to locking the screen are hardcoded. This gets complicated even further by this whole thing being spread across multiple processes. The shell is what does the fading but then it tells gnome-settings-daemon to blank the screen via d-bus signals. That's at least my limited understanding from quickly glancing at the involved code.
>
> Now, I've just written an extension, that kind of works around all of that. It disables the fading and removes the emission of the d-bus signal. This whole thing is super ugly and would never stand a chance to get accepted for extensions.gnome.org as extensions are supposed to be disabled when the lock screen gets activated, but that won't make much sense for this extension. That also means you can't disable it like you are used to, but that you have to restart gnome-shell after disabling if for it to be actually disabled. Another thing is that there might be other applications listening to the d-bus signal I've disabled and that might have some security implications. I'm not sure which signal gnome-keyring uses to lock its keyring when the lock screen gets shown, but this signal might be it or it might be part of a signal chain to some other signal that would lock the keyring. The way I've removed the signal emission might also affect gnome-shell internally, so maybe it won't automatically change your online status to away anymore, but I haven't checked for that either.
>
> I've only tested the extension on 3.14, but I think it should work on 3.10 or 3.12 as well, if you haven't upgraded yet. Also my testing was not really thorough, but it seems to be working for both, locking the screen based on the user being idle and on clicking the lock button.
> So after all this has been said, here is the extension now:
>
> [Link to Dropbox file]
>
> Extract it to `~/.local/share/gnome-shell/extensions/`
>
> Edit (2017-03-24): Updated the extension to allow manually disabling it (still a hack though), tested with 3.24, and updated the link because the old one wasn't working anymore (thanks Dropbox...).

[SoCRaT](https://techienotes.blog/2018/04/16/how-to-to-prevent-the-screen-from-turning-off-when-locked-with-gnome-shell-on-ubuntu-18-04/) has made an updated version to support GNOME 3.28. Alternatively, edit `metadata.json` in the original download to include 3.28.

Once the extracted folder is placed in `~/.local/share/gnome-shell/extensions/`, use Tweaks to turn the "No screen blank" extension on. A restart may be required before it shows up in the list of extensions.

### [Globally customise system UI font on Ubuntu](https://github.com/Microsoft/vscode/issues/10144#issuecomment-337490205) <!-- omit in toc -->

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

### Prevent DejaVu family of fonts from interfering with emoji display <!-- omit in toc -->

Installing `twemoji-color-font` and optionally editing `$HOME/.config/fontconfig/56-twemoji-color.conf` to replace the Bitstream Vera family of fonts with other suitable fonts, such as Noto Serif, Ubuntu, and Cascadia Code. The browser font settings should also be changed to match the settings in the configuration file for best results.

***Note:*** This will only work for Mozilla apps.

> The font uses the SVG-in-OpenType format and will currently only show color emoji in Firefox, Thunderbird and other Mozilla Gecko-based applications. This is not a limitation of the font, but of the operating systems and applications. Regular B&W outline emoji are included for backwards/fallback compatibility. -- 13rac1

- <https://github.com/eosrei/twemoji-color-font>
- <https://www.reddit.com/r/firefox/comments/ev92yz/prevent_dejavu_font_from_messing_with_emojis/>
- <https://wiki.archlinux.org/index.php/Font_configuration#Replace_or_set_default_fonts>
- <https://askubuntu.com/a/740649/714808>

### KDE <!-- omit in toc -->

#### Taking screenshots

Install Spectacle from the app store. Screenshot location can be configured in the settings.

#### Customising KDE's appearance with Latte Dock

- <https://www.dedoimedo.com/computers/plasma-global-menu-app-title-window-buttons-like-mac-unity.html>
- <https://www.dedoimedo.com/computers/plasma-look-like-mac.html>

#### [Missing network manager](https://askubuntu.com/a/963902/714808)

Install the package:

```sh
sudo apt-get install plasma-nm
```

### [Font management](https://askubuntu.com/a/371320/714808) <!-- omit in toc -->

Install [font-manager](https://packages.ubuntu.com/focal/font-manager)

```sh
sudo apt-get install font-manager
```

</details>
