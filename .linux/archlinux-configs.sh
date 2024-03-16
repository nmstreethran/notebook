# Arch Linux installation and maintenance steps
# https://wiki.archlinux.org/title/Installation_guide
# https://wiki.archlinux.org/title/General_recommendations
# https://wiki.archlinux.org/title/System_maintenance

# install and configure Zsh with powerline
# https://wiki.archlinux.org/title/Zsh
# https://wiki.archlinux.org/title/Powerline
# https://bbs.archlinux.org/viewtopic.php?id=239257
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

# configure Git
# https://forum.manjaro.org/t/vscode-git-ssh-askpass-exec-usr-lib-ssh-ssh-askpass-no-such-file-or-directory/78787
# https://forum.manjaro.org/t/howto-use-kwallet-as-a-login-keychain-for-storing-ssh-key-passphrases-on-kde/7088
# https://wiki.archlinux.org/title/KDE_Wallet
# the wallet's password should be the same as the user's password
sudo pacman -Syu openssh kwalletmanager kwallet-pam ksshaskpass git-lfs
git config --global user.name "username"
git config --global user.email "email"
sudo mkdir -p /usr/lib/ssh/ssh-askpass
sudo ln /usr/bin/ksshaskpass /usr/lib/ssh/ssh-askpass

# power management
sudo pacman -Syu powertop power-profiles-daemon
sudo powertop

# install an AUR helper
mkdir ~/Downloads/AUR
cd ~/Downloads/AUR
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -s -i -c

# # configure touchpad
# sudo nano /etc/X11/xorg.conf.d/30-touchpad.conf
# # paste the following:
# # Section "InputClass"
# #     Identifier "touchpad"
# #     Driver "libinput"
# #     MatchIsTouchpad "on"
# #     Option "Tapping" "on"
# #     Option "TappingButtonMap" "lmr"
# #     Option "NaturalScrolling" "true"
# # EndSection

# set GRUB theme in /etc/default/grub and regenerate configurations
sudo pacman -Syu os-prober breeze-grub
sudo nano /etc/default/grub
# add `GRUB_THEME="/usr/share/grub/themes/breeze/theme.txt"`
# uncomment `GRUB_DISABLE_OS_PROBER=false` to ensure Windows is detected
sudo grub-mkconfig -o /boot/grub/grub.cfg

# configure emoji fonts
# https://forum.manjaro.org/t/howto-enable-emoji-fonts/36695
sudo nano /etc/fonts/local.conf
# paste the XML from the link above

# themes
sudo pacman -Syu breeze-gtk kde-gtk-config

# set up Ruby
echo '# Ruby
export GEM_HOME=~/.gem
export GEM_PATH=$GEM_HOME/ruby/3.0.0
export PATH="$GEM_PATH/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
gem install bundler

# set papirus icons folder colour
papirus-folders -C teal --theme Papirus-Dark

# install and configure TeX Live
# https://tug.org/texlive/doc/texlive-en/texlive-en.html
# https://tug.org/texlive/quickinstall.html
# https://wiki.archlinux.org/title/TeX_Live
cd /run/media/nms/Backup/Downloads/
# curl https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -O
curl https://ftp.heanet.ie/mirrors/ctan.org/tex/systems/texlive/tlnet/install-tl-unx.tar.gz -O
zcat < install-tl-unx.tar.gz | tar xf -
cd install-tl-*/
# sudo perl ./install-tl --no-interaction
sudo perl ./install-tl --no-interaction --location https://ftp.heanet.ie/mirrors/ctan.org/tex/systems/texlive/tlnet
echo '# TeX Live
export MANPATH="/usr/local/texlive/2023/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2023/texmf-dist/doc/info:$INFOPATH"
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"' >> ~/.zshrc
# remove installation files
# cd ..
# rm -r install-tl-*/
# rm install-tl-unx.tar.gz

