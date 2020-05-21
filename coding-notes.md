# General coding notes and best practices <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Character limits](#character-limits)
- [Python](#python)
- [URL encoding](#url-encoding)

## Character limits

[adhering to 80 character limit in code](https://softwareengineering.stackexchange.com/a/1848/333462)

- allows for the code to remain fewer than 80 columns even when diff markers and email quoting is added, if you do code review on mailing lists
- prevents editor code wrapping, which may not be aesthetically pleasing
- easier to view diffs (VS Code's word wrap does not work on diffs)
- reduces code density
- increases readability of complex lines, such as conditionals and nested loops

## Python

[PEP 8 -- Style Guide for Python Code](https://www.python.org/dev/peps/pep-0008/)

## URL encoding

<https://vermontdatabase.com/cloudwriter/url_encoding.htm>

**Character** | **URL encoding**
--- | ---:
\` | %60
~ | %7E
! | %21
\# | %23
$ | %24
% | %25
^ | %5E
& | %26
\( | %28
\) | %29
= | %3D
\+ | %2B
\ | %5C
\| | %7C
\[ | %5B
\] | %5D
{ | %7B
} | %7D
; | %3B
: | %3A
' | %27
" | %22
, | %2C
\< | %3C
\> | %3E
? | %3F
