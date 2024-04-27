# Pop!_OS

## Installation alongside Windows

1.  Disable secure boot in the UEFI settings.
1.  When logged in to Windows:
    - Open Disk Management and unassign any drive letters for the two Linux partitions.
    - For MSI computers, use the MSI Dragon Centre to set battery charging limits.
    - Also open power management and turn off all hibernate options. Then, open PowerShell with administrative rights, and [run](https://learn.microsoft.com/en-us/troubleshoot/windows-client/deployment/disable-and-re-enable-hibernation) `powercfg.exe /hibernate off`. This will prevent Windows from blocking write access to drives when logged in to Linux.
1.  Create a live USB of Pop!_OS.
1.  Boot from the live USB.
1.  Select language, locale, keyboard input language, and keyboard layout.
1.  Select Custom (Advanced) install.
1.  Create partitions for Pop!_OS:
    - 1 GB fat32 partition for `/boot/efi`
    - 4 GB linux-swap partition for `swap`
    - ext4 partition for `/`
    - ext4 partition for `/home` (optional)
    - 4096 MB partition for `/recovery` (optional)
1.  Set-up the user account.
1.  Install.
1.  Set Pop!_OS as first in the boot order in the UEFI settings.
1.  Assign Windows to the boot menu:
    - Boot Pop!_OS.
    - Launch a terminal.
    - Run `lsblk` to identify the Windows EFI partition and the new boot partition created when installing Pop!_OS.
    - Mount the Windows EFI partition: `sudo mount /dev/nvme0n1p1 /mnt`.
    - Copy the Microsoft boot folder into the Pop!_OS boot partition: `sudo cp -ax /mnt/EFI/Microsoft /boot/efi/EFI/`.
    - Make the boot menu appear by modifying the loader (`sudo nano /boot/efi/loader/loader.conf`) and adding a new line with a timeout (e.g. `timeout 5`).

Links:

- <https://support.system76.com/articles/install-pop/>
- <https://github.com/spxak1/weywot/blob/main/Pop_OS_Dual_Boot.md>

## Commands

The usual commands:

```sh
sudo apt update
sudo apt upgrade
sudo apt autoremove
```

## Configurations

Configure mouse and touchpad:

Go to Settings > Mouse & Touchpad.
Set the click option to Right-Click with Click in Bottom Right Corner or Two Finger Tap.
Enable natural scrolling and two-finger scrolling for the touchpad.

Configure power settings:

Go to Settings > Power and set the Power Button Behaviour to Suspend.

[Copy Windows fonts](https://wiki.archlinux.org/title/Microsoft_fonts):

```sh
mkdir ~/.local/share/fonts
cd /media/nithiya/Windows/Fonts
cp arial*.ttf comic*.ttf georgia*.ttf segoeui*.ttf segui*.ttf symbol.ttf times*.ttf trebuc*.ttf webdings.ttf wingding.ttf ~/.local/share/fonts/
fc-cache --force
```

[Delete unnecessary locales](https://askubuntu.com/a/1419010) and configure languages:

```sh
cd /var/lib/locales/supported.d
sudo rm ar de es fr it ja pt ru zh-hans zh-hant
sudo nano en  # comment out unnecessary locales
sudo locale-gen  # regenerate
```

Go to Settings > Region & Language > Manage Installed Languages and remove all unnecessary languages.
Set the desired language, e.g. English (United Kingdom), and regional format, e.g. English (Ireland).

Uninstall unnecessary languages:

```sh
sudo apt remove wamerican wbrazilian wfrench witalian wngerman wogerman wportuguese wspanish wswiss
```

Uninstall unnecessary packages:

```sh
sudo apt remove geary kdeconnect
sudo apt autoremove
```

[Configure GTK themes](https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications):

Install the following:

```sh
sudo apt install qt5ct breeze-icon-theme
```

Launch the Qt5 Settings app and configure the style, font, and icon theme.

[Install Firefox Developer Edition](https://askubuntu.com/a/584704):

```sh
sudo add-apt-repository ppa:lyzardking/ubuntu-make
sudo apt update && sudo apt install ubuntu-make
umake web firefox-dev
```

[Install VSCodium](https://vscodium.com/):

```sh
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium
```

Configure SSH and Git:

```sh
ls -al ~/.ssh
eval $(ssh-agent)
ssh-add
ssh-keygen -t ed25519 -C "name@email.com"
git config --global user.name "Nithiya Streethran"
git config --global user.email "name@email.com"
git config --global commit.gpgsign true
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519.pub
```

[Install Zotero](https://www.zotero.org/support/installation):

Download the tarball and extract the contents to `~/opt/zotero`.
Set the launcher icon and symlink:

```sh
cd ~/opt/zotero
./set_launcher_icon
ln -s "$PWD/zotero.desktop" ~/.local/share/applications/
```

[Install TeXLive](https://tug.org/texlive/):

```sh
# https://wiki.archlinux.org/title/TeX_Live
cd ~/Downloads/
# curl https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -O
curl https://ftp.heanet.ie/mirrors/ctan.org/tex/systems/texlive/tlnet/install-tl-unx.tar.gz -O
zcat < install-tl-unx.tar.gz | tar xf -
cd install-tl-*/
# sudo perl ./install-tl --no-interaction
sudo perl ./install-tl --no-interaction --location https://ftp.heanet.ie/mirrors/ctan.org/tex/systems/texlive/tlnet
echo '# TeX Live
export MANPATH="/usr/local/texlive/2023/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2023/texmf-dist/doc/info:$INFOPATH"
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"' >> ~/.bashrc
```

Install Ruby:

```sh
sudo apt install ruby-dev ruby-bundler
echo 'export GEM_HOME=~/.gem
export GEM_PATH=$GEM_HOME/ruby/3.0.0
export PATH="$GEM_PATH/bin:$PATH"' >> ~/.bashrc
gem install bundler
```

[Use a custom hosts file](https://github.com/stevenblack/hosts):

```sh
sudo curl --output /etc/hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
```
