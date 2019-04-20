# Git notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Useful links](#useful-links)
- [Branching](#branching)
- [Removing the last commit](#removing-the-last-commit)
- [Ignoring files](#ignoring-files)
- [GitHub](#github)
- [Pull requests](#pull-requests)
- [Errors](#errors)
- [Including wiki in the main code repository as a submodule](#including-wiki-in-the-main-code-repository-as-a-submodule)
- [Including wiki in the main code repository as a subtree](#including-wiki-in-the-main-code-repository-as-a-subtree)

## Useful links

* [Git reference](https://git-scm.com/docs)
* [Pro Git book](https://git-scm.com/book/en/v2)
* [Visual Git Cheat Sheet](http://ndpsoftware.com/git-cheatsheet.html)

## Branching

`HEAD` points towards your current branch, which is also indicated by an asterisk (`*`).

List current branches:

```shell
$ git branch
```

[Git Branching - Rebasing](https://git-scm.com/book/en/v2/Git-Branching-Rebasing)

## [Removing the last commit](https://gist.github.com/CrookedNumber/8964442)

```shell
$ git reset --hard HEAD~<num> 
$ git push origin -f
```
Replace `<num>` with the number of commits you want to remove. e.g., `git reset --hard HEAD~2` removes the last two commits.

## [Ignoring files](https://help.github.com/en/articles/ignoring-files)

* [A collection of useful .gitignore templates](https://github.com/github/gitignore)
* [gitignore.io](https://www.gitignore.io/)

If you already have a file checked in, and you want to ignore it, Git will not ignore the file if you add a rule later. In those cases, you must untrack the file first, by running the following command in your terminal:

```shell
$ git rm --cached FILENAME
```

## GitHub

* [Delete wiki home page](https://stackoverflow.com/a/42653762/4573584)

## Pull requests

* [Squash your commits](https://github.blog/2016-04-01-squash-your-commits/)
* [About pull request merges](https://help.github.com/en/articles/about-pull-request-merges)
* [Merging a pull request](https://help.github.com/en/articles/merging-a-pull-request)

## Errors

```shell
fatal: HttpRequestException encountered.
```

... followed by being prompted for my username and password again.

Solution: [Update Git to the latest version](https://stackoverflow.com/a/49109825/4573584).

## [Including wiki in the main code repository as a submodule](https://brendancleary.com/2013/03/08/including-a-github-wiki-in-a-repository-as-a-submodule/)

Add the wiki to the main repository as a submodule:

```shell
$ git submodule add https://github.com/username/project.wiki.git wiki
```

Commit this addition to the main repository and push the changes. Once changes to the wiki within the submodule are made (e.g., new markdown files, images), these changes must first be committed and pushed to the wiki's branch first, before committing and pushing to the main repository's branch. 

See the [Git documentation on submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

## [Including wiki in the main code repository as a subtree](https://stackoverflow.com/a/33182223/4573584)

```shell
git clone git://github.com/you/proj
cd proj
git remote add -f docs git://github.com/you/proj.wiki
git merge -s ours --no-commit --allow-unrelated docs/master
git read-tree --prefix=docs/ -u docs/master
git commit -m "Github docs subtree merged in docs/"
```

Changes made in the actual wiki can be merged to the main code repository:

```shell
git pull -s subtree docs master
```

Unfortunately, merging changes the other way is complicated.

More about subtree merges on [GitHub](https://help.github.com/en/articles/about-git-subtree-merges).