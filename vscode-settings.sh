#! /bin/bash

# copy vscode settings

cp $HOME/.config/VSCodium/User/settings.json vscode-settings/settings.jsonc
cp $HOME/.config/VSCodium/User/keybindings.json vscode-settings/keybindings.jsonc
ls -1d $HOME/.vscode-oss/extensions/*/ | awk -F "/" "{print \$(NF-1)}" > vscode-settings/extensions.txt
