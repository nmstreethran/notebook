# Document conversion notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Ghostscript](#ghostscript)
  - [Compressing PDF files to reduce their size](#compressing-pdf-files-to-reduce-their-size)
  - [Merging PDF files and generating bookmarks](#merging-pdf-files-and-generating-bookmarks)
- [Poppler](#poppler)
  - [Merging PDF files](#merging-pdf-files)
  - [Convert PDF to image](#convert-pdf-to-image)
- [Pandoc](#pandoc)

## Ghostscript

### [Compressing PDF files to reduce their size](https://askubuntu.com/a/256449/714808)

```sh
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf
```

> - `-dPDFSETTINGS=/screen` lower quality, smaller size. (72 dpi)
> - `-dPDFSETTINGS=/ebook` for better quality, but slightly larger pdfs. (150 dpi)
> - `-dPDFSETTINGS=/prepress` output similar to Acrobat Distiller "Prepress Optimized" setting (300 dpi)
> - `-dPDFSETTINGS=/printer` selects output similar to the Acrobat Distiller "Print Optimized" setting (300 dpi)
> - `-dPDFSETTINGS=/default` selects output intended to be useful across a wide variety of uses, possibly at the expense of a larger output file

### Merging PDF files and generating bookmarks

This method preserves hyperlinks.

```sh
gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=output.pdf input1.pdf input2.pdf etc.pdf pdfmarks
```

`pdfmarks` is a text file that contains the bookmarks. For example:

```txt
[/Title (Title Page) /Page 1 /OUT pdfmark
[/Title (Table of Contents) /Page 3 /OUT pdfmark
```

The bookmarks can be nested:

```txt
[/Count 3 /Title (Chapter 1) /Page 1 /OUT pdfmark
[/Count -2 /Title (Section 1.1) /Page 2 /OUT pdfmark
[/Title (Section 1.1.1) /Page 3 /OUT pdfmark
[/Title (Section 1.1.2) /Page 4 /OUT pdfmark
[/Count -1 /Title (Section 1.2) /Page 5 /OUT pdfmark
[/Title (Section 1.2.1) /Page 6 /OUT pdfmark
[/Title (Section 1.3) /Page 7 /OUT pdfmark
```

The PDF metadata can be specified using a dictionary:

```txt
[ /Title (My Test Document)
  /Author (John Doe)
  /Subject (pdfmark 3.0)
  /Keywords (pdfmark, example, test)
  /DOCINFO pdfmark
```

See Adobe's [pdfmark reference](https://www.adobe.com/content/dam/acom/en/devnet/acrobat/pdfs/pdfmark_reference.pdf) for more information.

Source:

- <https://ubuntuforums.org/showthread.php?t=1545064>
- <http://physics.drexel.edu/~wking/unfolding-disasters-old/posts/PDF_bookmarks_with_Ghostscript/>

## Poppler

Source: <https://www.ostechnix.com/how-to-merge-pdf-files-in-command-line-on-linux/>

Installing in Ubuntu:

```sh
sudo apt-get install poppler-utils
```

### Merging PDF files

This method preserves hyperlinks.

```sh
pdfunite file1.pdf file2.pdf file3.pdf outputfile.pdf
```

### [Convert PDF to image](https://askubuntu.com/a/50180/714808)

```sh
pdftoppm input.pdf outputname -png
```

Converting a page:

```sh
pdftoppm input.pdf outputname -png -f {page} -singlefile
```

Specifying resolution:

```sh
pdftoppm input.pdf outputname -png -rx 300 -ry 300
```

## [Pandoc](https://pandoc.org/)

<details>
<summary>
Click to expand
</summary>

### Syntax highlighting <!-- omit in toc -->

Content fenced by three backticks (\`) will be parsed as codeblocks. If a language is not specified after the first three backticks, Pandoc parses the content into the `verbatim` environment on LaTeX. This prevents the codeblock from being formatted using the default syntax highlighting settings (including background colour). To prevent this from happening, assign these code blocks markup languages such as `html` or `md`.

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

### Markdown to Beamer <!-- omit in toc -->

[The Easiest Way to Make Presentations! (Pandoc + Markdown)](https://www.youtube.com/watch?v=dum7q6UXiCE) by Luke Smith on YouTube

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

### Markdown to PDF <!-- omit in toc -->

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

- [Page title or title](https://groups.google.com/forum/#!msg/pandoc-discuss/CyiyBJOn5Gs/Olo3aq1qAi0J):

```sh
pandoc -s -V "pagetitle:My Doc Title" -V "title:My Doc Title"
```

- Today's date:

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

### Markdown to reveal.js <!-- omit in toc -->

[Pandoc commands](https://pandoc.org/demos.html):

- For slides with math:

```sh
pandoc -s --mathjax -i -t revealjs SLIDES.txt -o example16d.html
```

```sh
pandoc -t revealjs -s habits.txt -o habits.html
```

[YAML metadata](https://pandoc.org/MANUAL.html#variables-for-html-slides):

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

### [Input multiple files](https://gist.github.com/xuanlongma/5564190) <!-- omit in toc -->

```sh
pandoc -s input1.md input2.md input3.md -o output.html
```

</details>
