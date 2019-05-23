# Document conversion  notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->
- [Pandoc](#pandoc)
  - [Markdown to Beamer](#markdown-to-beamer)
  - [Markdown to PDF](#markdown-to-pdf)
  - [Markdown to reveal.js](#markdown-to-revealjs)
  - [Input multiple files](#input-multiple-files)

## [Pandoc](https://pandoc.org/)

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