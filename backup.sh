#!/bin/bash

# copy VSCode settings
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    cp $HOME/.config/VSCodium/User/settings.json .vscode/settings.jsonc
    cp $HOME/.config/VSCodium/User/keybindings.json .vscode/keybindings.jsonc
    ls -1 $HOME/.vscode-oss/extensions/ > .vscode/extensions.txt
else
    cp $HOME/AppData/Roaming/Code/User/settings.json .vscode/settings-win.jsonc
    cp $HOME/AppData/Roaming/Code/User/keybindings.json \
    .vscode/keybindings-win.jsonc
    ls -1 $HOME/.vscode/extensions/ > .vscode/extensions-win.txt
fi

# copy all notes into wiki
cp *.md gh-wiki

mv gh-wiki/README.md gh-wiki/Home.md
