## Useful links

- [Git reference](https://git-scm.com/docs)
- [Pro Git book](https://git-scm.com/book/en/v2)
- [Visual Git Cheat Sheet](https://ndpsoftware.com/git-cheatsheet.html)

## Setting up Git

### Installing SSH libraries

[Arch Linux](https://forum.manjaro.org/t/vscode-git-ssh-askpass-exec-usr-lib-ssh-ssh-askpass-no-such-file-or-directory/78787) (also create a symlink to enable VS Code to recognise it):

```sh
sudo pacman -Syu openssh kwalletmanager kwallet-pam ksshaskpass
sudo ln /usr/bin/ksshaskpass /usr/lib/ssh/ssh-askpass
```

Ubuntu / WSL:

```sh
sudo apt install ssh-askpass keychain
```

Windows without WSL:

- Use the SSH agent that comes with Git for Windows:

  ```powershell
  winget install git.git
  ```

- Alternatively, use [OpenSSH for Windows](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse):

  ```sh
  git config --global core.sshCommand "C:/Windows/System32/OpenSSH/ssh.exe"
  ```

  - [Set OpenSSH to run automatically](https://github.com/Microsoft/vscode/issues/13680#issuecomment-414841885). Go to Task Manager > Services > Open Services, find OpenSSH Authentication Agent > Properties > Startup Type > Automatic.

- To revert to the SSH agent that comes with Git for Windows:

  ```sh
  git config --global core.sshCommand "C:/Program Files/Git/usr/bin/ssh.exe"
  ```

### Configure Git global user settings

```sh
git config --global user.name "Your Name"
git config --global user.email "email@example.com"
```

### Setting up SSH keys

[Using SSH keys](https://stackoverflow.com/a/34957424):

- <https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh>
- <https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories>
- <https://docs.gitlab.com/ee/user/ssh.html>

Check for existing SSH keys:

```sh
ls -al ~/.ssh
```

If no keys exist, generate a new key **[using ED25519 (recommended over RSA)](https://docs.gitlab.com/ee/user/ssh.html):**

```sh
ssh-keygen -t ed25519 -C "<comment>"
```

When prompted to "Enter a file in which to save the key", press `Enter` to use the default file name, or specify a custom file name. Then, type a secure passphrase.

Add the following to `~/.bashrc` or equivalent:

```sh
eval $(ssh-agent)
ssh-add
```

If using WSL or Ubuntu, add the following:

```sh
eval $(ssh-agent)
eval `keychain --eval`
ssh-add
```

Start the ssh-agent and add your private key:

```sh
eval "$(ssh-agent -s)"
eval `keychain --eval`  # only if using WSL / Ubuntu
ssh-add
```

Copy the SSH public key to your clipboard (saved at `~/.ssh/id_ed25519.pub`) and add to GitHub/GitLab. The key can be used for authentication, signing, or both.

### Configure SSH key for signing commits

```sh
git config --global commit.gpgsign true
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519.pub
```

### Updating remote URLs

List existing remote URLs for your local repository:

```sh
git remote -v
```

Change your remote's URL from HTTPS to SSH with `git remote set-url` and verify:

```sh
git remote set-url origin git@github.com:USERNAME/REPOSITORY.git
git remote -v
```

### Alternate SSH port

An alternate SSH port should be used if there are connection issues preventing the default port from working as expected.

To test if SSH connection over the HTTPS port (443) is possible:

```sh
ssh -T -p 443 git@altssh.gitlab.com  # GitLab
ssh -T -p 443 git@ssh.github.com  # GitHub
```

The following greetings should appear if successful:

```text
Welcome to GitLab, @username!

Hi username! You've successfully authenticated, but GitHub does not
provide shell access.
```

Create a file called `~/.ssh/config` and add the following configurations for GitLab, GitHub, and GitHub Gist:

```text
Host gitlab.com
  Hostname altssh.gitlab.com
  User git
  Port 443
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_ed25519

Host github.com
  Hostname ssh.github.com
  User git
  Port 443
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_ed25519

Host gist.github.com
  Hostname ssh.github.com
  User git
  Port 443
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_ed25519
```

Test if everything works (same greetings as above should appear):

```sh
ssh -T git@gitlab.com  # GitLab
ssh -T git@github.com  # GitHub
ssh -T git@gist.github.com  # GitHub Gist
```

- <https://about.gitlab.com/blog/2016/02/18/gitlab-dot-com-now-supports-an-alternate-git-plus-ssh-port/>
- <https://docs.github.com/en/authentication/troubleshooting-ssh/using-ssh-over-the-https-port>

### [SSH askpass error](https://stackoverflow.com/a/52886041)

Error when pushing using VS Code on Ubuntu:

```sh
Git: ssh_askpass: exec(usr/lib/ssh/ssh_askpass): No such file or directory.
```

Likely caused by OS update, which makes Git lose the passphrase of the SSH key. To solve the problem, run `eval $(ssh-agent)`, then `ssh-add`. It may require reinstallation of VS Code.

If that doesn't work, [try reinstalling `ssh-askpass`](https://askubuntu.com/a/1196265):

```sh
sudo apt install ssh-askpass
```

On [Arch Linux](https://forum.manjaro.org/t/vscode-git-ssh-askpass-exec-usr-lib-ssh-ssh-askpass-no-such-file-or-directory/78787), install `ksshaskpass` and create a symlink to enable VS Code to recognise it:

```sh
sudo pacman -Syu ksshaskpass
sudo ln /usr/bin/ksshaskpass /usr/lib/ssh/ssh-askpass
```

If you get a similar warning to the [following](https://superuser.com/a/421084):

```text
The authenticity of host 'bitbucket.org (207.223.240.181)' can't be established.

RSA key fingerprint is 97:8c:1b:f2:6f:14:6b:5c:3b:ec:aa:46:46:74:7c:40.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'bitbucket.org,207.223.240.181' (RSA) to the list of
known hosts.
```

If you expect to receive this message from the host and it's the first time you're connecting to this server after installing SSH, then it's probably normal. If you answer `yes`, SSH will start recognising that this host is `bitbucket.org`.

The list of known hosts can be seen in `~/.ssh/known_hosts`.

See also: <https://forum.manjaro.org/t/howto-use-kwallet-as-a-login-keychain-for-storing-ssh-key-passphrases-on-kde/7088>

### SSH on Windows

On Windows, the default SSH key path is `$HOME\.ssh`. `$HOME` is usually `C:\Users\%USERNAME%`.

[To fix SSH issues on Windows](https://github.com/Microsoft/vscode/issues/13680#issuecomment-414841885):

> Make Git use the OpenSSH that comes with Windows instead of the one that comes with Git.
>
> ```sh
> git config --global core.sshCommand "C:/Windows/System32/OpenSSH/ssh.exe"
> ```
>
> Set the ssh-agent service (not the one that comes with git) to run automatically.
> Open Task Manager, Services tab, click Open Services.
> Find OpenSSH Authentication Agent, open properties, set Startup Type to Automatic, hit OK.
> Also start the service or restart your computer.
>
> Add your password protected key to the agent.
>
> ```sh
> ssh-add
> ```
>
> It should automatically pick up keys stored in `C:\Users\%USERNAME%\.ssh` which is where ssh-keygen creates them.
> Enter your password(s) at the prompt.

## Branching

`HEAD` points towards your current branch, which is also indicated by an asterisk (`*`).

List current branches:

```sh
git branch
```

[Create branch in old commit](https://stackoverflow.com/a/2816728):

```sh
git branch branchname ${sha1-of-commit}
```

or using symbolic reference:

```sh
git branch branchname HEAD~3
```

[Git Branching - Rebasing](https://git-scm.com/book/en/v2/Git-Branching-Rebasing)

[Controversial article about trunk-based development vs feature branches](https://medium.com/@mattia.battiston/why-i-love-trunk-based-development-641fcf0b94a0)

[Changing the master branch, preserving the old master branch as the ancestor](https://stackoverflow.com/a/2763118):

```sh
git checkout better_branch
git merge --strategy=ours master  # keep the content of this branch, but record a merge
git checkout master
git merge better_branch  # fast-forward master up to the merge
```

### [Cloning a specific branch](https://stackoverflow.com/a/9920956)

```sh
git clone git@github.com:USERNAME/REPOSITORY.git --branch develop --single-branch REPOSITORY
```

### Updating clone after renaming GitHub default branch

```sh
git branch -m master main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a
```

## Managing forks

Navigate to the cloned fork's directory and open a terminal. Run the following to list the fork's current configured remote repository:

```sh
git remote -v
```

...which will produce:

```text
> origin  https://github.com/YOUR_USERNAME/YOUR_FORK.git (fetch)
> origin  https://github.com/YOUR_USERNAME/YOUR_FORK.git (push)
```

Configure an upstream repository to sync the fork with and then list the configurations:

```sh
git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git
git remote -v
```

...which will produce:

```text
> origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (fetch)
> origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (push)
> upstream  https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git (fetch)
> upstream  https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git (push)
```

Fetch commits from the upstream repository:

```sh
git fetch upstream
```

...which will produce an output similar to the following:

```text
> remote: Counting objects: 75, done.
> remote: Compressing objects: 100% (53/53), done.
> remote: Total 62 (delta 27), reused 44 (delta 9)
> Unpacking objects: 100% (62/62), done.
> From https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY
>  * [new branch]      main     -> upstream/main
```

Checkout the fork's default branch (e.g. `main`):

```sh
git checkout main
```

...

```text
> Switched to branch 'main'
```

Merge the changes in the upstream to sync the fork:

```sh
git merge upstream/main
```

...

```text
> Updating a422352..5fdff0f
> Fast-forward
>  README                    |    9 -------
>  README.md                 |    7 ++++++
>  2 files changed, 7 insertions(+), 9 deletions(-)
>  delete mode 100644 README
>  create mode 100644 README.md
```

Source:

- <https://docs.github.com/en/github/collaborating-with-pull-requests/working-with-forks/syncing-a-fork>
- <https://docs.github.com/en/github/collaborating-with-pull-requests/working-with-forks/configuring-a-remote-for-a-fork>

## Rewriting history

### git filter-repo

See the documentation: <https://htmlpreview.github.io/?https://github.com/newren/git-filter-repo/blob/docs/html/git-filter-repo.html>

Create a fresh clone of the repository to be cleaned.

To remove all Jupyter notebooks in subdirectories:

```sh
git filter-repo --path-glob '*/*.ipynb' --invert-paths
```

After running the above, reconfigure the remote:

```sh
git remote add origin git@github.com:nmstreethran/charts.git
```

Then, force push the changes:

```sh
git push --set-upstream origin main --force
```

<https://stackoverflow.com/q/71577268>

### [Deleting commit history of a repository but keep the code in its current state](https://stackoverflow.com/a/26000395)

Checkout:

```sh
git checkout --orphan latest_branch
```

Add all the files:

```sh
git add -A
```

Commit the changes:

```sh
git commit -am "commit message"
```

Delete the branch

```sh
git branch -D master
```

Rename the current branch to master:

```sh
git branch -m master
```

Force update your repository:

```sh
git push -f origin master
```

### [Removing the last commit](https://gist.github.com/CrookedNumber/8964442)

```sh
git reset --hard HEAD~${num}
git push origin -f
```

Replace `${num}` with the number of commits you want to remove. e.g. `git reset --hard HEAD~2` removes the last two commits.

## [Ignoring files](https://docs.github.com/en/get-started/getting-started-with-git/ignoring-files)

### Templates

- [A collection of useful .gitignore templates](https://github.com/github/gitignore)
- [gitignore.io](https://www.toptal.com/developers/gitignore)

### Remove checked in file

If you already have a file checked in, and you want to ignore it, Git will not ignore the file if you add a rule later. In those cases, you must untrack the file first, by running the following command in your terminal:

```sh
git rm --cached FILENAME
```

### [Ignoring files with exceptions](https://stackoverflow.com/a/16318111)

Ignore the `pippo` folder except `pippo/pluto/paperino.xml`:

```sh
pippo/*
!pippo/pluto
pippo/pluto/*
!pippo/pluto/paperino.xml
```

## [`fatal: unsafe repository`](https://stackoverflow.com/a/71940133)

```sh
git config --global --add safe.directory '*'
```

## List of all files that have ever existed in a repository

```sh
git log --all --pretty=format: --name-only --diff-filter=A | sort -u
```

<https://stackoverflow.com/q/543346>

## GitHub

- [Delete wiki home page](https://stackoverflow.com/a/42653762)
- [GitHub Wiki How-To](https://gist.github.com/subfuzion/0d3f19c4f780a7d75ba2)
- [Detach a fork and turn it into a standalone repository](https://docs.github.com/en/github/setting-up-and-managing-your-github-profile/managing-contribution-graphs-on-your-profile/why-are-my-contributions-not-showing-up-on-my-profile) -- contact [GitHub support](https://support.github.com)

## Pull requests

- [Squash your commits](https://github.blog/2016-04-01-squash-your-commits/)
- [About pull request merges](https://docs.github.com/en/github/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/merging-a-pull-request)

## GitLab

### [Getting raw file from repository](https://docs.gitlab.com/ee/api/repository_files.html#get-raw-file-from-repository)

```text
GET /projects/:id/repository/files/:file_path/raw
```

Parameters:

- `file_path` (required) - URL encoded full path to new file. e.g. `lib%2Fclass%2Erb` (replace `/` with `%2F`)
- `ref` (required) - The name of branch, tag or commit

Example for the file at <https://gitlab.com/renewables-forecasting/renewables-forecasting-data/-/blob/main/geography/polygons/bidding_zones.geojson>:

- `file_path`: `geography%2Fpolygons%2Fbidding%5Fzones%2Egeojson`
- `ref`: `main`
- `id`: `19753809`

URL:

```text
https://gitlab.com/api/v4/projects/19753809/repository/files/geography%2Fpolygons%2Fbidding%5Fzones%2Egeojson/raw?ref=main
```

### CI

<https://docs.gitlab.com/ee/development/cicd/templates.html>

## Errors

### `HttpRequestException`

```sh
fatal: HttpRequestException encountered.
```

... followed by being prompted for my username and password again.

Solution: [Update Git to the latest version](https://stackoverflow.com/a/49109825).

### Remote already exists

```sh
fatal: remote docs already exists.
```

Solution: [remove the remote repository](https://stackoverflow.com/a/1221874)

```sh
git remote rm docs
```

## Submodules

1. ***make all changes in the submodule***
2. ***push the changes to the submodule's branch***
3. ***push to the main code repository***

### Including a submodule

Add a GitHub wiki to the main repository as a submodule (replace `username` and `repository` with username and repository name respectively):

```sh
git submodule add https://github.com/USERNAME/REPOSITORY.wiki.git wiki
```

Commit this addition to the main repository and push the changes. Once changes to the wiki within the submodule are made (e.g. new markdown files, images), these changes must first be committed and pushed to the wiki's branch, before committing and pushing to the main repository's branch.

See the [Git documentation on submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

References: brendancleary.com (2013)

### [Cloning a repository including the contents of its submodules](https://stackoverflow.com/a/3797061)

```sh
git clone --recurse-submodules https://github.com/USERNAME/REPOSITORY.git
```

### [Renaming submodules](https://stackoverflow.com/a/18712756)

```sh
git mv oldname newname
```

### Deinit old submodule, remove the directory and create a new submodule

```sh
git submodule deinit ${submodulename}
git rm ${submodulename}
git config -f .git/config --remove-section submodule.$submodulename
git submodule add ${address-to-remote-git-repo} ${submodulename}
```

- <https://stackoverflow.com/a/22309234>
- <https://stackoverflow.com/q/1260748>
