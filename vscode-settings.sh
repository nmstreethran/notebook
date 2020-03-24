#! /bin/bash

# copy vscode settings

cp "$HOME/.config/Code - Insiders/User/settings.json" vscode-settings/settings.json
cp "$HOME/.config/Code - Insiders/User/keybindings.json" vscode-settings/keybindings.json
ls -1d $HOME/.vscode-insiders/extensions/*/ | awk -F "/" "{print \$(NF-1)}" > vscode-settings/extensions.txt
