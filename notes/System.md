## [Turn on or off secure boot](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/disabling-secure-boot?view=windows-11)

Open the PC BIOS menu. You can often access this menu by pressing a key during the boot up sequence, such as `F1`, `F2`, `F12`, or `Esc`.

Or, from Windows: go to **Settings charm** > **Change PC settings** > **Update and Recovery** > **Recovery** > **Advanced Startup: Restart now**. When the PC reboots, go to **Troubleshoot** > **Advanced Options: UEFI Firmware Settings**.

Find the **Secure Boot** setting, and if possible, set it to **Enabled**. This option is usually in either the **Security** tab, the **Boot** tab, or the **Authentication** tab.

## Fix boot order / GRUB menu not appearing on startup

Windows: go to **Settings charm** > **Change PC settings** > **Update and Recovery** > **Recovery** > **Advanced Startup: Restart now**. When the PC reboots, go to **Troubleshoot** > **Advanced Options: UEFI Firmware Settings**. Change the order of the OS in boot settings.

If the GRUB command line appears after installing Linux, type `exit` and enter. Then, launch UEFI firmware settings and change the boot order. This issue is caused by Linux not appearing at the top of the bootloader.

Source: <https://unix.stackexchange.com/q/329926>

## Booting into a USB device using GRUB2

The GRUB2 command line might show up if you had a dual boot system with Windows 10 and Linux, and the Linux partition has been deleted. This will remove the usual GRUB menu which lets you choose between operating systems or UEFI settings. It will not boot into Windows 10 automatically like it did pre-Linux installation, as the master boot record (MBR) has been removed.

This is not an issue for older Windows versions, as the BIOS screen will show up on start up.

If you have not restarted and are still running Windows 10, plug in the USB device and use the advanced startup options in the settings to boot from USB. If you have already restarted, use a Windows 10 installation/recovery medium to restore the MBR. Alternatively, follow the instructions below, which uses the GRUB2 command line and do not require a Windows 10 recovery medium.

When creating a bootable USB, note where the `vmlinuz` and `initrd.*` files are located. In my case, it was in `cdrom/casper`. Kubuntu and Pop! OS use `casper`.

Plug in the USB and turn on the device.

In the GRUB2 command line, use `ls` to get a list of partitions available:

```grub
grub> ls
(hd0) (hd0,msdos5) (hd1) (hd1,msdos0)
```

The root partition of the USB device will probably be the last in the list (i.e, `(hd1,msdos0)`). This is not always the case. Verify by pressing tab after typing `linux (hd1,msdos0)`.

Finally, boot the system using the following set of commands:

```grub
grub> linux (hd1,msdos0)/casper/vmlinuz root=/dev/sdb1
grub> initrd (hd1,msdos0)/casper/initrd
grub> boot
```

Source: <https://blog.viktorpetersson.com/2014/07/29/how-to-boot-from-usb-with-grub2.html>

## [Changing default GRUB boot OS](https://askubuntu.com/a/110738)

On Linux, create a backup of the GRUB file:

```sh
sudo cp /etc/default/grub /etc/default/grub.bak
```

Open `/boot/grub/grub.cfg` which has a `menuentry` for each GRUB menu item. Note the name of the `menuentry` which you want to set as default. An example for Windows 7:

```text
menuentry 'Microsoft Windows XP Professional (on /dev/sda1)' [options] {
```

Open `/etc/default/grub` using a text editor with `sudo` or administrative privileges. Find the line that contains `GRUB_DEFAULT=0`. Replace `0` with the name of the `menuentry` and save the file:

```text
GRUB_DEFAULT='Microsoft Windows XP Professional (on /dev/sda1)'
```

Finally, update the GRUB menu:

```sh
sudo update-grub
```

If anything goes wrong, restore using the backup.

## Fix missing Windows 10 boot record while dual-booting

Create a Windows recovery media, e.g. a bootable USB with the ISO of your Windows version. Boot with the recovery media, then go to **Repair your computer** > **Troubleshoot** > **Advanced options** > **Command prompt**. Run the following commands in the prompt:

