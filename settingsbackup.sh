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
