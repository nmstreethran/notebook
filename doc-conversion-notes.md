# Document conversion  notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->
- [Ghostscript](#ghostscript)
- [Poppler](#poppler)
- [Pandoc](#pandoc)
  - [Syntax highlighting](#syntax-highlighting)
  - [Markdown to Beamer](#markdown-to-beamer)
  - [Markdown to PDF](#markdown-to-pdf)
  - [Markdown to reveal.js](#markdown-to-revealjs)
  - [Input multiple files](#input-multiple-files)


## Ghostscript

[Compressing PDF files to reduce their size](https://askubuntu.com/a/256449/714808)

```sh
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf
```

> - `-dPDFSETTINGS=/screen` lower quality, smaller size. (72 dpi)
> - `-dPDFSETTINGS=/ebook` for better quality, but slightly larger pdfs. (150 dpi)
> - `-dPDFSETTINGS=/prepress` output similar to Acrobat Distiller "Prepress Optimized" setting (300 dpi)
> - `-dPDFSETTINGS=/printer` selects output similar to the Acrobat Distiller "Print Optimized" setting (300 dpi)
> - `-dPDFSETTINGS=/default` selects output intended to be useful across a wide variety of uses, possibly at the expense of a larger output file

## Poppler

Source: https://www.ostechnix.com/how-to-merge-pdf-files-in-command-line-on-linux/

Installing in Ubuntu:

```sh
sudo apt-get install poppler-utils
```

Merging PDF files (preserves hyperlinks):

```sh
pdfunite file1.pdf file2.pdf file3.pdf outputfile.pdf
```

## [Pandoc](https://pandoc.org/)

### Syntax highlighting

Content fenced by three backticks (```) will be parsed as codeblocks. If a language is not specified after the first three backticks, Pandoc parses the content into the `verbatim` environment on LaTeX. This prevents the codeblock from being formatted using the default syntax highlighting settings (including background colour). To prevent this from happening, assign these code blocks markup languages such as `html` or `md`.

Allowing syntax highlighting of inline code (refs: [1](https://stackoverflow.com/a/54669722/4573584), [2](https://stackoverflow.com/a/34481948/4573584)):

```latex
% preamble - required packages
\usepackage{xcolor}
\definecolor{bgcolor}{HTML}{f0f8ff}
% set background colour
\let\oldtexttt\texttt
\renewcommand{\texttt}[1]{
  \colorbox{bgcolor}{\oldtexttt{#1}}
}
```

### Markdown to Beamer

[The Easiest Way to Make Presentations! (Pandoc + Markdown)](http://www.youtube.com/watch?v=dum7q6UXiCE) by Luke Smith on YouTube

[Pandoc command](https://pandoc.org/demos.html):

```sh
pandoc -t beamer file.md -o file.pdf
```

[YAML metadata](https://pandoc.org/MANUAL.html#variables-for-beamer-slides):

```yml
---
aspectratio:
- 169
title:
- Title
subtitle:
- Subtitle
author: 
- Author
subject:
- Subject
date:
- \today
theme:
- Madrid
colortheme:
- beaver
keywords:
- random
- notes
---
```

### Markdown to PDF

[Pandoc command](https://pandoc.org/demos.html)

```sh
pandoc file.txt --pdf-engine=pdflatex -o file.pdf
```

[YAML metadata](https://pandoc.org/MANUAL.html#variables-for-latex)

```yml
---
title:
- Title
subtitle:
- Subtitle
author: 
- Author
subject:
- Subject
date:
- \today
keywords:
- random
- notes
abstract:
- Abstract.
documentclass:
- article
fontfamily:
- mathpazo
papersize:
- a4
geometry:
- top=25mm
- left=25mm
- right=25mm
- bottom=25mm
---
```

Command line formatting and metadata:

* [Page title or title](https://groups.google.com/d/msg/pandoc-discuss/CyiyBJOn5Gs/Olo3aq1qAi0J):

```sh
pandoc -s -V "pagetitle:My Doc Title" -V "title:My Doc Title"
```

* Today's date:

```sh
-M date="`date "+%B %e, %Y"`"
```

or

```sh
--metadata date="`date +%D`"
```

To obtain date formats:

```sh
date --help
```

### Markdown to reveal.js

[Pandoc commands](https://pandoc.org/demos.html):

* For slides with math:

```sh
pandoc -s --mathjax -i -t revealjs SLIDES.txt -o example16d.html
```

```sh
pandoc -t revealjs -s habits.txt -o habits.html
```

[YAML metadata](http://pandoc.org/MANUAL.html#variables-for-html-slides):

```yml
---
revealjs-url:
- https://revealjs.com/
title:
- Title
author:
- Author
date:
- 20/04/2019
theme:
- white
---
```

### [Input multiple files](https://gist.github.com/xuanlongma/5564190)

```sh
pandoc -s input1.md input2.md input3.md -o output.html
```
