# VS Code

Copy keybindings (`.vscode/keybindings.jsonc`) and settings (`.vscode/settings.jsonc`):

```sh
cp ~/.config/VSCodium/User/keybindings.json .vscode/keybindings.jsonc
cp ~/.config/VSCodium/User/settings.json .vscode/settings.jsonc
```

<!-- Get list of installed extensions (`.vscode/extensions.txt`):

```sh
for dir in $(ls ~/.vscode-oss/extensions/);
do echo ${dir%-*};
done > .vscode/extensions.txt
``` -->
