# Git notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Useful links](#useful-links)
- [Removing the last commit](#removing-the-last-commit)
- [References](#references)

## Useful links

* [Ignoring files](https://help.github.com/en/articles/ignoring-files)
* [Squash your commits](https://github.blog/2016-04-01-squash-your-commits/)
* [About pull request merges](https://help.github.com/en/articles/about-pull-request-merges)
* [Merging a pull request](https://help.github.com/en/articles/merging-a-pull-request)

## Removing the last commit

```
git reset --hard HEAD~<num> 
git push origin -f
```
Replace `<num>` with the number of commits you want to remove. e.g., `git reset --hard HEAD~2` removes the last two commits.

## References

1. https://gist.github.com/CrookedNumber/8964442