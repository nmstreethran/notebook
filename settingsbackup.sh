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
cp ~/.config/okularpartrc .linux/okularpartrc.conf
cp ~/.config/user-dirs.dirs .linux/user-dirs.conf
cp ~/.config/spectaclerc .linux/spectacle.conf
sed --in-place "/lastSaveLocation=/d" .linux/spectacle.conf
cp ~/.config/kglobalshortcutsrc .linux/kglobalshortcutsrc.conf

# list of packages
pacman -Qqen > .linux/pkgs.txt
pacman -Qqem > .linux/pkgs-aur.txt

# Firefox
# ls -1 ~/.mozilla/firefox/*.dev-edition-default/extensions/ |
# awk -e '/^[A-Za-z]/ { print }' > .firefox/extensions.txt
jq '
    [.addons[] |
    if (.id | test("^(?!.*mozilla).*$"))
    then ({ id: .id, name: .defaultLocale.name })
    else empty
    end]
' ~/.mozilla/firefox/*.dev-edition-default/extensions.json > \
.firefox/extensions.json
cp ~/.mozilla/firefox/*.dev-edition-default/user.js .firefox/user.js

# Zotero
# ls -1 ~/.zotero/zotero/*/extensions/ > .zotero/extensions.txt
jq '
    [.addons[] |
    if (.id | test("^(?!.*zoteroOpenOfficeIntegration).*$"))
    then ({ id: .id, name: .defaultLocale.name })
    else empty
    end]
' ~/.zotero/zotero/*/extensions.json > .zotero/extensions.json
cp ~/.zotero/zotero/*/user.js .zotero/user.js
# fi

# symlink all notes into wiki
# ln notes/*.md gh-wiki
# ln README.md gh-wiki/Home.md
