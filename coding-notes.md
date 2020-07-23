# General coding notes and best practices <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Character limits](#character-limits)
- [Python](#python)
- [URL encoding](#url-encoding)
- [Versioning](#versioning)
- [YAML](#yaml)
  - [Line breaks](#line-breaks)

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

Character | URL encoding
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
`space` | %20
/ | %2F

## Versioning

[Answer by Escualo / community wiki](https://stackoverflow.com/a/3728813/4573584):

> The version number is entirely up to you. Do what makes sense to you and be consistent. Nobody says you have to start from 0, or 0.0, or 1.0, or 1.1.
>
> Great programmers have actually used the version numbering system as local jokes. Examples (Wikipedia):
>
>> Since version 3, TeX has used an idiosyncratic version numbering system, where updates have been indicated by adding an extra digit at the end of the decimal, so that the version number asymptotically approaches π. This is a reflection of the fact that TeX is now very stable, and only minor updates are anticipated. The current version of TeX is 3.1415926; it was last updated in March 2008
>
> For METAFONT:
>
>> Metafont has a versioning system similar to that of TeX, where the number asymptotically approaches e with each revision.
>
> Finally, not quite a version number, but equally interesting, is that Google's initial public offering (IPO) was filed with the SEC for raising $2,718,281,828 (notice that e~2.718 281 828).
>
> My point is: don't feel that you need to follow the crowd. Be creative and consistent.

From [Semantic Versioning](https://semver.org/):

> **How should I deal with revisions in the 0.y.z initial development phase?**
>
> The simplest thing to do is start your initial development release at 0.1.0 and then increment the minor version for each subsequent release.

[Answer by Alexandre C. / community wiki](https://stackoverflow.com/a/3728764/4573584):

> I think different factors come into play here. Psychological/marketing impact of the version number (version number increased often => more $$$, people don't want to buy a 0.99 beta version, etc) must be taken into account. "Logic" version numbers can help when working in a huge team.
>
> And I like the linux way of having odd numbers for the unstable versions, and even numbers for the stable one.

## YAML

### Line breaks

See <https://stackoverflow.com/a/21699210/4573584>.
