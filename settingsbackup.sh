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
cp ~/.local/share/kxmlgui5/okular/part.rc .linux/okular-part.xml
cp ~/.config/user-dirs.dirs .linux/user-dirs.conf
cp ~/.config/spectaclerc .linux/spectacle.conf
cp ~/.config/kglobalshortcutsrc .linux/kglobalshortcutsrc.conf

# list of packages
pacman -Qqen > .linux/pkgs.txt
pacman -Qqem > .linux/pkgs-aur.txt

# Zotero
ls -1 ~/.zotero/zotero/*/extensions/ > .zotero/extensions.txt
cp ~/.zotero/zotero/*/prefs.js .zotero/prefs.js
# fi

# symlink all notes into wiki
# ln notes/*.md gh-wiki
# ln README.md gh-wiki/Home.md
