## Headers

```md
# H1
## H2
### H3
#### H4
##### H5
###### H6

Alternatively, for H1 and H2, an underline-ish style:

Alt-H1
======

Alt-H2
------
```

## Emphasis

```md
Emphasis, aka italics, with *asterisks* or _underscores_.

Strong emphasis, aka bold, with **asterisks** or __underscores__.

Both ***bold and italic***.

Nested emphasis with **asterisks and _underscores_**.

Strikethrough uses two tildes. ~~Scratch this.~~
```

Emphasis, aka italics, with *asterisks* or _underscores_.

Strong emphasis, aka bold, with **asterisks** or __underscores__.

Both ***bold and italic*** using three asterisks or underscores.

Nested emphasis with **asterisks and _underscores_**.

Strikethrough uses two tildes. ~~Scratch this.~~

## Line breaks

```md
Here's a line for us to start with.

This line is separated from the one above by two newlines, so it will be a *separate paragraph*.

This line is also a separate paragraph, but...
This line is only separated by a single newline, so it's a separate line in the *same paragraph*.
```

Here's a line for us to start with.

This line is separated from the one above by two newlines, so it will be a *separate paragraph*.

This line is also a separate paragraph, but...
This line is only separated by a single newline, so it's a separate line in the *same paragraph*.

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

Unordered lists (using `*`, `-` or `+`)

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

This is a task list:

```md
- [x] Done
- [ ] Not done
- [ ] In progress
```

- [x] Done
- [ ] Not done
- [ ] In progress

Indentation can be used to have paragraphs within list items.

```md
1. Hello world!

    Bacon ipsum dolor amet drumstick landjaeger pork chop frankfurter spare ribs bresaola. Biltong jowl andouille t-bone. Andouille ground round burgdoggen t-bone.

    Hamburger kielbasa capicola, pancetta cupim doner swine meatloaf pork belly leberkas porchetta prosciutto jowl meatball.

1. Doing the best you can.

1. As long as you lend a hand.
```

1. Hello world!

    Bacon ipsum dolor amet drumstick landjaeger pork chop frankfurter spare ribs bresaola. Biltong jowl andouille t-bone. Andouille ground round burgdoggen t-bone.

    Hamburger kielbasa capicola, pancetta cupim doner swine meatloaf pork belly leberkas porchetta prosciutto jowl meatball.

1. Doing the best you can.

1. As long as you lend a hand.

Lists can be nested:

```md
1. first
    - one
        - 1
2. second
    - two
        - 2
3. third
    - three
        - 3
```

1. first
    - one
        - 1
2. second
    - two
        - 2
3. third
    - three
        - 3

## Hyperlinks

```md
[I'm an inline-style link](https://github.com/)

[I'm a reference-style link][Arbitrary case-insensitive reference text]

[You can use numbers for reference-style link definitions][1]

Or leave it empty and use the [link text itself]

URLs and URLs in angle brackets will automatically get turned into links.
https://github.com/ or <https://github.com/>.

Some text to show that the reference links can follow later.

[arbitrary case-insensitive reference text]: https://www.mozilla.org/en-US/
[1]: https://slashdot.org/
[link text itself]: https://github.com/
```

