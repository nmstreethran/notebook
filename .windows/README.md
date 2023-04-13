# Windows

List of packages installed through `winget` (`.windows/pkgs-winget.json`):

```powershell
winget export --source winget --output .\.windows\pkgs-winget.json
```

Windows Terminal settings are saved in `.windows/term-settings.json`.

## Development environments

See:

- <https://learn.microsoft.com/en-us/windows/wsl/>
- <https://code.visualstudio.com/docs/remote/wsl>
- <https://docs.gitlab.com/ee/user/ssh.html>
- <https://askubuntu.com/a/1187846>
- <https://support.atlassian.com/bitbucket-cloud/docs/set-up-personal-ssh-keys-on-windows/>

### With WSL

- In PowerShell, install Visual Studio Code and WSL (Ubuntu):

  ```powershell
  winget install vscode
  wsl --install
  ```

- Install the WSL and Remote - SSH VS Code extensions locally in Windows
- Install local VS Code extensions in WSL
- Set up SSH (for authentication and signing) and Git in WSL:

  ```sh
  sudo apt install ssh-askpass keychain
  ssh-keygen -t ed25519 -C "<comment>"
  eval "$(ssh-agent -s)"
  eval `keychain --eval`
  ssh-add
  git config --global user.name "Your Name"
  git config --global user.email "email@example.com"
  git config --global commit.gpgsign true
  git config --global gpg.format ssh
  git config --global user.signingkey ~/.ssh/id_ed25519.pub
  ```

- Add the following to `~/.bashrc`

  ```sh
  eval "$(ssh-agent -s)"
  eval `keychain --eval`
  ssh-add
  ```

- Add the SSH key to GitHub (authentication keys and signing keys must be added separately in GitHub)
- Install Miniconda in WSL (use the Unix shell script to install)
- Clone Git repositories in WSL using SSH
- Launch VS Code by navigating to the Git repository directory and running `code .`

### Without WSL

- In PowerShell:

  ```powershell
  winget install vscode
  winget install git.git
  winget install github.githubdesktop
  winget install github.cli
  winget install github.gitlfs
  winget install microsoft.powershell
  ```

- In Git Bash:

  ```sh
  git config --global user.name "Your Name"
  git config --global user.email "email@example.com"
  ```

- Authenticate GitHub Desktop and GitHub CLI

- If there are any issues running PowerShell scripts, update the [execution policy](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies):

  ```powershell
  Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
  ```

- Optional: to also sign commits using an SSH key, do the following:

  - Create a new SSH key pair with `ssh-keygen -t ed25519 -C "<comment>"`, or copy the key pair created in WSL into `~/.ssh`

  - Add the following to `~/.bashrc`:

    ```sh
    eval $(ssh-agent)
    ssh-add
    ```

  - In Git Bash:

    ```sh
    eval $(ssh-agent)
    ssh-add
    git config --global commit.gpgsign true
    git config --global gpg.format ssh
    git config --global user.signingkey ~/.ssh/id_ed25519.pub
    ```

  - Note: this may not work, so try [OpenSSH for Windows](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse) instead of the SSH that comes with Git.

  - [Set OpenSSH to run automatically](https://github.com/Microsoft/vscode/issues/13680#issuecomment-414841885). Go to Task Manager > Services > Open Services, find OpenSSH Authentication Agent > Properties > Startup Type > Automatic.

  - Configure Git to use OpenSSH:

    ```sh
    git config --global core.sshCommand "C:/Windows/System32/OpenSSH/ssh.exe"
    eval $(ssh-agent)
    ssh-add
    ```

  - To revert to the SSH agent supplied by Git for Windows:

    ```sh
    git config --global core.sshCommand "C:/Program Files/Git/usr/bin/ssh.exe"
    eval $(ssh-agent)
    ssh-add
    ```

## Other

Skyrim SE plugin list (`.windows/skyrimse-plugins.txt`) and load order (`.windows/skyrimse-loadorder.txt`) for mods managed with Vortex:

```powershell
cp $HOME\AppData\Roaming\Vortex\skyrimse\profiles\HJcaJmmWi\plugins.txt .\.windows\skyrimse-plugins.txt
cp $HOME\AppData\Roaming\Vortex\skyrimse\profiles\HJcaJmmWi\loadorder.txt .\.windows\skyrimse-loadorder.txt
```
