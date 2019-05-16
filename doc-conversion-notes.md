# Document conversion  notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->
- [Pandoc](#pandoc)
  - [Markdown to Beamer](#markdown-to-beamer)
  - [Markdown to PDF](#markdown-to-pdf)
  - [Markdown to reveal.js](#markdown-to-revealjs)

## [Pandoc](https://pandoc.org/)

### Markdown to Beamer

The Easiest Way to Make Presentations! (Pandoc + Markdown) by Luke Smith:

[![The Easiest Way to Make Presentations! (Pandoc + Markdown)](http://img.youtube.com/vi/dum7q6UXiCE/0.jpg)](http://www.youtube.com/watch?v=dum7q6UXiCE)

[Pandoc command](https://pandoc.org/demos.html):

```shell
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

```shell
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

```shell
pandoc -s -V "pagetitle:My Doc Title" -V "title:My Doc Title" 
```

* Today's date:

```shell
-M date="`date "+%B %e, %Y"`"
```

or

```shell
--metadata date="`date +%D`"
```

To obtain date formats:

```shell
date --help
```

### Markdown to reveal.js

[Pandoc commands](https://pandoc.org/demos.html):

* For slides with math:

```shell
pandoc -s --mathjax -i -t revealjs SLIDES.txt -o example16d.html
```

```shell
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