# install and configure Miniconda
# https://conda.io/projects/conda/en/latest/user-guide/install/linux.html
cd /run/media/nms/Backup/Downloads/
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O
sh Miniconda3-latest-Linux-x86_64.sh
~/miniconda3/condabin/conda init zsh
conda config --set auto_activate_base false
conda config --env --add channels conda-forge
conda config --env --set channel_priority strict
# mkdir -p /run/media/nms/Backups/.conda/pkgs
# mkdir -p /run/media/nms/Backups/.conda/envs
# conda config --add pkgs_dirs /run/media/nms/Backups/.conda/pkgs
# conda config --add envs_dirs /run/media/nms/Backups/.conda/envs
# remove installation files
# rm Miniconda3-latest-Linux-x86_64.sh

# adding Microsoft fonts from Windows partition
# https://wiki.archlinux.org/title/Microsoft_fonts
# https://wiki.archlinux.org/title/Font_configuration
mkdir ~/.local/share/fonts
cd /run/media/nms/Windows/Windows/Fonts
cp arial*.ttf comic*.ttf georgia*.ttf segoeui*.ttf segui*.ttf symbol.ttf times*.ttf trebuc*.ttf webdings.ttf wingding.ttf ~/.local/share/fonts/
# cp calibri*.ttf cambria* cour*.ttf verdana*.ttf ~/.local/share/fonts/
# update fontconfig rules
# sudo nano /usr/share/fontconfig/conf.avail/30-metric-aliases.conf
fc-cache --force

# install Citrix Workspace
# download Workspace app for Linux (x86_64)
# https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html
# https://docs.citrix.com/en-us/citrix-workspace-app-for-linux/install.html#tarball-packages
# https://wiki.archlinux.org/title/Citrix#TLS/SSL_Certificates
# https://askubuntu.com/a/830129
cd /run/media/nms/Backup/Downloads/
mkdir Citrix
mv linuxx64-*.tar.gz Citrix/
cd Citrix
tar xzvf linuxx64-*.tar.gz
./setupwfc
# configure $ICAROOT
echo '
# Citrix Workspace - ICAClient
export ICAROOT=~/ICAClient/linuxx64/' >> ~/.zshrc
source ~/.zshrc
# configure certificates
mkdir -p $ICAROOT/keystore/cacerts/
cd $ICAROOT/keystore/cacerts/
cp /etc/ca-certificates/extracted/tls-ca-bundle.pem .
awk 'BEGIN {c=0;} /BEGIN CERT/{c++} { print > "cert." c ".pem"}' < tls-ca-bundle.pem
openssl rehash $ICAROOT/keystore/cacerts/
$ICAROOT/util/ctx_rehash
# remove installation files
# rm -r /run/media/nms/Backup/Downloads/Citrix
# to reinstall or uninstall
# $ICAROOT/setupwfc
# login to virtualapp on your browser and open the .ica file with Citrix
# Workspace Engine
# launching GUIs
# ~/ICAClient/linuxx64/util/configmgr &
# ~/ICAClient/linuxx64/selfservice

# Docker
# https://wiki.archlinux.org/title/Docker#Installation
sudo pacman -Syu docker
sudo groupadd docker
sudo gpasswd -a nms docker

# enable multilib repositories
# https://wiki.archlinux.org/title/Official_repositories#multilib
sudo nano /etc/pacman.conf
yay

# Cloudflare WARP
yay -Syu cloudflare-warp-bin
sudo systemctl enable --now warp-svc.service
warp-cli register
warp-cli connect

# use custom hosts file
# https://github.com/stevenblack/hosts
sudo curl --output /etc/hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts

# remove all orphan packages
# https://wiki.archlinux.org/title/Pacman
sudo pacman -Rsn $(pacman -Qdtq)

# remove old package caches except for the latest three package versions
paccache -r

# remove all cached versions of uninstalled packages
paccache -ruk0

# check if the GPU is running or suspended
# cat /sys/bus/pci/devices/0000:01:00.0/power/runtime_status
