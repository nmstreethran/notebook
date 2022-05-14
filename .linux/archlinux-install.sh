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
pacstrap /mnt base linux linux-firmware base-devel pacman-contrib

# generate an fstab file
genfstab -U /mnt >> /mnt/etc/fstab

# check the fstab file
# https://wiki.archlinux.org/title/Fstab#Auto_mount_devices
cat /mnt/etc/fstab

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

# install text editor
pacman -Syu nano

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

# install display libraries
# https://wiki.archlinux.org/title/Backlight
pacman -Syu xorg-server xf86-video-amdgpu

# install desktop environment
pacman -Syu plasma-desktop sddm-kcm kde-gtk-config breeze-grub breeze-gtk

# set GRUB theme in /etc/default/grub and regenerate configurations
nano /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

# enable display manager
systemctl enable sddm

# install network manager
# https://wiki.archlinux.org/title/Network_configuration
# https://wiki.archlinux.org/title/NetworkManager
pacman -Syu networkmanager plasma-nm

# enable and start networkmanager service
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

# install and enable Bluetooth
# https://wiki.archlinux.org/title/Bluetooth
# https://bbs.archlinux.org/viewtopic.php?pid=1998583#p1998583
pacman -Syu bluez-utils bluedevil pulseaudio-bluetooth
systemctl enable bluetooth.service

# enable NTFS support
# https://wiki.archlinux.org/title/NTFS
pacman -Syu ntfs-3g

# configure Git
pacman -Syu git ksshaskpass
ln /usr/bin/ksshaskpass /usr/lib/ssh/ssh-askpass

# install base utilities
pacman -Syu kate firefox dolphin konsole

# restart to boot into new system
reboot

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

# install additional utilities
sudo pacman -Syu libreoffice-fresh okular gwenview smplayer-themes

# install fonts
sudo pacman -Syu noto-fonts-cjk noto-fonts-emoji ttf-cascadia-code libertinus-font

# set up Ruby
sudo pacman -Syu ruby2.7
echo '# Ruby
export GEM_HOME=~/.gem
export GEM_PATH=$GEM_HOME/ruby/2.7.0
export PATH="$GEM_PATH/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
gem-2.7 install bundler

# install an AUR helper
mkdir ~/Downloads/AUR
cd ~/Downloads/AUR
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -s -i -c
