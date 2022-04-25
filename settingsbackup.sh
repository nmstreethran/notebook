#!/bin/bash

# copy VSCode settings
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    cp ~/.config/VSCodium/User/settings.json .vscode/settings.jsonc
    cp ~/.config/VSCodium/User/keybindings.json .vscode/keybindings.jsonc
    ls -1 ~/.vscode-oss/extensions/ > .vscode/extensions.txt
fi

# copy all notes into wiki
cp *.md gh-wiki
mv gh-wiki/README.md gh-wiki/Home.md

# copy other settings
cp ~/.zshrc .manjaro/.zshrc
cp ~/.ssh/config .manjaro/ssh-config.txt
cp /etc/fonts/local.conf .manjaro/fonts-local.conf
cp ~/.local/share/konsole/*.profile .manjaro/konsole.profile
cp ~/.kde4/share/config/kdeglobals .manjaro/kdeglobals.txt
cp ~/.local/share/kxmlgui5/okular/part.rc .manjaro/okular-part.rc

# # list of packages
# pamac list --explicitly-installed --quiet > .manjaro/pkgs.txt
# pamac list --foreign --quiet > .manjaro/aur.txt