```powershell
bootrec /FixMbr
bootrec /FixBoot
bootrec /ScanOs
bootrec /RebuildBcd
```

If any of the first two commands produce a permission error, just ignore it. Exit the command prompt and go to **Repair your computer** > **Troubleshoot** > **Advanced options** > **Startup Repair** to finish repairing the boot. Then, shut down the computer and remove the recovery media.

Turn on the computer and launch the Linux system. Install `os-prober` and ensure `/etc/default/grub` has it enabled, i.e. `GRUB_DISABLE_OS_PROBER=false`. Make sure this line is uncommented. Finally, regenerate the GRUB configurations:

```sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

The Windows boot manager should now appear in the GRUB menu during startup.

- <https://social.technet.microsoft.com/wiki/contents/articles/51782.fixing-corrupted-mbr-in-windows-10.aspx>
- <https://wiki.archlinux.org/title/Dual_boot_with_Windows#Linux_before_Windows>
- <https://learn.microsoft.com/en-us/troubleshoot/windows-client/performance/windows-boot-issues-troubleshooting>
- <https://www.linux.org/docs/man1/os-prober.html>

## Custom DNS

Use `1.1.1.1`; set-up instructions: <https://developers.cloudflare.com/1.1.1.1/setup/>.

To use the WARP client: <https://developers.cloudflare.com/warp-client/get-started/>

DNS over TLS or HTTPS: <https://www.cloudflare.com/en-gb/learning/dns/dns-over-tls/>

## Windows

### [Setting or changing the PATH system variable](https://www.java.com/en/download/help/path.html)

- The **PATH** is the system variable that your operating system uses to locate needed executables from the command line or Terminal window.
- The **PATH** system variable can be set using **System Utility** in control panel on Windows.
- In Windows 10, search for 'Edit the system environment variables'
- Click on 'Environment Variables'.
- In the section System Variables, find the **PATH** environment variable and select it. Click Edit. If the **PATH** environment variable does not exist, click New.
- In the Edit System Variable (or New System Variable) window, specify the value of the **PATH** environment variable. Click OK. Close all remaining windows by clicking OK.

### [Closing windows that are open](https://superuser.com/a/81477)

Ensure the window to be closed is in focus. Press `Alt` + `F4` to close.

### [Editing hosts file](https://www.howtogeek.com/27350/beginner-geek-how-to-edit-your-hosts-file/)

Open `c:\windows\system32\drivers\etc\hosts` as an administrator using a text editor.

### USB flash drive issues

USB flash drive not detected. When trying to format or assign it a different drive letter in Disk Management, you get the error "The system cannot find the file specified". When trying to delete the partition, an "unexpected error" occurs.

To fix the issue, open a PowerShell session with administrator rights and run the following:

```powershell
diskpart
list disk  # make note of the flash drive's disk number
select disk <disknumber>
clean
select disk <disknumber>
create partition primary
```

<https://answers.microsoft.com/en-us/windows/forum/all/disk-management-change-driver-letter-shows-it/002dd0db-e624-4c71-98ad-567f8f102dfc>

### Resetting PC on Windows 10

When reinstalling Windows 10, there are two options:

- keep personal files and remove all apps and settings (refresh)
- remove all personal files, apps, and setting (reset)

When resetting, if there are multiple drives or partitions, it will ask if you want to clear all drives, or only the drive with Windows installed. Selecting the latter will only format the Windows drive.

Source: <https://www.neowin.net/forum/topic/1266840-windows-10-reset-this-pc-will-it-delete-files-on-another-partition/>

### [Securely delete files on Windows 10 without third-party tools](https://www.techrepublic.com/article/how-to-securely-and-completely-delete-files-in-windows-10-without-third-party-software/)

Using the [SDelete](https://learn.microsoft.com/en-us/sysinternals/downloads/sdelete) Sysinternals software.

### [Computer shuts down or hibernates immediately after waking from sleep](https://www.dell.com/community/Laptops-General-Read-Only/Laptop-shuts-down-immediately-after-waking-from-sleep/td-p/5162536)

This is most likely caused by a critical thermal event, which could happen due to a malfunctioning cooling fan. Check the event viewer.

## Linux

### [Adding directory to PATH environment variables](https://askubuntu.com/a/688998)

These are added to the `.bashrc` or equivalent (shell startup) file, which can be found in the Home directory.

```sh
echo export PATH=\"$(echo path/to/file/):\$PATH\" >> ~/.bashrc
```

### [Editing hosts file](https://www.howtogeek.com/27350/beginner-geek-how-to-edit-your-hosts-file/)

Open `/etc/hosts` as an administrator using a text editor.

### What to do when the system freezes

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
> **NOTE:** There exists less radical way than rebooting the whole system. If `SysReq` key works, you can kill processes one-by-one using `Alt`+`SysReq`+`F`. Kernel will kill the most[sic] *expensive* process each time. If you want to kill all processes for one console, you can issue `Alt`+`SysReq`+`K`.

- <https://askubuntu.com/a/36717>
- <https://forum.manjaro.org/t/howto-reboot-turn-off-your-frozen-computer-reisub-reisuo/3855/81>

### Installing Zotero

Download the tarball from Zotero's [download page](https://www.zotero.org/download/). Extract the contents and move them to a location of your choice, such as `/opt/zotero`. Open the terminal in this location and run `./set_launcher_icon` to update the `zotero.desktop` file for that location. Create a symlink for `zotero.desktop` by running `ln -s "$PWD/zotero.desktop" ~/.local/share/applications/` from the same location. All of these commands can be run in succession from the same terminal window, i.e. `~/opt/zotero`.

***Note:*** If using a custom icon theme, replace the absolute path for the icon with `zotero` in `./set_launcher_icon` prior to running it.

References:

- <https://www.zotero.org/support/installation>
- <https://askubuntu.com/a/1147073>

### Creating and extracting archives

#### [Extracting tarballs](https://askubuntu.com/a/25962)

```sh
tar xzf file.tar.gz
tar xjf file.tar.bz2
```

To see the files being extracted during unpacking:

```sh
tar xzvf file.tar.gz
```

#### [Extracting ZIP files](https://askubuntu.com/a/86852)

```sh
unzip file.zip -d destination_folder
```

If the source and destination are the same:

```sh
unzip file.zip
```

#### Zipping and unzipping files

- <https://www.howtogeek.com/414082/how-to-zip-or-unzip-files-from-the-linux-terminal/>
- <https://www.ubuntupit.com/how-to-zip-and-unzip-files-on-ubuntu-linux-an-ultimate-guide/>

### [Installing from an archive](https://askubuntu.com/a/1030)

First, extract the archive. Then, open a terminal and navigate to the directory of the extracted folder.

Installation (depends on instructions):

```sh
xdg-open INSTALL
```

### Disable Bluetooth on startup

Open `/etc/bluetooth/main.conf` and set `AutoEnable=false`.

Source: <https://askubuntu.com/a/155886/>

### [Using a custom application icon](https://askubuntu.com/a/80634)

Copy the `.desktop` file of the application to the local applications folder:

```sh
cp /usr/share/applications/app.desktop ~/.local/share/applications/
```

Open the copied file and change the value of `Icon`, e.g. change absolute path to relative, use a custom icon, etc. Save the file after making changes.

On [KDE](https://archived.forum.manjaro.org/t/starting-a-root-command-in-terminal-through-a-shortcut/33653/2), right-click the Application Launcher icon and use Edit Application to create or modify desktop applications.

To enable a password prompt for applications that require administrative privileges, add `kdesu` before the command.

- <https://superuser.com/q/135311>
- <https://api.kde.org/frameworks/kdesu/html/index.html>

### Changing password

Use the `passwd` command

<https://www.redhat.com/sysadmin/managing-users-passwd>

### Audio timeout with WirePlumber

To prevent this timeout, copy the configuration file to the user configs. Then, set the timeout value to zero: `["session.suspend-timeout-seconds"] = 0` (uncomment the line by removing the `--`, if necessary).

```sh
mkdir -p ~/.config/wireplumber/main.lua.d/
cp /usr/share/wireplumber/main.lua.d/50-alsa-config.lua ~/.config/wireplumber/main.lua.d/
nano ~/.config/wireplumber/main.lua.d/50-alsa-config.lua
```

After saving the config, restart the WirePlumber service:

```sh
systemctl --user restart wireplumber
```

Source: <https://unix.stackexchange.com/a/677000>

### Disable middle-click pasting from primary selections

On Firefox, go to `about:config` and set `middlemouse.paste` to `false`.

On VS Code, set `"editor.selectionClipboard": false`.

- <https://askubuntu.com/a/1391599>
- <https://unix.stackexchange.com/a/564349>
- <https://unix.stackexchange.com/a/213843>
- <https://bbs.archlinux.org/viewtopic.php?id=110361>

### KDE

`baloo_file_extractor` using too much memory: go to System Settings > Search and disable file search

Using the CLI:

```sh
balooctl disable
```

<https://redd.it/5c0n30>

#### Automount hard disks on boot

Search for 'Removable Devices' and change the settings there.

#### [Preventing applications from launching on boot](https://redd.it/bcae00)

System Settings > Startup and Shutdown > Desktop Session > On Login > Enable 'Start with an empty session'

### Arch Linux

- <https://wiki.manjaro.org/index.php/Pacman_Overview>
- <https://aur.archlinux.org/>
- <https://wiki.archlinux.org/title/Pacman>

#### Pacman

Pacman flags:

- `-S`: query the sync database
  - `-Ss`: search for a package
  - `-Si`: display extensive information about a package
  - `-Syu`: update packages
  - `-Sw`: download package without installing
- `-Q`: query the local package database
  - `-Ql`: list of files installed by a package
  - `-Qk`: verify the presence of files installed by a package
  - `-Qs`: search already installed packages
  - `-Qi`: display extensive information about a locally-installed package
  - `-Qii`: also display the list of backup files and their modification states
  - `-Qdt`: list packages no longer required as dependencies (orphans)
  - `-Qet`: list packages explicitly installed and not required as dependencies
- `-F`: query the file database
  - `-Fl`: retrieve a list of the files installed by a remote package
- `-R`: remove a software package
  - `-Rsu`: remove a package and all unneeded dependencies
  - `-Rsun`: remove a package and all unneeded dependencies and backup configuration files

To search for packages:

```sh
pacman -Ss papirus-icon-theme
```

To install and update system:

```sh
sudo pacman -Syu papirus-icon-theme
```

To uninstall and remove unneeded dependencies:

```sh
sudo pacman -Rsu papirus-icon-theme
```

To remove all orphan packages:

```sh
sudo pacman -Rsn $(pacman -Qdtq)
```

To determine which package owns a file:

```sh
pacman -Qo /usr/bin/smplayer
```

To remove old package caches except for the latest three package versions:

```sh
paccache -r
```

To remove all cached versions of uninstalled packages:

```sh
paccache -ruk0
```

#### Yay

Clean cache:

```sh
yay -Scc
```

#### Enable emoji fonts

In a terminal emulator, type the following:

```sh
sudo nano /etc/fonts/local.conf
```

Then, paste the following and save the file:

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>

 <alias>
   <family>sans-serif</family>
   <prefer>
     <family>Sans</family>
     <family>Noto Color Emoji</family>
   </prefer> 
 </alias>

 <alias>
   <family>serif</family>
   <prefer>
     <family>Serif</family>
     <family>Noto Color Emoji</family>
   </prefer>
 </alias>

 <alias>
  <family>monospace</family>
  <prefer>
    <family>Monospace</family>
    <family>Noto Color Emoji</family>
   </prefer>
 </alias>

</fontconfig>
```