[I'm an inline-style link](https://github.com/)

[I'm a reference-style link][Arbitrary case-insensitive reference text]

[You can use numbers for reference-style link definitions][1]

Or leave it empty and use the [link text itself]

URLs and URLs in angle brackets will automatically get turned into links.
https://github.com/ or <https://github.com/>.

Some text to show that the reference links can follow later.

[arbitrary case-insensitive reference text]: https://www.mozilla.org/en-US/
[1]: https://slashdot.org/
[link text itself]: https://github.com/

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

```md
Inline `code` has `back-ticks around` it.
```

Inline `code` has `back-ticks around` it.

Code blocks are fenced by triple back ticks.
For code blocks, syntax highlighting is possible. Name the language right after the first three back ticks.

<pre><code>```javascript
var s = "JavaScript syntax highlighting";
alert(s);
```

```python
s = "Python syntax highlighting"
print(s)
```

```
No language indicated, so no syntax highlighting.
```</code></pre>

```javascript
var s = "JavaScript syntax highlighting";
alert(s);
```

```python
s = "Python syntax highlighting"
print(s)
```

```
No language indicated, so no syntax highlighting.
```

[List of languages supported by GitHub flavoured markdown](https://www.rubycoloredglasses.com/2013/04/languages-supported-by-github-flavored-markdown/):

> Github uses Linguist to perform language detection and syntax highlighting [...] [(see full list in Linguist - languages.yml)](https://github.com/github-linguist/linguist/blob/master/lib/linguist/languages.yml).

## Horizontal rule

Three or more hyphens `---`, asterisks `***` or underscores `___`

---

## Blockquotes

```md
> Blockquotes are very handy in email to emulate reply text.
> This line is part of the same quote.

Quote break.

> This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone.
>
> This is after a break. Oh, you can *put* **Markdown** into a blockquote.
```

> Blockquotes are very handy in email to emulate reply text.
> This line is part of the same quote.

Quote break.

> This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone.
>
> This is after a break. Oh, you can *put* **Markdown** into a blockquote.

## Mathematics

```md
This sentence uses `$` delimiters to show math inline:  $\sqrt{3x-1}+(1+x)^2$
```

This sentence uses `$` delimiters to show math inline:  $\sqrt{3x-1}+(1+x)^2$

To add a math expression as a block, start a new line and delimit the expression with two dollar symbols.

```md
**The Cauchy-Schwarz Inequality**

$$
\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)
$$
```

Alternatively, you can use the `math` code block syntax to display a math expression as a block. With this syntax, you don't need to use dollar symbol delimiters.

<pre><code>**The Cauchy-Schwarz Inequality**


```math
\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)
```</code></pre>

**The Cauchy-Schwarz Inequality**


```math
\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)
```

## Superscripts and subscripts

```md
- This is a <sub>subscript</sub> text.
- This is a <sup>superscript</sup> text.
```

- This is a <sub>subscript</sub> text.
- This is a <sup>superscript</sup> text.

## Alerts

```md
> [!NOTE]
> Useful information that users should know, even when skimming content.

> [!TIP]
> Helpful advice for doing things better or more easily.

> [!IMPORTANT]
> Key information users need to know to achieve their goal.

> [!WARNING]
> Urgent info that needs immediate user attention to avoid problems.

> [!CAUTION]
> Advises about risks or negative outcomes of certain actions.
```

> [!NOTE]
> Useful information that users should know, even when skimming content.

> [!TIP]
> Helpful advice for doing things better or more easily.

> [!IMPORTANT]
> Key information users need to know to achieve their goal.

> [!WARNING]
> Urgent info that needs immediate user attention to avoid problems.

> [!CAUTION]
> Advises about risks or negative outcomes of certain actions.

## Markdown comments

```md
<!-- This content will not appear in the rendered Markdown -->
```

## Emojis

```md
:+1: This PR looks great - it's ready to merge! :shipit:
```

:+1: This PR looks great - it's ready to merge! :shipit:

See the emoji cheat sheet [here](https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md).

## Endnotes and footnotes

For endnotes:

```md
Here is a simple endnote[^1].

An endnote can also have multiple lines[^2].

[^1]: My reference.
[^2]: To add line breaks within a endnote, prefix new lines with 2 spaces.
  This is a second line.
```

Here is a simple endnote[^1].

An endnote can also have multiple lines[^2].

[^1]: My reference.
[^2]: To add line breaks within a endnote, prefix new lines with 2 spaces.
  This is a second line.

For footnotes:

```md
Bla bla <sup id="a1">[1](#f1)</sup> or <sup name="a2">[2](#f2)</sup>

<b id="f1">1</b> Footnote content here. [↩](#a1)

<b name="f2">2</b> Footnote content here. [↩](#a2)
```

Bla bla <sup id="a1">[1](#f1)</sup> or <sup name="a2">[2](#f2)</sup>

<b id="f1">1</b> Footnote content here. [↩](#a1)

<b name="f2">2</b> Footnote content here. [↩](#a2)

## Collapsed sections

```md
<details>
<summary>Tips for collapsed sections (click to expand/collapse)</summary>

- You can add a header.
- You can add text within a collapsed section. 
- You can add an image or a code block, too.
</details>
```

<details>
<summary>Tips for collapsed sections (click to expand/collapse)</summary>

- You can add a header.
- You can add text within a collapsed section. 
- You can add an image or a code block, too.
</details>

## YouTube videos

```md
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/oFFvwZIEk1Y/0.jpg)](https://www.youtube.com/watch?v=oFFvwZIEk1Y "YouTube thumbnail")
```

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/oFFvwZIEk1Y/0.jpg)](https://www.youtube.com/watch?v=oFFvwZIEk1Y "YouTube thumbnail")

Thumbnail by [Gopher](https://www.youtube.com/user/GophersVids).

## [Text alignment](https://stackoverflow.com/q/14051715)

```md
<p align="center">centered text</p>
```

<p align="center">centered text</p>

## Text colours and fonts

```md
In his beard lived three <span style="color:red">cardinals</span>.
```

In his beard lived three <span style="color:red">cardinals</span>.

```md
I am in <span style="font-family:serif; font-size:4em;">LOVE!</span>
```

I am in <span style="font-family:serif; font-size:4em;">LOVE!</span>

## Badges

- [License badges using Shields.io](https://gist.github.com/lukas-h/2a5d00690736b4c3a7ba)

Using [Shields.io](https://shields.io/category/social/) badges with [custom logo](https://stackoverflow.com/a/41472017):

[![tyle-Flat-appveyor](https://img.shields.io/badge/style-flat-green.svg?logo=appveyor&style=flat)](https://img.shields.io/badge/style-flat-green.svg?logo=appveyor&style=flat)

```md
[![Style-Flat-appveyor](https://img.shields.io/badge/style-flat-green.svg?logo=appveyor&style=flat)](https://img.shields.io/badge/style-flat-green.svg?logo=appveyor&style=flat)
```

Use the following to obtain `?logo=data:image/png;base64,...`:

- [Base-64 encoding tool](https://b64.io/)
- [Encoder/decoder tool for percent encoding](https://meyerweb.com/eric/tools/dencoder/)

## Sources

1. <https://daringfireball.net/projects/markdown/>
1. <https://markdown-here.com/>
1. [Markdown cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
1. [Markdown Here cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Here-Cheatsheet)
1. <https://highlightjs.org/static/demo/>
1. <https://github.github.com/gfm/>
1. [Squarespace Markdown cheat sheet](https://support.squarespace.com/hc/en-us/articles/206543587-Markdown-cheat-sheet)
1. <https://docs.github.com/en/get-started/writing-on-github>
1. <https://stackoverflow.com/a/32119820>
