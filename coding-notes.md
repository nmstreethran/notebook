# General coding notes and best practices <!-- omit in toc -->

## Table of contents <!-- omit in toc -->
- [Character limits](#character-limits)
- [Python](#python)

## Character limits

[adhering to 80 character limit in code](https://softwareengineering.stackexchange.com/a/1848/333462)
- allows for the code to remain fewer than 80 columns even when diff markers and email quoting is added, if you do code review on mailing lists
- prevents editor code wrapping, which may not be aesthetically pleasing
- easier to view diffs (VS Code's word wrap does not work on diffs)
- reduces code density
- increases readability of complex lines, such as conditionals and nested loops

## Python

[PEP 8 -- Style Guide for Python Code](https://www.python.org/dev/peps/pep-0008/)
