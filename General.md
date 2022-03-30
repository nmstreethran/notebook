## Character limits

[adhering to 80 character limit in code](https://softwareengineering.stackexchange.com/a/1848)

- allows for the code to remain fewer than 80 columns even when diff markers and email quoting is added, if you do code review on mailing lists
- prevents editor code wrapping, which may not be aesthetically pleasing
- easier to view diffs (VS Code's word wrap does not work on diffs)
- reduces code density
- increases readability of complex lines, such as conditionals and nested loops

## Python

[PEP 8 -- Style Guide for Python Code](https://peps.python.org/pep-0008/)

## URL encoding

<https://en.wikipedia.org/wiki/Percent-encoding>

Character | URL encoding | Reserved?
--- | ---: | ---
`newline` | %0A or %0D or %0D%0A |
`space` | %20 |
`!` | %21 | Yes
`"` | %22 |
`#` | %23 | Yes
`$` | %24 | Yes
`%` | %25 | Yes
`&` | %26 | Yes
`'` | %27 | Yes
`(` | %28 | Yes
`)` | %29 | Yes
`*` | %2A | Yes
`+` | %2B | Yes
`,` | %2C | Yes
`-` | %2D |
`.` | %2E |
`/` | %2F | Yes
`:` | %3A | Yes
`;` | %3B | Yes
`<` | %3C |
`=` | %3D | Yes
`>` | %3E |
`?` | %3F | Yes
`@` | %40 | Yes
`[` | %5B | Yes
`\` | %5C |
`]` | %5D | Yes
`^` | %5E |
`_` | %5F |
\` | %60 |
`{` | %7B |
`\|` | %7C |
`}` | %7D |
`~` | %7E |
`£` | %C2%A3 |

## YAML

### Line breaks

See <https://stackoverflow.com/a/21699210>.

## Regular expressions

To find non-Basic Latin characters: `[^\u0020-\u007E]`

This uses the range of Unicode characters corresponding to the Basic Latin block, and `^` to exclude them from the search. See <https://en.wikipedia.org/wiki/List_of_Unicode_characters#Basic_Latin>.

`U+0020` is the code for `Space`, while `U+007E` is the code for `~` (tilde).

## cron jobs

See: <https://en.wikipedia.org/wiki/Cron>

The cron schedule syntax has five columns: `* * * * *`

Each represents, from left to right:

- minute (0 - 59)
- hour (0 - 23)
- day of the month (1 - 31)
- month (1 - 12)
- day of the week, i.e. Sunday to Saturday (0 - 6)

To run a job:

- at one minute past midnight (00:01) every day: `1 0 * * *`
- at 23:45 every Saturday: `45 23 * * 6`
- every 5th minute of every first, second and third hour (i.e., 01:00, 01:05, 01:10, up until 03:55): `*/5 1,2,3 * * *`

Non-standard macros:

Entry | Description | Equivalent to
--- | ---- | --
`@yearly` (or `@annually`) | Run once a year at midnight of 1 January | `0 0 1 1 *`
`@monthly` | Run once a month at midnight of the first day of the month | `0 0 1 * *`
`@weekly` | Run once a week at midnight on Sunday morning | `0 0 * * 0`
`@daily` (or `@midnight`) | Run once a day at midnight | `0 0 * * *`
`@hourly` | Run once an hour at the beginning of the hour | `0 * * * *`
`@reboot` | Run at startup | N/A

## Versioning

[Answer by Escualo / community wiki](https://stackoverflow.com/a/3728813):

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

[Answer by Alexandre C. / community wiki](https://stackoverflow.com/a/3728764):

> I think different factors come into play here. Psychological/marketing impact of the version number (version number increased often => more $$$, people don't want to buy a 0.99 beta version, etc) must be taken into account. "Logic" version numbers can help when working in a huge team.
>
> And I like the linux way of having odd numbers for the unstable versions, and even numbers for the stable one.
