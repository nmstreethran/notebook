# Arch Linux installation and maintenance steps
# https://wiki.archlinux.org/title/Installation_guide
# https://wiki.archlinux.org/title/General_recommendations
# https://wiki.archlinux.org/title/System_maintenance

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

# install fonts
sudo pacman -Syu noto-fonts-cjk noto-fonts-emoji

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

# install an AUR helper
mkdir ~/Downloads/AUR
cd ~/Downloads/AUR
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -s -i -c

# enable multilib repositories
# https://wiki.archlinux.org/title/Official_repositories#multilib
sudo nano /etc/pacman.conf
yay

# install Steam and fix graphics settings
# https://wiki.archlinux.org/title/Steam
# https://wiki.archlinux.org/title/Vulkan
# https://redd.it/tqai5t
sudo pacman -Syu steam amdvlk lib32-amdvlk
cp /usr/share/applications/steam.desktop ~/.local/share/applications/steam.desktop
nano ~/.local/share/applications/steam.desktop

# set papirus icons folder colour
yay papirus-folders
papirus-folders -C teal --theme Papirus-Dark

# use custom hosts file
# https://github.com/stevenblack/hosts
sudo curl --output /etc/hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts

# install and configure Miniconda
# https://conda.io/projects/conda/en/latest/user-guide/install/linux.html
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh --output ~/Downloads/Miniconda3-latest-Linux-x86_64.sh
sh ~/Downloads/Miniconda3-latest-Linux-x86_64.sh
~/miniconda3/condabin/conda init zsh
conda config --set auto_activate_base false
rm ~/Downloads/Miniconda3-latest-Linux-x86_64.sh

# adding Microsoft fonts from Windows partition
# https://wiki.archlinux.org/title/Microsoft_fonts
# https://wiki.archlinux.org/title/Font_configuration
mkdir ~/.local/share/fonts
cd /run/media/nms/Windows/Windows/Fonts
cp arial*.ttf comic*.ttf georgia*.ttf segoeui*.ttf segui*.ttf symbol.ttf times*.ttf trebuc*.ttf webdings.ttf wingding.ttf ~/.local/share/fonts/
# cp calibri*.ttf cambria* cour*.ttf verdana*.ttf ~/.local/share/fonts/
# update fontconfig rules
sudo nano /usr/share/fontconfig/conf.avail/30-metric-aliases.conf
fc-cache --force

# install Citrix Workspace
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
rm -r ~/Downloads/Citrix
# to reinstall or uninstall
$ICAROOT/setupwfc
# login to virtualapp on your browser and open the .ica file with Citrix
# Workspace Engine
# launching GUIs
# ~/ICAClient/linuxx64/util/configmgr &
# ~/ICAClient/linuxx64/selfservice

# install R in a Conda environment
conda create --name r-lang --channel conda-forge r-base r-essentials
conda activate r-lang
# install the following if there are issues with
# install.packages("languageserver")
# conda install --channel conda-forge r-stringi r-knitr r-xml2 r-lintr r-roxygen2
# do the following if there are errors while loading shared libraries
# https://askubuntu.com/a/1209723
# sudo ln -s /lib/libreadline.so.8.1 /lib/libreadline.so.6
# sudo ln -s /lib/libncurses.so /lib/libncurses.so.5