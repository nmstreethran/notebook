# Windows

List of packages installed through `winget` (`.windows/pkgs-winget.json`):

```powershell
winget export --source winget --output .\.windows\pkgs-winget.json
```

Skyrim SE plugin list (`.windows/skyrimse-plugins.txt`) and load order (`.windows/skyrimse-loadorder.txt`) for mods managed with Vortex:

```powershell
cp $HOME\AppData\Roaming\Vortex\skyrimse\profiles\HJcaJmmWi\plugins.txt .\.windows\skyrimse-plugins.txt
cp $HOME\AppData\Roaming\Vortex\skyrimse\profiles\HJcaJmmWi\loadorder.txt .\.windows\skyrimse-loadorder.txt
```

Windows Terminal settings are saved in `.windows/term-settings.json`.

## Development environment in WSL

- In PowerShell, install Visual Studio Code and WSL (Ubuntu):

  ```powershell
  winget install vscode
  wsl --install
  ```

- Install the WSL and Remote - SSH VS Code extensions locally in Windows
- Install local VS Code extensions in WSL
- Set up SSH (for authentication and signing) and Git in WSL:

  ```sh
  sudo apt install ssh-askpass keyring
  ssh-keygen -t ed25519 -C "email@example.com"
  eval "$(ssh-agent -s)"
  eval `keychain --eval`
  ssh-add ~/.ssh/id_ed25519
  git config --global user.name "Your Name"
  git config --global user.email "email@example.com"
  git config --global commit.gpgsign true
  git config --global gpg.format ssh
  git config --global user.signingkey ~/.ssh/id_ed25519.pub
  ```

- add the following to `.bashrc`

  ```sh
  eval `keychain --eval`
  ```

- Add the SSH key to GitHub (authentication keys and signing keys must be added separately)
- Install Miniconda in WSL (use the Unix shell script to install)
- Clone Git repositories in WSL using SSH
- Launch VS Code by navigating to the Git repository directory and running `code .`

See:

- <https://learn.microsoft.com/en-us/windows/wsl/>
- <https://code.visualstudio.com/docs/remote/wsl>
- <https://askubuntu.com/a/1187846>

## Development environment in Windows

- In PowerShell:

  ```powershell
  winget install vscode
  winget install git.git
  winget install github.githubdesktop
  winget install github.cli
  Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
  ```

- In Git Bash:

  ```sh
  git config --global user.name "Your Name"
  git config --global user.email "email@example.com"
  git config --global core.sshCommand "C:\Program Files\Git\usr\bin\ssh.exe"
  eval $(ssh-agent)
  ```

- Add the following to `~/.bashrc`:

  ```sh
  eval $(ssh-agent)
  ```

- Create a new SSH key pair, or copy the key pair created in WSL into `~/.ssh`

- In Git Bash:

  ```sh
  ssh-add ~/.ssh/id_ed25519
  git config --global commit.gpgsign true
  git config --global gpg.format ssh
  git config --global user.signingkey ~/.ssh/id_ed25519.pub
  ```

- Authenticate GitHub Desktop and GitHub CLI

Note: this may not work, so try OpenSSH for Windows instead of the SSH that comes with Git.

See:

- <https://support.atlassian.com/bitbucket-cloud/docs/set-up-personal-ssh-keys-on-windows/>
- <https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies>
