# Git notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Useful links](#useful-links)
- [Branching](#branching)
- [Pull requests](#pull-requests)
- [Removing the last commit](#removing-the-last-commit)
- [Ignoring files](#ignoring-files)

## Useful links

* [Git reference](https://git-scm.com/docs)
* [Pro Git book](https://git-scm.com/book/en/v2)
* [Visual Git Cheat Sheet](http://ndpsoftware.com/git-cheatsheet.html)

## Branching

`HEAD` points towards your current branch, which is also indicated by an asterisk (`*`).

List current branches:

```
git branch
```

[Git Branching - Rebasing](https://git-scm.com/book/en/v2/Git-Branching-Rebasing)

## Pull requests

* [Squash your commits](https://github.blog/2016-04-01-squash-your-commits/)
* [About pull request merges](https://help.github.com/en/articles/about-pull-request-merges)
* [Merging a pull request](https://help.github.com/en/articles/merging-a-pull-request)

## [Removing the last commit](https://gist.github.com/CrookedNumber/8964442)

```
git reset --hard HEAD~<num> 
git push origin -f
```
Replace `<num>` with the number of commits you want to remove. e.g., `git reset --hard HEAD~2` removes the last two commits.

## [Ignoring files](https://help.github.com/en/articles/ignoring-files)

* [A collection of useful .gitignore templates](https://github.com/github/gitignore)
* [gitignore.io](https://www.gitignore.io/)

If you already have a file checked in, and you want to ignore it, Git will not ignore the file if you add a rule later. In those cases, you must untrack the file first, by running the following command in your terminal:

```
$ git rm --cached FILENAME
```