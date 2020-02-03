# System notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Turn on or off secure boot](#turn-on-or-off-secure-boot)
- [Fix boot order / Grub menu not appearing on startup](#fix-boot-order--grub-menu-not-appearing-on-startup)
- [Windows](#windows)
  - [Setting or changing the PATH system variable](#setting-or-changing-the-path-system-variable)
  - [Securely delete files on Windows 10 without third-party tools](#securely-delete-files-on-windows-10-without-third-party-tools)
- [Linux](#linux)
  - [Drivers and applications](#drivers-and-applications)
  - [Realtek wifi problems](#realtek-wifi-problems)
  - [Making Ubuntu look like Windows](#making-ubuntu-look-like-windows)
  - [File syncing using rclone](#file-syncing-using-rclone)
  - [Adding directory to PATH](#adding-directory-to-path)
  - [What to do when Ubuntu freezes](#what-to-do-when-ubuntu-freezes)
  - [Globally customise system UI font on Ubuntu](#globally-customise-system-ui-font-on-ubuntu)
  - [Prevent the screen from turning off when the lockscreen is active](#prevent-the-screen-from-turning-off-when-the-lockscreen-is-active)
  - [Changing the default display manager](#changing-the-default-display-manager)

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

### Drivers and applications

- Radeon Software for Linux Installation (search for Linux in the AMD website)
- [VSCodium installation](https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo)

### Realtek wifi problems

Secure boot should be disabled before installing these drivers.

### [Making Ubuntu look like Windows](https://www.howtogeek.com/353819/how-to-make-ubuntu-look-more-like-windows/)

- [Dash to panel](https://github.com/home-sweet-gnome/dash-to-panel)

### File syncing using rclone

- <https://www.techrepublic.com/article/how-to-sync-from-linux-to-google-drive-with-rclone/>
- <https://github.com/ncw/rclone>
- <https://rclone.org/>

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

Using an extension by [u/SomeGenericUsername](https://www.reddit.com/r/gnome/comments/2hj8bx/has_anyone_figured_out_a_way_to_keep_the_screen/cktqjqd?utm_source=share&utm_medium=web2x)

> I don't think it is possible to achieve that with config options alone as it is not intended to work that way and certain parts of the sequence from fading to blanking to locking the screen are hardcoded. This gets complicated even further by this whole thing being spread across multiple processes. The shell is what does the fading but then it tells gnome-settings-daemon to blank the screen via d-bus signals. That's at least my limited understanding from quickly glancing at the involved code.
>
> Now, I've just written an extension, that kind of works around all of that. It disables the fading and removes the emission of the d-bus signal. This whole thing is super ugly and would never stand a chance to get accepted for extensions.gnome.org as extensions are supposed to be disabled when the lock screen gets activated, but that won't make much sense for this extension. That also means you can't disable it like you are used to, but that you have to restart gnome-shell after disabling if for it to be actually disabled. Another thing is that there might be other applications listening to the d-bus signal I've disabled and that might have some security implications. I'm not sure which signal gnome-keyring uses to lock its keyring when the lock screen gets shown, but this signal might be it or it might be part of a signal chain to some other signal that would lock the keyring. The way I've removed the signal emission might also affect gnome-shell internally, so maybe it won't automatically change your online status to away anymore, but I haven't checked for that either.
>
> I've only tested the extension on 3.14, but I think it should work on 3.10 or 3.12 as well, if you haven't upgraded yet. Also my testing was not really thorough, but it seems to be working for both, locking the screen based on the user being idle and on clicking the lock button.
> So after all this has been said, here is the extension now:
>
> <https://www.dropbox.com/s/5owr2bxhbijdino/no-screen-blank%40example.com.zip?dl=1>
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
