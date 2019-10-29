# Git notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->
- [Useful links](#useful-links)
- [Credentials and authentication](#credentials-and-authentication)
  - [Prevent Git from asking for username and password during every push on Linux](#prevent-git-from-asking-for-username-and-password-during-every-push-on-linux)
  - [Invalid username or password error](#invalid-username-or-password-error)
  - [SSH askpass error](#ssh-askpass-error)
- [Branching](#branching)
- [Removing the last commit](#removing-the-last-commit)
- [Ignoring files](#ignoring-files)
  - [Templates](#templates)
  - [Remove checked in file](#remove-checked-in-file)
  - [Ignoring files with exceptions](#ignoring-files-with-exceptions)
- [GitHub](#github)
- [Pull requests](#pull-requests)
- [Errors](#errors)
  - [`HttpRequestException`](#httprequestexception)
  - [Remote already exists](#remote-already-exists)
- [Submodules and subtrees](#submodules-and-subtrees)
  - [Including wiki in the main code repository as a submodule](#including-wiki-in-the-main-code-repository-as-a-submodule)
  - [Cloning a repository including the contents of its submodules](#cloning-a-repository-including-the-contents-of-its-submodules)
  - [Renaming submodules](#renaming-submodules)
  - [Deinit old submodule, remove the directory and create a new submodule](#deinit-old-submodule-remove-the-directory-and-create-a-new-submodule)
  - [Including wiki in the main code repository as a subtree](#including-wiki-in-the-main-code-repository-as-a-subtree)


## Useful links

* [Git reference](https://git-scm.com/docs)
* [Pro Git book](https://git-scm.com/book/en/v2)
* [Visual Git Cheat Sheet](http://ndpsoftware.com/git-cheatsheet.html)


## Credentials and authentication

### Prevent Git from asking for username and password during every push on Linux

#### [Using SSH keys](https://stackoverflow.com/a/34957424/4573584)

- https://help.github.com/en/articles/connecting-to-github-with-ssh
- https://help.github.com/en/articles/changing-a-remotes-url#switching-remote-urls-from-https-to-ssh

Check for existing SSH keys:

```sh
ls -al ~/.ssh
```

Generate a new key if there are none exist:

```sh
ssh-keygen -t rsa -b 4096 -C "your_github_email@example.com"
```

Press `Enter` when prompted to "Enter a file in which to save the key". Then, type a secure passphrase.

Start the ssh-agent and add your private key:

```sh
eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa
```

Copy the SSH key to your clipboard (saved at `/home/you/.ssh/id_rsa`). Go to ['SSH and GPG keys'](https://github.com/settings/keys) in your GitHub account settings. Select 'New SSH key', add a descriptive label in the 'Title' field, and paste the SSH key in the 'Key' field.

List existing remote URLs for your local repository:

```sh
git remote -v
```

Change your remote's URL from HTTPS to SSH with `git remote set-url` and verify:

```sh
git remote set-url origin git@github.com:USERNAME/REPOSITORY.git
git remote -v
```


#### [Using credential helper to store password (less secure method)](https://stackoverflow.com/a/17979600/4573584)

```sh
git config --global credential.helper store
```

**Warning**: username and password / personal access token are stored unencrypted at `~/.git-credentials` through this method.

Use the following command to undo credential storage:

```sh
git config --unset credential.helper
```


### [Invalid username or password error](https://stackoverflow.com/a/34919582/4573584)

Could happen due to two-factor authentication. To resolve the issue: 

* manually generate a personal access token on GitHub
* assign permission to access repo and gist (just like the other tokens)
* copy the token and use it instead of the password


### [SSH askpass error](https://stackoverflow.com/a/52886041/4573584)

Error when pushing using VS Code on Ubuntu:

```sh
Git: ssh_askpass: exec(usr/lib/ssh/ssh_askpass): No such file or directory.
```

Likely caused by OS update, which makes Git lose the passphrase of the SSH key. To solve the problem, run `ssh-add ~/.ssh/id_rsa`. It may require reinstallation of VS Code.


## Branching

`HEAD` points towards your current branch, which is also indicated by an asterisk (`*`).

List current branches:

```sh
git branch
```

[Create branch in old commit](https://stackoverflow.com/a/2816728/4573584):

```sh
git branch branchname <sha1-of-commit>
```

or using symbolic reference:

```sh
git branch branchname HEAD~3
```

[Git Branching - Rebasing](https://git-scm.com/book/en/v2/Git-Branching-Rebasing)

[Controversial article about trunk-based development vs feature branches](https://medium.com/@mattia.battiston/why-i-love-trunk-based-development-641fcf0b94a0)

[Changing the master branch, preserving the old master branch as the ancestor](https://stackoverflow.com/a/2763118/4573584):

```sh
git checkout better_branch
git merge --strategy=ours master # keep the content of this branch, but record a merge
git checkout master
git merge better_branch # fast-forward master up to the merge
```


## [Removing the last commit](https://gist.github.com/CrookedNumber/8964442)

```sh
git reset --hard HEAD~<num> 
git push origin -f
```

Replace `<num>` with the number of commits you want to remove. e.g., `git reset --hard HEAD~2` removes the last two commits.


## [Ignoring files](https://help.github.com/en/articles/ignoring-files)

### Templates

* [A collection of useful .gitignore templates](https://github.com/github/gitignore)
* [gitignore.io](https://www.gitignore.io/)


### Remove checked in file

If you already have a file checked in, and you want to ignore it, Git will not ignore the file if you add a rule later. In those cases, you must untrack the file first, by running the following command in your terminal:

```sh
git rm --cached FILENAME
```


### [Ignoring files with exceptions](https://stackoverflow.com/a/16318111/4573584)

Ignore the `pippo` folder except `pippo/pluto/paperino.xml`:

```sh
pippo/*
!pippo/pluto
pippo/pluto/*
!pippo/pluto/paperino.xml
```


## GitHub

* [Delete wiki home page](https://stackoverflow.com/a/42653762/4573584)
* [GitHub Wiki How-To](https://gist.github.com/subfuzion/0d3f19c4f780a7d75ba2)
* [Detach a fork and turn it into a standalone repository](https://help.github.com/en/articles/why-are-my-contributions-not-showing-up-on-my-profile) -- contact [GitHub support](https://support.github.com/contact)


## Pull requests

* [Squash your commits](https://github.blog/2016-04-01-squash-your-commits/)
* [About pull request merges](https://help.github.com/en/articles/about-pull-request-merges)
* [Merging a pull request](https://help.github.com/en/articles/merging-a-pull-request)


## Errors

### `HttpRequestException`

```sh
fatal: HttpRequestException encountered.
```

... followed by being prompted for my username and password again.

Solution: [Update Git to the latest version](https://stackoverflow.com/a/49109825/4573584).


### Remote already exists

```sh
fatal: remote docs already exists.
```

Solution: [remove the remote repository](https://stackoverflow.com/a/1221874/4573584)

```sh
git remote rm docs
```


## Submodules and subtrees

***For wikis:***
1. ***make all changes in the submodule***
2. ***push the changes to the submodule's master branch***
3. ~~***merge the changes to the subtree***~~ *subtrees cause too many merge issues for me*
4. ***push to the main code repository***


### [Including wiki in the main code repository as a submodule](https://brendancleary.com/2013/03/08/including-a-github-wiki-in-a-repository-as-a-submodule/)

Add the wiki to the main repository as a submodule:

```sh
git submodule add https://github.com/username/project.wiki.git wiki
```

Commit this addition to the main repository and push the changes. Once changes to the wiki within the submodule are made (e.g., new markdown files, images), these changes must first be committed and pushed to the wiki's branch, before committing and pushing to the main repository's branch. 

See the [Git documentation on submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules).


### [Cloning a repository including the contents of its submodules](https://stackoverflow.com/a/3797061/4573584)

```sh
git clone --recurse-submodules https://github.com/username/repo.git
```


### [Renaming submodules](https://stackoverflow.com/a/18712756/4573584)

```sh
git mv oldname newname
```


### [Deinit old submodule, remove the directory and create a new submodule](https://stackoverflow.com/a/22309234/4573584)

```sh
git submodule deinit <submodule name>
git rm <submodule folder name>
git submodule add <address to remote git repo> <new folder name>
```


### [Including wiki in the main code repository as a subtree](https://stackoverflow.com/a/33182223/4573584)

```sh
git clone git://github.com/you/proj
cd proj
git remote add -f docs https://github.com/you/proj.wiki.git
git merge -s ours --no-commit --allow-unrelated-histories docs/master
git read-tree --prefix=docs/ -u docs/master
git commit -m "Github docs subtree merged in docs/"
```

Changes made in the actual wiki can be merged to the main code repository:

```sh
git pull -s subtree docs master
```

Merging changes the other way is complicated.

More about subtree merges on [GitHub](https://help.github.com/en/articles/about-git-subtree-merges).
