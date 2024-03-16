#!/bin/sh

mkdir -p linux

# copy VSCode settings
# if [[ "$OSTYPE" == "linux-gnu"* ]]; then
# for dir in $(ls -d ~/.vscode-oss/extensions/*/);
# do echo ${dir%%/};
# done > linux/vscode-extensions.txt
cat ~/.vscode-oss/extensions/extensions.json | \
jq --raw-output '.[] | .identifier.id' | sort > linux/vscode-extensions.txt

cp --parents ~/.local/share/konsole/*.profile linux
for setting in .config/VSCodium/User/settings.json .config/VSCodium/User/keybindings.json .zshrc .local/share/kxmlgui5/okular/part.rc .config/okularpartrc .config/spectaclerc .config/kglobalshortcutsrc .xscreensaver .ssh/config;
do cp --parents ~/${setting} linux
done
sed --in-place "/lastSaveAsLocation=/d" linux/home/nms/.config/spectaclerc
sed --in-place "/lastSaveLocation=/d" linux/home/nms/.config/spectaclerc
sed --in-place "/lastImageSaveLocation=/d" linux/home/nms/.config/spectaclerc
sed --in-place "/Recent URLs/d" linux/home/nms/.config/spectaclerc
sed --in-place "/Recent Files/d" linux/home/nms/.config/spectaclerc
# sed --in-place "/window-position=/d" linux/home/nms/.config/spectaclerc
# sed --in-place "/SplitterSizes=/d" linux/home/nms/.config/spectaclerc
# sed --in-place "/ViewMode=/d" linux/home/nms/.config/spectaclerc

# list of packages
pacman -Qqen > linux/pkgs-pacman.txt
pacman -Qqem > linux/pkgs-aur.txt

# Firefox
# ls -1 ~/.mozilla/firefox/*.dev-edition-default/extensions/ |
# awk -e '/^[A-Za-z]/ { print }' > .firefox/extensions.txt
jq '
    [.addons[] |
    if (.id | test("^(?!.*mozilla).*$"))
    then ({ id: .id, name: .defaultLocale.name })
    else empty
    end] | sort_by(.name)
' ~/.mozilla/firefox/*.dev-edition-default/extensions.json > \
linux/firefox-extensions.json
cp --parents ~/.mozilla/firefox/*.dev-edition-default/user.js linux

# Zotero
# ls -1 ~/.zotero/zotero/*/extensions/ > linux/zotero-extensions.txt
jq '
    [.addons[] |
    if (.id | test("^(?!.*zoteroOpenOfficeIntegration).*$"))
    then ({ id: .id, name: .defaultLocale.name })
    else empty
    end] | sort_by(.name)
' ~/.zotero/zotero/*/extensions.json > linux/zotero-extensions.json
cp --parents ~/.zotero/zotero/*/user.js linux
# fi

# symlink all notes into wiki
# ln notes/*.md gh-wiki
# ln README.md gh-wiki/Home.md
