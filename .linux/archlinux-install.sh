# Arch Linux installation and maintenance steps
# https://wiki.archlinux.org/title/Installation_guide
# https://wiki.archlinux.org/title/General_recommendations

# verify the boot mode
ls /sys/firmware/efi/efivars

# ensure your network interface is listed and enabled
ip link

# connect to the ethernet
# verify connection
ping google.com

# ensure the system clock is accurate
timedatectl set-ntp true

# check the service status
timedatectl status

# identify disk devices
fdisk -l

# see the list of partitions and their identifiers
lsblk -f

# format Linux file system partition
mkfs.ext4 /dev/sda6

# initialise swap partition
mkswap /dev/sda7

# mount file system
mount /dev/sda6 /mnt

# mount EFI system partition
mount --mkdir /dev/sda1 /mnt/boot

# enable swap
swapon /dev/sda7

# view mirror list
cat /etc/pacman.d/mirrorlist

# install base packages
pacstrap /mnt base linux linux-firmware base-devel pacman-contrib nano

# generate an fstab file
genfstab -U /mnt >> /mnt/etc/fstab

# check the fstab file and modify to automatically mount other partitions
# https://wiki.archlinux.org/title/Fstab#Auto_mount_devices
nano /mnt/etc/fstab

# change root into the new system
arch-chroot /mnt

# check the current timezone
timedatectl status

# set time zone
timedatectl set-timezone Europe/Dublin

# create link for the time zone
ln -sf /usr/share/zoneinfo/Europe/Dublin /etc/localtime

# generate /etc/adjtime
hwclock --systohc

# enable required locales (en_US.UTF-8 UTF-8, ...)
nano /etc/locale.gen

# generate locales
locale-gen

# create locale configuration and add the desired locale
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# create the hostname file
echo "myhostname" > /etc/hostname

# recreate the initramfs image
mkinitcpio -P

# set the root password
passwd

# install boot loader
# https://wiki.archlinux.org/title/Arch_boot_process
# https://wiki.archlinux.org/title/GRUB
pacman -Syu grub efibootmgr

# install the GRUB EFI application
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

# install microcode
# https://wiki.archlinux.org/title/Microcode
pacman -Syu intel-ucode

# generate GRUB configuration
grub-mkconfig -o /boot/grub/grub.cfg

# create a new user and set a password
# https://wiki.archlinux.org/title/Users_and_groups
useradd -m nms
passwd nms

# use nano to access sudoers file
# https://wiki.archlinux.org/title/Sudo
EDITOR=nano visudo

# allow the new user to gain full root privileges using sudo
# e.g. add nms    ALL=(ALL:ALL) ALL
visudo

# install display libraries, desktop environment, and video drivers
# https://wiki.archlinux.org/title/Xorg#Driver_installation
# https://wiki.archlinux.org/title/Backlight
pacman -Syu xorg-server xf86-video-amdgpu xf86-video-ati plasma-desktop sddm-kcm powerdevil

# enable display manager
systemctl enable sddm

# install network manager and start the service
# https://wiki.archlinux.org/title/Network_configuration
# https://wiki.archlinux.org/title/NetworkManager
pacman -Syu networkmanager plasma-nm
systemctl enable NetworkManager.service
systemctl start NetworkManager.service

# view list of wireless connections
nmcli dev wifi list

# connect to the desired wireless network
nmcli --ask device wifi connect "SSID"

# install sound card firmware and configure volumes
# https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture
pacman -Syu alsa-utils alsa-firmware plasma-pa
amixer sset Master unmute
amixer sset Speaker unmute
amixer sset Headphone unmute

# install Bluetooth libraries
# https://wiki.archlinux.org/title/Bluetooth
# https://bbs.archlinux.org/viewtopic.php?pid=1998583#p1998583
pacman -Syu bluez-utils bluedevil pulseaudio-bluetooth

# enable NTFS support
# https://wiki.archlinux.org/title/NTFS
pacman -Syu ntfs-3g

# install basic utilities
pacman -Syu kate firefox dolphin konsole

# restart to boot into new system
reboot

# boot into new user account
# configure Git
# https://forum.manjaro.org/t/vscode-git-ssh-askpass-exec-usr-lib-ssh-ssh-askpass-no-such-file-or-directory/78787
# https://forum.manjaro.org/t/howto-use-kwallet-as-a-login-keychain-for-storing-ssh-key-passphrases-on-kde/7088
# https://wiki.archlinux.org/title/KDE_Wallet
sudo pacman -Syu git-lfs ksshaskpass kwallet-pam kwalletmanager
git config --global user.name "username"
git config --global user.email "email"
sudo ln /usr/bin/ksshaskpass /usr/lib/ssh/ssh-askpass

