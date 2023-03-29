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
- Install the WSL and Remote - SSH VS Code extensions locally in Windows
- Install local VS Code extensions in WSL
- Set up SSH (for authentication and signing) and Git in WSL:

  ```sh
  sudo apt install ssh-askpass
  ssh-keygen -t ed25519 -C "email@example.com"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
  git config --global user.name "Your Name"
  git config --global user.email "email@example.com"
  git config --global commit.gpgsign true
  git config --global gpg.format ssh
  git config --global user.signingkey ~/.ssh/id_ed25519.pub
  ```

- Add the SSH key to GitHub (authentication keys and signing keys must be added separately)
- Install Miniconda in WSL (use the shell script to install)
- Clone Git repositories in WSL using SSH
- Launch VS Code by navigating to the Git repository directory and running `code .`

See:

- <https://learn.microsoft.com/en-us/windows/wsl/>
- <https://code.visualstudio.com/docs/remote/wsl>
