# System notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Turn on or off secure boot](#turn-on-or-off-secure-boot)
- [Fix boot order / Grub menu not appearing on startup](#fix-boot-order--grub-menu-not-appearing-on-startup)
- [Windows](#windows)
  - [Setting or changing the PATH system variable](#setting-or-changing-the-path-system-variable)
  - [Securely delete files on Windows 10 without third-party tools](#securely-delete-files-on-windows-10-without-third-party-tools)
- [Linux](#linux)
  - [Realtek wifi problems](#realtek-wifi-problems)
  - [Useful extensions](#useful-extensions)
  - [Adding directory to PATH](#adding-directory-to-path)
  - [What to do when Ubuntu freezes](#what-to-do-when-ubuntu-freezes)
  - [Globally customise system UI font on Ubuntu](#globally-customise-system-ui-font-on-ubuntu)
  - [Prevent the screen from turning off when the lockscreen is active](#prevent-the-screen-from-turning-off-when-the-lockscreen-is-active)
  - [Changing the default display manager](#changing-the-default-display-manager)
  - [Installing Firefox Developer Edition](#installing-firefox-developer-edition)
  - [CheckInstall](#checkinstall)
  - [Installing from an archive](#installing-from-an-archive)
  - [Uninstalling software](#uninstalling-software)
  - [Changing GNOME screenshot directory](#changing-gnome-screenshot-directory)
  - [Installing Wine](#installing-wine)
  - [Computer boots to blank screen after Ubuntu upgrade](#computer-boots-to-blank-screen-after-ubuntu-upgrade)
  - [Handling held back packages](#handling-held-back-packages)
  - [KDE Plasma](#kde-plasma)

## [Turn on or off secure boot](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/disabling-secure-boot)

Open the PC BIOS menu. You can often access this menu by pressing a key during the bootup sequence, such as F1, F2, F12, or Esc.

Or, from Windows: go to **Settings charm** > **Change PC settings** > **Update and Recovery** > **Recovery** > **Advanced Startup: Restart now**. When the PC reboots, go to **Troubleshoot** > **Advanced Options: UEFI Firmware Settings**.

Find the **Secure Boot** setting, and if possible, set it to **Enabled**. This option is usually in either the **Security** tab, the **Boot** tab, or the **Authentication** tab.

## Fix boot order / Grub menu not appearing on startup

Windows: go to **Settings charm** > **Change PC settings** > **Update and Recovery** > **Recovery** > **Advanced Startup: Restart now**. When the PC reboots, go to **Troubleshoot** > **Advanced Options: UEFI Firmware Settings**. Change the order of the OS in boot settings.

## Windows

### [Setting or changing the PATH system variable](https://www.java.com/en/download/help/path.xml)

- The **PATH** is the system variable that your operating system uses to locate needed executables from the command line or Terminal window.
- The **PATH** system variable can be set using **System Utility** in control panel on Windows.
- In Windows 10, search for 'Edit the system environment variables'
- Click on 'Environment Variables'.
- In the section System Variables, find the **PATH** environment variable and select it. Click Edit. If the **PATH** environment variable does not exist, click New.
- In the Edit System Variable (or New System Variable) window, specify the value of the **PATH** environment variable. Click OK. Close all remaining windows by clicking OK.

### [Securely delete files on Windows 10 without third-party tools](https://www.techrepublic.com/article/how-to-securely-and-completely-delete-files-in-windows-10-without-third-party-software/)

Using the [SDelete](https://docs.microsoft.com/en-us/sysinternals/downloads/sdelete) Sysinternals software.

## Linux

### Realtek wifi problems

Secure boot should be disabled before installing these drivers.

See <https://askubuntu.com/a/635629/714808>.

### Useful extensions

- [Making Ubuntu look like Windows](https://www.howtogeek.com/353819/how-to-make-ubuntu-look-more-like-windows/)

- [Dash to panel](https://github.com/home-sweet-gnome/dash-to-panel)

### [Adding directory to PATH](https://askubuntu.com/a/688998/714808)

These are added to the `.bashrc` (shell startup) file, which can be found in the Home directory.

```sh
echo export PATH=\"$(echo path/to/file/):\$PATH\" >> ~/.bashrc
```

### [What to do when Ubuntu freezes](https://askubuntu.com/a/36717/714808)

If it's completely frozen, REISUB it (safer than rebooting)

> While holding `Alt` and the `SysReq` (Print Screen) keys, type `R` `E` `I` `S` `U` `B`.
>
> R:  Switch to XLATE mode
> E:  Send Terminate signal to all processes except for init
> I:  Send Kill signal to all processes except for init
> S:  Sync all mounted file-systems
> U:  Remount file-systems as read-only
> B:  Reboot
>
> REISUB is BUSIER backwards, as in "The System is **busier** than it should be", if you need to remember it. Or mnemonically - **R**eboot; **E**ven; **I**f; **S**ystem; **U**tterly; **B**roken.
>
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

### Prevent the screen from turning off when the lockscreen is active

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

### [Changing the default display manager](https://askubuntu.com/a/58024/714808)

The following command will create a prompt to select the default display manager (GDM3 in this case):

```sh
sudo dpkg-reconfigure gdm3
```

The same command can be used to [reset the display manager](https://askubuntu.com/q/1043048/714808) should something go wrong with the GUI, or the original CSS files get corrupted.

### [Installing Firefox Developer Edition](https://askubuntu.com/a/584704/714808)

Firefox Developer Edition will work alongside other Firefox installations with separate profiles.

First, install [Ubuntu Make](https://wiki.ubuntu.com/ubuntu-make):

```sh
snap install ubuntu-make
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

### [Installing from an archive](https://askubuntu.com/a/1030/714808)

First, extract the archive. Then, open a terminal and navigate to the directory of the extracted folder.

Installation (depends on instructions):

```sh
xdg-open INSTALL
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

### [Changing GNOME screenshot directory](https://askubuntu.com/a/1102530/714808)

Use an extension:

- <https://extensions.gnome.org/extension/1179/screenshot-locations/>
- <https://github.com/kiyui/gnome-shell-screenshotlocations-extension>

### Installing Wine

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

Install the required `[libfaudio0](https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/)` libraries as recommended:

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

### [Computer boots to blank screen after Ubuntu upgrade](https://askubuntu.com/a/162076/714808)

This is likely due to proprietary graphics card software not being installed by Ubuntu during the upgrade. To fix this, boot Ubuntu in `nomodeset` to bypass the blank screen. In the Grub menu, highlight 'Ubuntu' and press `e` to edit the entry. Replace `quiet splash` with `nomodeset`. Then, press `ctrl` + `x` to boot. Download and install the proprietary graphics card drivers and reboot to fix this permanently. See below, and <https://askubuntu.com/q/47506/714808> for more information about installing additional drivers.

**Note:** If this still doesn't fix the problem, set `nomodeset` through the Grub Customiser.

#### AMD Radeon software

From the AMD website:

- <https://www.amd.com/en/support/kb/faq/gpu-635>
- <https://www.amd.com/en/support/kb/faq/amdgpupro-install>
- <https://www.amd.com/en/support/kb/release-notes/amdgpu-installation>
- <https://www.amd.com/en/support/kb/release-notes/rn-rad-lin-17-50-unified>

Open source:

- <https://askubuntu.com/a/1066106/714808>
- <https://help.ubuntu.com/community/AMDGPU-Driver>

Checking graphics card name and chipset:

```sh
sudo update-pciids # optional command, requires internet
lspci -nn | grep -E 'VGA|Display'
```

Add PPA and update:

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

### KDE Plasma

#### [Missing network manager](https://askubuntu.com/a/963902/714808)

```sh
sudo apt-get install plasma-nm
```

#### Missing terminal

Install Konsole from the app store.

#### Taking screenshots

Install Spectacle from the app store.
