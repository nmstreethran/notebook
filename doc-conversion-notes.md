# Document conversion  notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->
- [Pandoc](#pandoc)
  - [Markdown to Beamer](#markdown-to-beamer)
  - [Markdown to PDF](#markdown-to-pdf)
- [reveal.js](#revealjs)

## [Pandoc](https://pandoc.org/)

### Markdown to Beamer

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

## [reveal.js](https://revealjs.com/)

* [GitHub repository](https://github.com/hakimel/reveal.js)
* [Node.js](https://nodejs.org/en/)