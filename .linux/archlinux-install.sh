# Arch Linux installation steps
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
pacstrap /mnt base linux linux-firmware linux-lts base-devel pacman-contrib nano

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
# https://wiki.archlinux.org/title/Locale
nano /etc/locale.gen

# generate locales
locale-gen

# create locale configuration and add the desired locale
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# create the hostname file
echo "my-archlinux" > /etc/hostname

# recreate the initramfs image
mkinitcpio -P

# set the root password
passwd

# install boot loader and microcode
# https://wiki.archlinux.org/title/Arch_boot_process
# https://wiki.archlinux.org/title/GRUB
# https://wiki.archlinux.org/title/Microcode
pacman -Syu grub efibootmgr intel-ucode

# install the GRUB EFI application
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

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
# e.g. add `nms    ALL=(ALL:ALL) ALL` (tab between the username and ALL)

# install display libraries, desktop environment, input, and video drivers
# https://wiki.archlinux.org/title/Xorg#Driver_installation
# https://wiki.archlinux.org/title/Backlight
# https://wiki.archlinux.org/title/Libinput#Touchpad_configuration
pacman -Syu plasma-desktop sddm-kcm powerdevil xf86-video-nouveau xorg-xinput
# enable display manager
systemctl enable sddm

# install network manager and start the service
# https://wiki.archlinux.org/title/Network_configuration
# https://wiki.archlinux.org/title/NetworkManager
pacman -Syu plasma-nm
systemctl enable NetworkManager
# systemctl start NetworkManager.service
# view list of wireless connections
# nmcli dev wifi list
# connect to the desired wireless network
# nmcli --ask device wifi connect "SSID"

# install sound card firmware and configure volumes
# https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture
pacman -Syu alsa-utils alsa-firmware plasma-pa sof-firmware
# amixer sset Master unmute
# amixer sset Speaker unmute
# amixer sset Headphone unmute

# install Bluetooth libraries
# https://wiki.archlinux.org/title/Bluetooth
# https://bbs.archlinux.org/viewtopic.php?pid=1998583#p1998583
pacman -Syu bluez-utils bluedevil pulseaudio-bluetooth
systemctl enable bluetooth.service

# enable NTFS support
# https://wiki.archlinux.org/title/NTFS
pacman -Syu ntfs-3g

# install basic utilities
pacman -Syu kate firefox dolphin zsh yakuake

# exit the chroot environment
exit

# restart to boot into new system
reboot
