#!/bin/sh

# copy vscode settings
cp $HOME/.config/VSCodium/User/settings.json vscode-settings/settings.jsonc
cp $HOME/.config/VSCodium/User/keybindings.json vscode-settings/keybindings.jsonc
ls -1d $HOME/.vscode-oss/extensions/*/ | awk -F "/" "{print \$(NF-1)}" > vscode-settings/extensions.txt

# copy os settings
cp $HOME/.config/latte/MyLayout.layout.latte desktop-settings/panel.layout.latte
sed -i -e "s/^lastUsedActivity=.*$/lastUsedActivity=/" desktop-settings/panel.layout.latte
sed -i -e "s/^hiddenItems=.*$/hiddenItems=/" desktop-settings/panel.layout.latte
sed -i -e "s/^extraItems=.*$/extraItems=/" desktop-settings/panel.layout.latte
sed -i -e "s/^tileModel=.*$/tileModel=/" desktop-settings/panel.layout.latte
sed -i -e "s/^PreloadWeight=.*$/PreloadWeight=/" desktop-settings/panel.layout.latte

# copy all notes into wiki
cp -a *notes.md gh-wiki
cp README.md gh-wiki/Home.md
