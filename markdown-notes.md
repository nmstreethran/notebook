# Markdown notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Emphasis](#emphasis)
- [Lists](#lists)
- [Hyperlinks](#hyperlinks)
- [Images](#images)
- [Tables](#tables)
- [Code and syntax highlighting](#code-and-syntax-highlighting)
- [Horizontal rule](#horizontal-rule)
- [Text alignment](#text-alignment)
- [Badges](#badges)
- [Blockquotes](#blockquotes)
- [Font Awesome](#font-awesome)
- [Text colours and fonts](#text-colours-and-fonts)
- [YouTube videos](#youtube-videos)
- [Footnotes](#footnotes)
- [Sources](#sources)

## Emphasis

**Bold**: `**Bold**`

*Italics*: `*Italics*` or `_italics_`

~~Strikethrough~~: `~~Strikethrough~~`

## Lists

Numbered lists

```md
1. first
2. second
3. third
```

1. first
2. second
2. third

Only the first number matters

```md
3. first
2. second
2. third
```

3. first
2. second
2. third

Bullet lists (using `*`, `-` or `+`)

```md
* first
* first
- second
+ third
```

* first
* first
- second
+ third

## Hyperlinks

```md
[I'm an inline-style link](https://github.com/)

[I'm a reference-style link][Arbitrary case-insensitive reference text]

[You can use numbers for reference-style link definitions][1]

Or leave it empty and use the [link text itself]

URLs and URLs in angle brackets will automatically get turned into links.
https://github.com/ or <https://github.com/> and sometimes
example.com (but not on GitHub, for example).

Some text to show that the reference links can follow later.

[arbitrary case-insensitive reference text]: https://www.mozilla.org/en-US/exp/
[1]: https://slashdot.org/
[link text itself]: https://www.reddit.com/
```

[I'm an inline-style link](https://github.com/)

[I'm a reference-style link][Arbitrary case-insensitive reference text]

[You can use numbers for reference-style link definitions][1]

Or leave it empty and use the [link text itself]

URLs and URLs in angle brackets will automatically get turned into links.
https://github.com/ or <https://github.com/> and sometimes
example.com (but not on GitHub, for example).

Some text to show that the reference links can follow later.

[arbitrary case-insensitive reference text]: https://www.mozilla.org/en-US/exp/
[1]: https://slashdot.org/
[link text itself]: https://www.reddit.com/

## Images

```md
Here's the Markdown Here logo (hover to see the title text):

Inline-style:
![alt text](https://raw.githubusercontent.com/adam-p/markdown-here/master/src/common/images/icon48.png "Logo Title Text 1")

Reference-style:
![alt text][logo]

[logo]: https://raw.githubusercontent.com/adam-p/markdown-here/master/src/common/images/icon48.png "Logo Title Text 2"
```

Here's the Markdown Here logo (hover to see the title text):

Inline-style:
![alt text](https://raw.githubusercontent.com/adam-p/markdown-here/master/src/common/images/icon48.png "Logo Title Text 1")

Reference-style:
![alt text][logo]

[logo]: https://raw.githubusercontent.com/adam-p/markdown-here/master/src/common/images/icon48.png "Logo Title Text 2"

## Tables

```md
Colons can be used to align columns.

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

The outer pipes (`|`) are optional, and you don't need to make the raw Markdown line up prettily. You can also use inline Markdown.

Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3
```

Colons can be used to align columns.

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

The outer pipes (`|`) are optional, and you don't need to make the raw Markdown line up prettily. You can also use inline Markdown.

Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3

## Code and syntax highlighting

Inline codes are fenced by single back ticks (\`). Code blocks are fenced by triple back ticks.

For code blocks, syntax highlighting is possible. Name the language right after the first three back ticks.

[List of languages supported by GitHub flavoured markdown](https://www.rubycoloredglasses.com/2013/04/languages-supported-by-github-flavored-markdown/):

> Github uses Linguist to perform language detection and syntax highlighting [...] [(see full list in Linguist - languages.yml)](https://github.com/github/linguist/blob/master/lib/linguist/languages.yml).

## Horizontal rule

Three or more hyphens `---`, asterisks `***` or underscores `___`

---

## [Text alignment](https://stackoverflow.com/q/14051715/4573584)

```md
<p align="center">centered text</p>
```

<p align="center">centered text</p>

## Badges

- [License badges using Shields.io](https://gist.github.com/lukas-h/2a5d00690736b4c3a7ba)

Using [Shields.io](https://shields.io/category/social/) badges with [custom logo](https://stackoverflow.com/a/41472017/4573584):

[![tyle-Flat-appveyor](https://img.shields.io/badge/style-flat-green.svg?logo=appveyor&style=flat)](https://img.shields.io/badge/style-flat-green.svg?logo=appveyor&style=flat)

```md
[![Style-Flat-appveyor](https://img.shields.io/badge/style-flat-green.svg?logo=appveyor&style=flat)](https://img.shields.io/badge/style-flat-green.svg?logo=appveyor&style=flat)
```

Use the following to obtain `?logo=data:image/png;base64,…`:

- [Base-64 encoding tool](https://b64.io/)
- [Encoder/decoder tool for percent encoding](https://meyerweb.com/eric/tools/dencoder/)

## Blockquotes

```md
> Blockquotes are very handy in email to emulate reply text.
> This line is part of the same quote.

Quote break.

> This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone. Oh, you can *put* **Markdown** into a blockquote.
```

> Blockquotes are very handy in email to emulate reply text.
> This line is part of the same quote.

Quote break.

> This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone. Oh, you can *put* **Markdown** into a blockquote.

## [Font Awesome](https://fontawesome.com/)

```md
<i class="fab fa-markdown"></i>
```

## Text colours and fonts

```md
In his beard lived three <span style="color:red">cardinals</span>.
```

In his beard lived three <span style="color:red">cardinals</span>.

```md
I am in <span style="font-family:Papyrus; font-size:4em;">LOVE!</span>
```

I am in <span style="font-family:Papyrus; font-size:4em;">LOVE!</span>

## YouTube videos

```md
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/oFFvwZIEk1Y/0.jpg)](https://www.youtube.com/watch?v=oFFvwZIEk1Y)
```

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/oFFvwZIEk1Y/0.jpg)](https://www.youtube.com/watch?v=oFFvwZIEk1Y)

Thumbnail by [Gopher](https://www.youtube.com/user/GophersVids).

## [Footnotes](https://stackoverflow.com/a/32119820/4573584)

In text:

```md
Bla bla <sup id="a1">[1](#f1)</sup> or <sup name="a2">[2](#f2)</sup>
```

In the footnote:

```md
<b id="f1">1</b> Footnote content here. [↩](#a1)
<b name="f2">2</b> Footnote content here. [↩](#a2)
```

Bla bla <sup id="a1">[1](#f1)</sup> or <sup name="a2">[2](#f2)</sup>

<b id="f1">1</b> Footnote content here. [↩](#a1)

<b name="f2">2</b> Footnote content here. [↩](#a2)

## Sources

1. <https://daringfireball.net/projects/markdown/>
2. <https://markdown-here.com/>
3. [Markdown cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
4. [Markdown Here cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Here-Cheatsheet)
5. <https://highlightjs.org/static/demo/>
6. <https://docs.github.com/en/free-pro-team@latest/github/writing-on-github/creating-and-highlighting-code-blocks>
7. <https://github.github.com/gfm/>
8. [Squarespace Markdown cheat sheet](https://support.squarespace.com/hc/en-us/articles/206543587-Markdown-cheat-sheet)
