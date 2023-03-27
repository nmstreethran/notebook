# Windows

List of packages installed through `winget` (`.windows/pkgs-winget.json`):

```powershell
winget export --output .\.windows\pkgs-winget.json
```

Skyrim SE plugin list (`.windows/skyrimse-plugins.txt`) and load order (`.windows/skyrimse-loadorder.txt`) for mods managed with Vortex:

```powershell
cp $HOME\AppData\Roaming\Vortex\skyrimse\profiles\HJcaJmmWi\plugins.txt .\.windows\skyrimse-plugins.txt
cp $HOME\AppData\Roaming\Vortex\skyrimse\profiles\HJcaJmmWi\loadorder.txt .\.windows\skyrimse-loadorder.txt
```

Windows Terminal settings are saved in `.windows/term-settings.json`.

## Development environment setup

- Install Windows Terminal
- Install and set-up WSL: `wsl --install`
- Install Visual Studio Code in Windows: `winget install vscode`
- Install the WSL VS Code extension
- Setup SSH and Git in WSL
- Install Miniconda in WSL
- Clone Git repositories in WSL using SSH
- Launch VS Code by navigating to the Git repository directory and running `code .`
- Install VS Code extensions in WSL

See:

- <https://learn.microsoft.com/en-us/windows/wsl/>
- <https://code.visualstudio.com/docs/remote/wsl>