Install an appropriate emoji font, such as `noto-fonts-emoji`.

<https://forum.manjaro.org/t/howto-enable-emoji-fonts/36695>

#### Screensaver

- Installation: `yay xscreensaver-arch-logo`
- Configure screensaver using `xscreensaver & xscreensaver-settings`, which will also generate a `~/.xscreensaver` file that can be manually edited
  - 'Blank After' or `timeout` is the time it takes for the screen to lock, e.g. 5 minutes
  - 'Lock Screen After' or `lockTimeout` should be checked and set to zero
  - Configure display energy saving (DPMS)
- Configure KDE built-in settings:
  - "Workspace Behaviour / Screen Locking / Lock automatically"
  - "Workspace Behaviour / Screen Locking / After waking from sleep"
  - "Workspace Behaviour / Screen Locking / Keyboard shortcut"
  - "Hardware / Power Management / Screen Energy Saving"
  - "Hardware / Power Management / Suspend session"
  - "Hardware / Power Management / Laptop lid closed" = Do Nothing
- Autostart: `cp /usr/share/applications/xscreensaver.desktop ~/.config/autostart/`
- Additional configurations for KDE: run `systemctl edit --user plasma-ksmserver.service` and replace the contents with the following:
  ```
  [Service]
  ExecStart=
  ExecStart=/usr/bin/ksmserver --no-lockscreen
  ```
