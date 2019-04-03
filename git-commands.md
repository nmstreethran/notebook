# Git commands

## Removing the last commit

```
git reset --hard HEAD~<num> 
git push origin -f
```
Replace `<num>` with the number of commits you want to remove. e.g., `git reset --hard HEAD~2` removes the last two commits.

## Sources

1. https://gist.github.com/CrookedNumber/8964442