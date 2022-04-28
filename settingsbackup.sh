#!/bin/sh

# copy VSCode settings
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    cp ~/.config/VSCodium/User/settings.json .vscode/settings.jsonc
    cp ~/.config/VSCodium/User/keybindings.json .vscode/keybindings.jsonc
    for dir in $(ls ~/.vscode-oss/extensions/);
    do echo ${dir%-*};
    done > .vscode/extensions.txt
fi

# copy all notes into wiki
cp *.md gh-wiki
mv gh-wiki/README.md gh-wiki/Home.md

# copy other settings
cp ~/.zshrc .manjaro/.zshrc
cp ~/.ssh/config .manjaro/ssh-config.txt
cp /etc/fonts/local.conf .manjaro/fonts-local.xml
cp ~/.local/share/konsole/*.profile .manjaro/konsole.conf
cp ~/.kde4/share/config/kdeglobals .manjaro/kdeglobals.conf
cp ~/.local/share/kxmlgui5/okular/part.rc .manjaro/okular-part.xml

# list of packages
# pamac list --explicitly-installed --quiet > .manjaro/pkgs.txt
pamac list --foreign --quiet > .manjaro/pkgs-aur.txt