- Set the `Meta+L` keyboard shortcut for the command `xscreensaver-command -lock`
- Set a video clip (or a `.m3u` playlist) as the screensaver through `mpv` using the `~/.xscreensaver` file, e.g.:
  ```
  "Video"  mpv --really-quiet --no-audio --fs --loop=inf   \
                --no-stop-screensaver --shuffle            \
                --wid=$XSCREENSAVER_WINDOW                 \
                path/to/video/clip.mp4                   \n\
  ```
- Consider reviewing the [security concerns](https://man.archlinux.org/man/xscreensaver.1#SECURITY_CONCERNS)

Links:

- <https://wiki.archlinux.org/title/XScreenSaver>
- <https://man.archlinux.org/man/xscreensaver.1#INSTALLING_XSCREENSAVER_ON_KDE>
- <https://www.jwz.org/xscreensaver/faq.html>
- <https://raspberrypi.stackexchange.com/a/67831>

### Ubuntu notes

#### Install from PPA

```sh
sudo add-apt-repository ppa:lyzardking/ubuntu-make
sudo apt update
sudo apt install ubuntu-make
```

#### [Uninstalling software](https://askubuntu.com/a/1144)

If installed via package manager:

```sh
sudo apt remove ${application-name}
```

To uninstall all related packages and configuration files:

```sh
sudo apt purge ${package-name}
```

Otherwise, use Synaptic Package Manager, and 'Mark for complete removal'.

<details>
<summary>Archived notes</summary>

#### [Installing Firefox Developer Edition](https://askubuntu.com/a/584704)

Firefox Developer Edition will work alongside other Firefox installations with separate profiles.

First, install [Ubuntu Make](https://wiki.ubuntu.com/ubuntu-make).

Then, install Firefox Developer Edition:

```sh
umake web firefox-dev
```

Restart if the application does not appear in the dashboard.

#### [CheckInstall](https://help.ubuntu.com/community/CheckInstall)

> CheckInstall keeps track of all files installed by a "make install" or equivalent, creates a Slackware, RPM, or Debian package with those files, and adds it to the installed packages database, allowing for easy package removal or distribution.

Install using:

```sh
sudo apt update && sudo apt install checkinstall
```

Instead of

```sh
sudo make install
```

you will use

```sh
sudo checkinstall
```

#### Troubleshooting WiFi issues

See <https://askubuntu.com/a/235280>.

#### Fixing 'Setting locale failed'

```text
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
[...]
    are supported and installed on your system.
perl: warning: Falling back to a fallback locale ("en_US.UTF-8").
locale: Cannot set LC_ALL to default locale: No such file or directory
```

Run `locale` to list all locales defined for the user.

To reconfigure locales, identify the locale name (e.g. `en_GB.UTF-8`), generate it, and then reconfigure:

```sh
sudo locale-gen "en_GB.UTF-8"
sudo dpkg-reconfigure locales
```

Source: <https://draculaservers.com/tutorials/setting-locale-failed-ubuntu/>

Alternatively, when installing Ubuntu, select a region which has the desired locale (e.g. United Kingdom for `en_GB.UTF-8`), and change the timezone manually once the installation is complete.

#### Automount hard disks on boot - Ubuntu

For Ubuntu, see <https://www.fosslinux.com/4216/how-to-automount-hard-disk-partitions-in-ubuntu.htm>

#### Useful packages

- [HardInfo](https://help.ubuntu.com/community/HardInfo)
- [Ubuntu Make](https://wiki.ubuntu.com/ubuntu-make)
- [Synaptic Package Manager](https://www.nongnu.org/synaptic/)

#### [Handling held back packages](https://askubuntu.com/a/602)

`apt upgrade` gives `The following packages have been kept back`.

Solution 1:

```sh
sudo apt --with-new-pkgs upgrade
```

Solution 2 (replace `packages` with the list of packages held back):

```sh
sudo apt install packages
```

</details>

## Android

### Booting devices into download mode, bootloader, and recovery mode

Ensure USB debugging is enabled. Turn off the device and hold a combination of the Volume Up, Volume Down, Home, and/or Power buttons for a few seconds. This is device-specific.

For Samsung Galaxy Tab 2 10.1 GSM (espresso3g):

- enter download mode by pressing Volume Up + Power buttons
- enter recovery mode by pressing Volume Down + Power buttons

See <https://technastic.com/samsung-download-recovery-mode/>.

### SDK tools

Install Android SDK tools via [Android Studio](https://developer.android.com/studio).

#### Finding the list of devices attached via USB

- Enable USB debugging on the device
- Connect device to computer using USB cable
- Navigate to the `platform-tools` directory (for Linux, `~/Android/Sdk/platform-tools`; for Windows, `%LocalAppData%/Android/Sdk/platform-tools`)
- Run `adb devices` (for Linux and Windows, add `./` and `.\` before the executable (i.e. `adb`), respectively)

See [How to Install and Use ADB, the Android Debug Bridge Utility - How-To Geek](https://www.howtogeek.com/125769/how-to-install-and-use-abd-the-android-debug-bridge-utility/).

#### ADB commands

The list of ADB commands can be viewed [here](https://technastic.com/adb-commands-list-adb-cheat-sheet/). See [here](https://technastic.com/adb-shell-commands-list/) for ADB shell commands.

#### Booting device into bootloader using ADB

If `adb devices` produces an output, run `adb reboot bootloader`.

#### Installing a custom recovery with ADB

Download the latest version of the recovery image for your device to the computer. Boot the device into the bootloader.

Connect the device to the computer using a USB cable. Navigate to the `platform-tools` directory and open a terminal window. Run `fastboot devices` to verify that the device is connected properly via USB. To flash the custom recovery, run the following (replace `recovery.img` with the path of the custom recovery image):

```sh
fastboot flash recovery recovery.img
```

Source: [How to Flash the TWRP Recovery Environment to Your Android Phone - How-To Geek](https://www.howtogeek.com/240047/how-to-flash-twrp-recovery-on-your-android-phone/)

### Flashing Samsung phones

#### Heimdall vs Odin

From the [Android Enthusiasts SE](https://android.stackexchange.com/a/162667):

> *[...] Samsung devices do not support fastboot, you use Odin or Heimdall to flash what you need.*

Why use Heimdall, not Odin (from [Heimdall's homepage](https://glassechidna.com.au/heimdall/)):

> *For internal use, Samsung developed their own firmware flashing tool known as 'Odin' [...]*
>
> *Aside from being slow and generally unreliable, Odin only runs on Windows systems. Furthermore, Odin is 'leaked software' that is not officially supported by Samsung, freely available, or well understood by the community at large.*

#### Installing Heimdall

Use the [heimdall-flash package for Ubuntu Focal](https://packages.ubuntu.com/focal/heimdall-flash), or download the source code from [GitHub](https://github.com/Benjamin-Dobell/Heimdall) to build from source.

When building from source, follow the instructions outlined in the platform-specific README files ([Windows](https://raw.githubusercontent.com/Benjamin-Dobell/Heimdall/master/Win32/README.txt); [Linux](https://raw.githubusercontent.com/Benjamin-Dobell/Heimdall/master/Linux/README)). For Windows, download MSYS2 and install the required libraries.

Typing `heimdall help` in the terminal will display all available actions or arguments. This needs to be done in the path where Heimdall is installed, if it has not been added to the PATH variables.

#### Flashing a custom recovery using Heimdall

This is for [Samsung Galaxy Tab 2 10.1](https://en.wikipedia.org/wiki/Samsung_Galaxy_Tab_2_10.1) GSM (espresso3g).

Download the latest version of your preferred recovery image (e.g. [TWRP](https://twrp.me/samsung/samsunggalaxytab2gmsunified.html)) to the computer.

Enable USB debugging on device. Turn off and boot the device into download mode (Volume Up + Power buttons, then Volume Down). This is known as ODIN mode on Samsung devices; a yellow warning triangle will appear on the screen.

Connect the device to the computer using a USB cable. Open a terminal window (MINGW64 / MSYS2 shell) and navigate to the path where Heimdall is installed. To check whether the device is properly connected via USB, run `heimdall detect`.

If using Windows, run `zadig.exe` to install USB drivers (else, `libsub error: -12` occurs).

Run the following to install the custom recovery, replacing `recovery.img` with the path of the downloaded recovery image:

```sh
heimdall flash --RECOVERY recovery.img --no-reboot
```

After installing, reboot into recovery mode (Volume Down + Power buttons) to access the custom recovery. Do not reboot into the Android system, as this can cause the stock recovery to replace the custom recovery.

Sources:

- [Heimdall tutorial - XDA Developers](https://forum.xda-developers.com/t/tutorial-heimdall-for-mac-like-odin.2118100/)
- [MSYS2](https://www.msys2.org/)
- [Windows Terminal - Terminals - MSYS2](https://www.msys2.org/docs/terminals/#windows-terminal)
- [[How To] ROOT- Galaxy Tab 2 10.1 [GT-P5113 / 5100 / 5110 & 4.0.4 UPGRADE or OEM] - XDA Developers](https://forum.xda-developers.com/t/how-to-root-galaxy-tab-2-10-1-gt-p5113-5100-5110-4-0-4-upgrade-or-oem.1657056/)
- [libwdi GitHub Wiki - Zadig](https://github.com/pbatard/libwdi/wiki/Zadig)
- [Heimdall error libusb error: -12 - Android SE](https://android.stackexchange.com/q/98338)
- [FASTBOOT commands don't work at all on my Samsung phone - Android SE](https://android.stackexchange.com/a/187573)
- [Heimdall errors, "ERROR: Partition "recovery" does not exist in the specified PIT." - Android SE](https://android.stackexchange.com/a/51066)

### Using TWRP to backup and install ROMs

After installing, boot into recovery mode to access TWRP.

Select Read Only mode if you only want TWRP to exist on the phone until reboot.

To make a Nandroid backup of the current ROM, choose the Backup option on TWRP and select which partitions to include. Back up to an external SD card.

From [TWRP's FAQ](https://twrp.me/faq/whattobackup.html):

> *The default backup options in TWRP are system, data, and boot. For most cases, this is sufficient for backing up a ROM. [...] If your device has the option, backing up android_secure and/or sd-ext may be a good idea.*
>
> *[...] If you need a perfect "go back to completely stock" backup then you should be using System Image (and Vendor Image, when available) instead of just system.*
>
> *Some devices have "special partitions" like WiMAX, pds, efs, etc. [...] It's usually a good idea to make a single backup of these partitions and hang on to them just in case. [...] It is NOT recommended to restore these special partitions unless you are absolutely certain that you need to restore them. Restoring these partitions unnecessarily may result in a bricked device.*

From [How-To Geek](https://www.howtogeek.com/240047/how-to-flash-twrp-recovery-on-your-android-phone/), regarding WiMAX, pds, efs, etc., and rooting using TWRP:

> *This partition usually contains your EFS or IMEI information, which is crucial. If it ever becomes corrupted, you'll lose data connectivity and can restore this backup to make your phone function again.*
>
> *Lastly, if TWRP ever asks if you want to root your phone, choose "Do Not Install". It's best to flash the latest version of SuperSU yourself rather than having TWRP do it for you.*

To restore a Nandroid backup, boot back into TWRP and use the Restore button to choose from the list of available backups. Once restored, reboot the phone into Android.

To flash a custom ROM ([from Android-Andi](https://andi34.github.io/faq.html)):

- backup all important files to the external SD card or computer
- copy the ZIP files (device- and Android version-specific) for the ROM and [Open GApps](https://opengapps.org/) into the device's external SD card
- boot into TWRP
- create a backup of the current ROM to the external SD card or computer
- go to TWRP's home and tap "Wipe"
- tap "Format Data"
- type "yes" and tap on the tick mark to proceed
- go back to the "Wipe" page and tap "Advanced Wipe"
- select "Dalvic / ART Cache", "System", and "Cache" and swipe to proceed
- go back to TWRP's home and tap "Reboot"
- tap "Recovery" and swipe to reboot
- after reboot, tap "Install" to flash the custom ROM
- go back to "Install" and flash Open GApps
- reboot to the Android system

Links:

- [What is a data/media device? - TWRP](https://twrp.me/faq/datamedia.html)
- [What is EXCLUDED from a TWRP backup? - TWRP](https://twrp.me/faq/backupexclusions.html)
- [How to Back Up and Restore Your Android Phone with TWRP - How-To Geek](https://www.howtogeek.com/240582/how-to-back-up-and-restore-your-android-phone-with-twrp/)
- [Open GApps GitHub Wiki - Package Comparison](https://github.com/opengapps/opengapps/wiki/Package-Comparison)
- Installing Omni on your device - Omni ROM docs
- [[ROM][6.x] OmniROM - Samsung Galaxy Tab 2 - XDA Developers](https://forum.xda-developers.com/t/rom-6-x-omnirom.3405123/)
- [Android Tips and Hacks](https://www.androidtipsandhacks.com/root/twrp-the-complete-guide-to-using-recovery-on-android/)

### Links

How-To Geek Guides:

- [How To Create a Full Android Phone or Tablet Backup Without Rooting or Unlocking Your Device](https://www.howtogeek.com/125375/how-to-create-a-full-android-phone-or-tablet-backup-without-rooting-or-unlocking-your-device/)
- [How to Unlock Your Android Phone's Bootloader, the Official Way](https://www.howtogeek.com/239798/how-to-unlock-your-android-phones-bootloader-the-official-way/)
- [What is a Custom Recovery on Android, and Why Would I Want One?](https://www.howtogeek.com/193055/what-is-a-custom-recovery-on-android-and-why-would-i-want-one/)
- [How to Root Your Android Phone with SuperSU and TWRP](https://www.howtogeek.com/115297/how-to-root-your-android-why-you-might-want-to/)

Additional links:

- [heimdall-flash-frontend package - Ubuntu Focal](https://packages.ubuntu.com/focal/heimdall-flash-frontend)
- Heimdall guide - XDA Developers Wiki
- [[HOW TO] Unlock Bootloader & Root GSM Nexus (4.0.x devices only) - XDA Developers](https://forum.xda-developers.com/t/how-to-unlock-bootloader-root-gsm-nexus-4-0-x-devices-only.1362957/)
