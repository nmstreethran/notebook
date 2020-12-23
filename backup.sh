#!/bin/sh

# copy VSCode settings
cp $HOME/.config/VSCodium/User/settings.json vscode-settings/settings.jsonc

cp /media/nms/Windows/Users/nithi/AppData/Roaming/Code/User/settings.json vscode-settings/settings-win.jsonc

cp $HOME/.config/VSCodium/User/keybindings.json \
vscode-settings/keybindings.jsonc

ls -1d $HOME/.vscode-oss/extensions/*/ |
awk -F "/" "{print \$(NF-1)}" > vscode-settings/extensions.txt

# copy all notes into wiki
cp -a *notes.md gh-wiki

cp README.md gh-wiki/Home.md

cp programme-list.md gh-wiki/programme-list.md