# install and configure Zsh with powerline
# https://wiki.archlinux.org/title/Zsh
# https://wiki.archlinux.org/title/Powerline
# https://bbs.archlinux.org/viewtopic.php?id=239257
sudo pacman -Syu zsh powerline powerline-fonts
autoload -Uz zsh-newuser-install
zsh-newuser-install -f
echo '# Powerlines
powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh

# Keyboard shortcuts for Zsh
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line' >> ~/.zshrc

# install themes
sudo pacman -Syu kde-gtk-config breeze-grub breeze-gtk papirus-icon-theme oxygen

# set GRUB theme in /etc/default/grub and regenerate configurations
sudo nano /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

# install additional utilities
sudo pacman -Syu libreoffice-fresh okular gwenview smplayer-themes keepassxc qbittorrent qgis scrcpy spectacle speedtest-cli yakuake neofetch fzf partitionmanager ark

# install fonts
sudo pacman -Syu noto-fonts-cjk noto-fonts-emoji ttf-cascadia-code libertinus-font

# configure emoji fonts
# https://forum.manjaro.org/t/howto-enable-emoji-fonts/36695
sudo nano /etc/fonts/local.conf

# set up Ruby
sudo pacman -Syu ruby2.7
echo '# Ruby
export GEM_HOME=~/.gem
export GEM_PATH=$GEM_HOME/ruby/2.7.0
export PATH="$GEM_PATH/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
gem-2.7 install bundler

# install libraries for LaTeX
sudo pacman -Syu texlive-latexextra texlive-fontsextra texlive-formatsextra texlive-bibtexextra biber python-pygments jre-openjdk

# install an AUR helper
mkdir ~/Downloads/AUR
cd ~/Downloads/AUR
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -s -i -c

# install additional utilities from AUR
yay -Syu brave-bin vscodium-bin zotero-bin ytfzf

# install additional fonts and themes from AUR
yay -Syu nerd-fonts-cascadia-code nerd-fonts-source-code-pro papirus-folders plasma5-themes-breath

# set papirus icons folder colour
papirus-folders -C teal --theme Papirus-Dark

# use custom hosts file
# https://github.com/stevenblack/hosts
sudo curl --output /etc/hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts

# install and configure Miniconda
# https://conda.io/projects/conda/en/latest/user-guide/install/linux.html
curl --output ~/Downloads/Miniconda3-latest-Linux-x86_64.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sha256sum ~/Downloads/Miniconda3-latest-Linux-x86_64.sh
bash ~/Downloads/Miniconda3-latest-Linux-x86_64.sh
~/miniconda3/condabin/conda init zsh
conda config --set auto_activate_base false

# adding Microsoft fonts from Windows partition
# https://wiki.archlinux.org/title/Microsoft_fonts
# https://wiki.archlinux.org/title/Font_configuration
mkdir ~/.local/share/fonts
cd /run/media/nms/Windows/Windows/Fonts
cp arial*.ttf calibri*.ttf cambria* comic*.ttf cour*.ttf georgia*.ttf symbol.ttf times*.ttf trebuc*.ttf verdana*.ttf webdings.ttf wingding.ttf ~/.local/share/fonts/
# update fontconfig rules
sudo nano /usr/share/fontconfig/conf.avail/30-metric-aliases.conf
fc-cache --force

# install Citrix Receiver
# download Workspace app for Linux (x86_64)
# https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html
# https://docs.citrix.com/en-us/citrix-workspace-app-for-linux/install.html#tarball-packages
# https://wiki.archlinux.org/title/Citrix#TLS/SSL_Certificates
# https://askubuntu.com/a/830129
sudo pacman -Syu webkit2gtk gtk2
mkdir ~/Downloads/Citrix
mv linuxx64-*.tar.gz ~/Downloads/Citrix/
cd ~/Downloads/Citrix
tar xzvf linuxx64-*.tar.gz
./setupwfc
# configure certificates
mkdir -p ~/ICAClient/linuxx64/keystore/cacerts/
cd ~/ICAClient/linuxx64/keystore/cacerts/
cp /etc/ca-certificates/extracted/tls-ca-bundle.pem .
awk 'BEGIN {c=0;} /BEGIN CERT/{c++} { print > "cert." c ".pem"}' < tls-ca-bundle.pem
openssl rehash ~/ICAClient/linuxx64/keystore/cacerts/
~/ICAClient/linuxx64/util/ctx_rehash
# login to virtualapp on your browser and open the .ica file with Citrix
# Workspace Engine
# launching GUIs
# ~/ICAClient/linuxx64/util/configmgr &
# ~/ICAClient/linuxx64/selfservice
