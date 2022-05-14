#!/bin/sh

# copy VSCode settings
# if [[ "$OSTYPE" == "linux-gnu"* ]]; then
cp ~/.config/VSCodium/User/settings.json .vscode/settings.jsonc
cp ~/.config/VSCodium/User/keybindings.json .vscode/keybindings.jsonc
for dir in $(ls ~/.vscode-oss/extensions/);
do echo ${dir%-*};
done > .vscode/extensions.txt

# copy other settings
cp ~/.zshrc .linux/.zshrc
cp ~/.local/share/konsole/*.profile .linux/konsole/
cp ~/.kde4/share/config/kdeglobals .linux/kdeglobals.conf
cp ~/.local/share/kxmlgui5/okular/part.rc .linux/okular-part.xml

# list of packages
pacman -Qeq > .linux/pkgs.txt
pacman -Qmq > .linux/pkgs-aur.txt
# fi

# copy all notes into wiki
cp notes/*.md gh-wiki
cp README.md gh-wiki/Home.md
