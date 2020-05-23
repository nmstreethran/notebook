# LaTeX notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [My templates](#my-templates)
- [General](#general)
  - [Commands](#commands)
  - [Defining custom macros](#defining-custom-macros)
  - [Graphics](#graphics)
  - [Tables](#tables)
  - [Colours](#colours)
  - [Hyperlink and PDF metadata](#hyperlink-and-pdf-metadata)
  - [Listings](#listings)
  - [Lists](#lists)
  - [No monospaced URL font](#no-monospaced-url-font)
  - [Remove indentation and add spaces between paragraphs](#remove-indentation-and-add-spaces-between-paragraphs)
  - [Add section PDF bookmark manually](#add-section-pdf-bookmark-manually)
- [Bibliography](#bibliography)
  - [BibLaTeX styles](#biblatex-styles)
  - [Suppress values from bibliography output](#suppress-values-from-bibliography-output)
  - [Listing entries without in-text citation](#listing-entries-without-in-text-citation)
  - [Split bibliography into works cited and works not cited in-text](#split-bibliography-into-works-cited-and-works-not-cited-in-text)
  - [Remap `@software` entries to `@online`](#remap-software-entries-to-online)
- [Book / article / report document class](#book--article--report-document-class)
  - [Author and affiliation](#author-and-affiliation)
  - [Avoid overfulls in right margin](#avoid-overfulls-in-right-margin)
  - [Remove blank pages after chapters](#remove-blank-pages-after-chapters)
  - [Fix spacing problem for header and footer using `headheight`](#fix-spacing-problem-for-header-and-footer-using-headheight)
  - [Sans serif headings with serif body and math](#sans-serif-headings-with-serif-body-and-math)
  - [Adding lists to the table of contents](#adding-lists-to-the-table-of-contents)
  - [Header and footer settings using `fancyhdr`](#header-and-footer-settings-using-fancyhdr)
  - [Remove headers and footers for a page](#remove-headers-and-footers-for-a-page)
  - [Use value of last page](#use-value-of-last-page)
  - [List of abbreviations](#list-of-abbreviations)
  - [Frontmatter, mainmatter and backmatter](#frontmatter-mainmatter-and-backmatter)
  - [Word count](#word-count)
- [Beamer class](#beamer-class)
  - [Class options](#class-options)
  - [Defining document properties](#defining-document-properties)
  - [Themes and colours](#themes-and-colours)
  - [Beamer fonts](#beamer-fonts)
  - [Beamer listings](#beamer-listings)
  - [Beamer bibliography](#beamer-bibliography)
  - [Remove navigation symbols](#remove-navigation-symbols)
  - [Sectioning](#sectioning)
- [Old](#old)

## My templates

- [CV and cover letter](https://gitlab.com/nithiya/cvtemplate)
- [article](https://gitlab.com/nithiya/articletemplate)
- [beamer](https://gitlab.com/nithiya/beamertemplate)

## General

### Commands

#### Reusing defined commands

[Reusing the `\title`, `\author` and `\date` commands in different areas of a document](https://tex.stackexchange.com/a/10131/140109)

> The `\title`, `\author` and `\date` macros are saving their argument into `\@title`, `\@author`, and `\@date`, respectively. You can use this macros after `\makeatletter`. Afterwards use `\makeatother`. Note that they are cleared by `\maketitle`. - *Martin Scharrer*

```latex
\title{Example}
\author{Me}
\date{\today}

\makeatletter
\begin{titlepage}

The title is \@title
It was written by \@author\space on \@date

\end{titlepage}
\makeatother
```

#### [Define shortcuts to document properties](https://en.wikibooks.org/wiki/TeX/def)

```latex
\def\auth{Author's Name} % author
```

### Defining custom macros

```latex
\newcommand{\education}[5]{
    \textbf{#1}\hfill\textit{#2} \\
    \textbf{\textit{#3 $\bullet$ #4}}\hfill#5}
% end of preamble

\education{Master's Degree in Mathematics}{Apr 2017 — Apr 2018}{University of Alexandria}{Distinction grade}{Alexandria, Egypt}
```

### Graphics

#### Set images path

Source: <https://www.overleaf.com/learn>

```latex
\usepackage{graphicx}
\graphicspath{{images/}}
```

#### [Prevent image overflow in margins](https://github.com/jgm/pandoc/blob/master/data/templates/default.latex)

```latex
\makeatletter
    \def\maxwidth{\ifdim\Gin@nat@width>\linewidth\linewidth\else\Gin@nat@width\fi}
    \def\maxheight{\ifdim\Gin@nat@height>\textheight\textheight\else\Gin@nat@height\fi}
\makeatother
% scale images if necessary, so that they will not overflow the page
% margins by default, and it is still possible to overwrite the defaults
% using explicit options in \includegraphics[width, height, ...]{}
\setkeys{Gin}{width=\maxwidth,height=\maxheight,keepaspectratio}
```

#### [Set default figure placement to `!htb`](https://github.com/jgm/pandoc/blob/master/data/templates/default.latex)

```latex
\makeatletter
    \def\fps@figure{!htb}
\makeatother
```

#### Adding subfigures

```latex
\usepackage{subcaption}
% end of preamble

An example subfigure (Figure~\ref{fig:subfig}), which contains Figure~\ref{fig:a} and Figure~\ref{fig:b}. Figure~\ref{fig:b} has been flipped horizontally.

\begin{figure}
    \centering
    \begin{subfigure}[t]{.4\textwidth}
        \includegraphics{Passer_montanus_malaccensis}
        \caption{Picture A. \label{fig:a}}
    \end{subfigure}
    ~~~
    \begin{subfigure}[t]{.4\textwidth}
        \reflectbox{\includegraphics{Passer_montanus_malaccensis}}
        \caption{Picture B, which is the same as Picture A, but flipped horizontally. \label{fig:b}}
    \end{subfigure}
    \caption{The same Eurasian tree sparrow (\textit{Passer montanus malaccensis}), adult male, in Kuala Lumpur, Malaysia. Taken on 31 January 2019, 15:20:47 by Peter P. Othagoer, Wikimedia Commons, CC BY 4.0. \label{fig:subfig}}
\end{figure}
```

- <https://tex.stackexchange.com/a/119985/140109>
- <https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions#Captions>

### Tables

- ["ThreePartTable" environment](https://tex.stackexchange.com/a/209851/140109)
- [More space between rows](https://inf.ethz.ch/personal/markusp/teaching/guides/guide-tables.pdf)
- [Set table content to align left; for removing `underfull \hbox` warning in table](https://tex.stackexchange.com/a/275310/140109)

```latex
\usepackage{longtable,tabulary}
\usepackage{booktabs}
\usepackage{threeparttablex}
\renewcommand{\arraystretch}{1.2}
\newcolumntype{P}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
```

#### [Globally change table font size](https://tex.stackexchange.com/a/220258/140109)

```latex
\let\oldtabular\tabular
\renewcommand{\tabular}{\footnotesize\oldtabular}
```

#### Caption font

```latex
\usepackage[font=small,labelfont=bf]{caption}
```

#### Set default table placement to `!htb`

```latex
\makeatletter
    \def\fps@table{!htb}
\makeatother
```

### Colours

#### Defining custom HTML colours

```latex
\definecolor{MyPaleGreen}{HTML}{00CD98}
```

#### LaTeX RGB colours

See <https://latexcolor.com/>.

### Hyperlink and PDF metadata

- use hidelinks to remove hyperlink borders / coloured boxes
- [format hyperlink colours](https://www.overleaf.com/learn/latex/hyperlinks)
- `urlcolor` is for external links

```latex
\usepackage[hidelinks,pdftex,
    pdfauthor={Author},
    pdftitle={Title},
    pdfsubject={Subject},
    pdfkeywords={keyword1, keyword2}]{hyperref}
\hypersetup{colorlinks=true,linkcolor=blue,urlcolor=green,citecolor=blue}
```

#### [Token not allowed in a PDF string warning](https://tex.stackexchange.com/a/53514/140109)

> The bookmarks are not typeset by TeX: they simply are strings of characters, so no math or general formatting instructions are allowed. -- egreg

Using `\texorpdfstring{<tex>}{<bookmark>}` to avoid this error:

```latex
\subsection{The classes \texorpdfstring{$\mathcal{L}(\gamma)$}{Lg}}
```

### Listings

Add and rename title of list of listings:

```latex
\usepackage{listings}
\renewcommand{\lstlistlistingname}{List of Listings}
```

Listings configuration:

See <https://tex.stackexchange.com/a/235822/140109> and <https://en.wikibooks.org/wiki/LaTeX/Source_Code_Listings>.

```latex
% using named colours from xcolor
\usepackage[svgnames]{xcolor}
\lstset{
    basicstyle=\footnotesize\ttfamily,
    breaklines=true,
    numbers=left,
    backgroundcolor=\color{Snow},
    commentstyle=\itshape\color{SlateGrey},
    keywordstyle=\bfseries\color{ForestGreen},
    numberstyle=\tiny\ttfamily\color{DarkSlateGrey},
    stringstyle=\color{Crimson},
    showstringspaces=false
}
% additional styling for python code listings
\lstdefinestyle{py}{
    language=Python,
    keywordstyle={[2]\color{ForestGreen}},
    morekeywords={True,False,as},
    morestring=[s]{"""}{"""},
    morestring=[s]{'''}{'''},
    literate=
    *{+}{{{\bfseries\color{DarkOrchid}+}}}1
    {-}{{{\bfseries\color{DarkOrchid}-}}}1
    {*}{{{\bfseries\color{DarkOrchid}$^\ast$}}}1
    {/}{{{\bfseries\color{DarkOrchid}/}}}1
    {^}{{{\bfseries\color{DarkOrchid}\^{}}}}1
    {?}{{{\bfseries\color{DarkOrchid}?}}}1
    {!}{{{\bfseries\color{DarkOrchid}!}}}1
    {\%}{{{\bfseries\color{DarkOrchid}\%}}}1
    {<}{{{\bfseries\color{DarkOrchid}<}}}1
    {>}{{{\bfseries\color{DarkOrchid}>}}}1
    {|}{{{\bfseries\color{DarkOrchid}|}}}1
    {\&}{{{\bfseries\color{DarkOrchid}\&}}}1
    {~}{{{\bfseries\color{DarkOrchid}~}}}1
    {=}{{{\bfseries\color{DarkOrchid}=}}}1
    %
    {==}{{{\bfseries\color{DarkOrchid}==}}}2
    {<=}{{{\bfseries\color{DarkOrchid}<=}}}2
    {>=}{{{\bfseries\color{DarkOrchid}>=}}}2
    %
    {+=}{{{+=}}}2
    {-=}{{{-=}}}2
    {*=}{{{$^\ast$=}}}2
    {/=}{{{/=}}}2
}
```

Snippet with custom line number start:

```latex
\begin{lstlisting}[style=py,firstnumber=8]
# import libraries
import pandas as pd
\end{lstlisting}
```

### Lists

Adjust spacing:

```latex
\usepackage{enumitem}
\setlist{itemsep=.5pt}
```

### [No monospaced URL font](https://tex.stackexchange.com/a/53963/140109)

```latex
\urlstyle{same}
```

### Remove indentation and add spaces between paragraphs

```latex
\usepackage{parskip}
% remove indentation from abstract
\ifundef{\abstract}{}{\patchcmd{\abstract}
    {\quotation}{\quotation\noindent\ignorespaces}{}{}}
```

- <https://tex.stackexchange.com/a/1603/140109>
- <https://tex.stackexchange.com/a/40432/140109>

### Add section PDF bookmark manually

```latex
% \pdfbookmark[<level>]{<text>}{<name>}
% \currentpdfbookmark{<text>}{<name>}
\pdfbookmark[1]{Further Reading}{Further Reading}
```

- <https://tex.stackexchange.com/a/33701/140109>
- <https://tex.stackexchange.com/a/33699/140109>

## Bibliography

<https://www.ctan.org/pkg/biblatex>

Numeric bibliography:

- sorted by order of appearance
- given name initials
- display prefixes such as 'van', 'di', and 'le'
- compact date format

```latex
\usepackage[sorting=none,alldates=comp,useprefix=true,giveninits=true,defernumbers=true]{biblatex}
```

### [BibLaTeX styles](https://www.overleaf.com/learn/latex/Biblatex_citation_styles)

Alphanumeric style:

- [edit to include title for entries with no author and 'ND' for entries with no date; minimum 4 characters for title/author](https://tex.stackexchange.com/a/68875/140109)
- [display only first author's name in label using `maxalphanames=1`](https://tex.stackexchange.com/a/276530/140109)
- [ignore spaces in author name or title](https://tex.stackexchange.com/a/276530/140109)

```latex
\usepackage[style=alphabetic,maxalphanames=1]{biblatex}
\renewcommand*{\labelalphaothers}{}
\DeclareLabelalphaTemplate{
  \labelelement{
    \field[final]{shorthand}
    \field{label}
    \field[strwidth=4,strside=left,ifnames=1]{labelname}
    \field[strwidth=1,strside=left]{labelname}
    \field[strwidth=4,strside=left,ifnames=1]{title}
  }
  \labelelement{
        \field[strwidth=2,strside=right]{year}
        \field[strwidth=2,strside=right]{ND}
  }
}
\DeclareNolabel{
  \nolabel{\regexp{[\p{Z}\p{P}\p{S}\p{C}]+}}
}
```

The defaults for `\DeclareLabelalphaTemplate` can be found in [`biblatex.def`](https://github.com/plk/biblatex/blob/dev/tex/latex/biblatex/biblatex.def). The defaults for `\DeclareNolabel` are `\regexp{[\p{P}\p{S}\p{C}]+}`.

### [Suppress values from bibliography output](https://tex.stackexchange.com/a/364598/140109)

```latex
% suppress shorthand values
\DeclareSourcemap{
    \maps[datatype=bibtex]{\map{\step[fieldset=shorthand, null]}}
}
% suppress eprint class values
\DeclareSourcemap{
    \maps[datatype=bibtex]{\map{\step[fieldset=eprintclass, null]}}
}
```

### [Listing entries without in-text citation](https://tex.stackexchange.com/a/17132/140109)

`\nocite{*}` prints all entries, while `\nocite{key1,key2,...,keyn}` prints entries corresponding to the `key1,key2,...,keyn` keys. Use either of these commands before `\printbibliography`.

### [Split bibliography into works cited and works not cited in-text](https://tex.stackexchange.com/a/6977/140109)

```latex
%% preamble
\usepackage[defernumbers=true]{biblatex}
\DeclareBibliographyCategory{cited}
\AtEveryCitekey{\addtocategory{cited}{\thefield{entrykey}}}
\addbibresource{biblio.bib}
\nocite{*}
% end of preamble

Some text \cite{A01,B02}.

\printbibliography[category=cited]% default title for `article` class: "References"
\printbibliography[title={Further Reading},notcategory=cited]
```

### [Remap `@software` entries to `@online`](https://tex.stackexchange.com/a/325255/140109)

```latex
\DeclareBibliographyAlias{software}{online}
```

## Book / article / report document class

### Author and affiliation

```latex
\def\theauthor{Euclid of Alexandria}
% footnote containing author's contact information and/or affiliation
\def\authornote{Musaeum of Alexandria; Email: \href{mailto:euclid@alexandria.edu}{euclid@alexandria.edu}}
\usepackage[hidelinks]{hyperref}
\author{\theauthor \footnote{\authornote}}
\hypersetup{pdfauthor={\theauthor}}
```

### [Avoid overfulls in right margin](https://tex.stackexchange.com/a/391321/140109)

```latex
\emergencystretch 3em
```

### [Remove blank pages after chapters](https://tex.stackexchange.com/a/334126/140109)

```latex
\documentclass[11pt,openany]{book}
\let\cleardoublepage=\clearpage
```

### [Fix spacing problem for header and footer using `headheight`](https://tex.stackexchange.com/a/93871/140109)

```latex
\geometry{lmargin=2.5cm,rmargin=2.5cm,tmargin=2.5cm,bmargin=2.5cm,headheight=34pt}
```

### Sans serif headings with serif body and math

- [Font catalogue](http://tug.org/FontCatalogue/)

```latex
\usepackage{lmodern} % latin modern
\usepackage{mathpazo} % mathpazo font for body + math
\usepackage{sectsty} % for setting section headings to sans serif
\allsectionsfont{\raggedright\normalfont\sffamily\bfseries} % ^ bold + sans serif section headings; aligned left
```

### [Adding lists to the table of contents](https://ctan.org/pkg/tocbibind)

```latex
\usepackage[nottoc,notbib]{tocbibind}
```

### Header and footer settings using `fancyhdr`

- [Changing the font style of page number on front page](https://tex.stackexchange.com/a/97442/140109)
- [remove horizontal line from header](https://tex.stackexchange.com/a/13897/140109)
- [header and footers guide on Overleaf](https://www.overleaf.com/learn/latex/Headers_and_footers)
- [lowercase chapter in header](https://tex.stackexchange.com/a/121808/140109)
- [remove "Chapter 0" from header](https://tex.stackexchange.com/a/340126/140109)

```latex
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancypagestyle{plain}{
    \fancyhf{} % set header and footer to nothing
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot[C]{\sffamily\thepage}
}
\fancyhf{} % sets both header and footer to nothing
\renewcommand{\headrulewidth}{0pt} % remove horizontal line from header
\fancyhead[LE,RO]{} % blank
\fancyfoot[LE,RO]{\sffamily\thepage} % page number
\fancyfoot[RE,LO]{} % blank
\makeatletter
\fancyhead[RE]{\if@mainmatter \sffamily\chaptername~\thechapter\fi} % "Chapter X"
\makeatother
\fancyhead[LO]{\textit{\sffamily\nouppercase{\leftmark}}} % Chapter title
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
```

### [Remove headers and footers for a page](https://tex.stackexchange.com/a/120748/140109)

```latex
\thispagestyle{empty}
```

### [Use value of last page](https://tex.stackexchange.com/a/235/140109)

```latex
\usepackage{lastpage}
\fancyfoot[C]{\thepage/\pageref{LastPage}}
```

### List of abbreviations

```latex
\usepackage[acronym,nomain,nonumberlist,nopostdot,nogroupskip,automake,toc]{glossaries}
\setglossarystyle{index}
\makeglossaries
```

### Frontmatter, mainmatter and backmatter

- [footnote customisation](https://en.wikibooks.org/wiki/LaTeX/Footnotes_and_Margin_Notes)
- [reset footnote counter](https://ubuntuincident.wordpress.com/2011/12/28/reset-footnote-counter-in-latex/)
- [placing appendices after backmatter](https://tex.stackexchange.com/a/198608/140109)
- [remove "Appendix/Chapter X" from references header](https://tex.stackexchange.com/a/102693/140109)
- [appendix chapter name](https://tex.stackexchange.com/a/151130/140109)

### Word count

- [TeXcount](https://ctan.uib.no/support/texcount/doc/TeXcount.pdf) package documentation.
- [Ignore sections or inputs of a document when calculating the number of words using TeXcount](https://tex.stackexchange.com/a/259296/140109) - using `%TC:ignore` and `%TC:endignore`:

```latex
% regions between TC:ignore and TC:endignore will be ignored from word count
%TC:ignore
\appendix
And now for something completely different
%TC:endignore
```

## Beamer class

<https://www.ctan.org/pkg/beamer>

### Class options

Set custom aspect ratio (widescreen) and import colours from `xcolor` (`svgnames`):

```latex
\documentclass[aspectratio=169,xcolor={svgnames}]{beamer}
```

- <https://tex.stackexchange.com/a/74807/140109>

### Defining document properties

```latex
% define title, subtitle, author's name, institute, and
% date (and/or event name)
% short versions in [brackets]
% use \today to display today's date in MMM dd, YYYY format
\title[Prime Numbers]{There Is No Largest Prime Number}
\subtitle[\textit{reductio ad absurdum}]{The proof uses \textit{reductio ad absurdum}.}
\author[Euclid of Alexandria]{Euclid of Alexandria \href{mailto:euclid@alexandria.edu}{\texttt{<euclid@alexandria.edu>}}}
\institute[Musaeum]{Musaeum of Alexandria}
\date[ISPN '80]{27th International Symposium of Prime Numbers; 280 BC}
% define pdf metadata
% keywords
\def\keywords{presentation, beamer, latex, prime numbers}
% subject - e.g., event name and copyright info
\def\subject{Presented at ISPN '80. License: CC BY 4.0.}
\hypersetup{pdfkeywords={\keywords},pdfsubject={\subject}}
```

### Themes and colours

- [Beamer theme gallery](https://deic-web.uab.cat/~iblanes/beamer_gallery/)
- [Beamer docs](https://ctan.org/pkg/beamer)
- [Beamer template tutorial by Claudio Fiandrino](https://tex.stackexchange.com/a/146682/140109)
- [Overleaf beamer guide](https://www.overleaf.com/learn/latex/Beamer)
- [set colours for sections and subsections in table of contents](https://tex.stackexchange.com/a/69721/140109)

```latex
\mode<presentation>
{
    % set inner, outer, and colour themes
    \useoutertheme{infolines}
    \usecolortheme{spruce,rose} % these colours are part of beamer
    \usecolortheme[named=MSUgreen]{structure} % ^
    \useinnertheme[shadow]{rounded}
    % remove navigation symbols
    \setbeamertemplate{navigation symbols}{}
    % use numbered captions
    \setbeamertemplate{caption}[numbered]
    % set custom colours for blocks and text
    % these colours (except MSUgreen) are named colours from xcolor (svgnames)
    \setbeamercolor{block title}{fg=MSUgreen,bg=PaleGreen!40}
    \setbeamercolor{block title example}{fg=RoyalBlue,bg=PowderBlue!40}
    \setbeamercolor{block title alerted}{fg=Tomato,bg=PeachPuff!40}
    \setbeamercolor{example text}{fg=RoyalBlue}
    \setbeamercolor{alerted text}{fg=Tomato}
    \setbeamercolor{math text}{fg=DarkSlateGrey}
    % show bibliography numbering
    \setbeamertemplate{bibliography item}[text]
}
```

### Beamer fonts

Example for a sans-serif presentation:

```latex
\usepackage{amsmath} % math
\usepackage[zerostyle=c,straightquotes]{newtxtt} % monospace
\usepackage[sfdefault]{cabin} % sans-serif default
\usepackage{gfsneohellenicot} % sans-serif math font
\usepackage{fontawesome5} % font awesome symbols
\faStyle{regular} % font awesome style
```

### Beamer listings

[Specifying font](https://www.ctan.org/pkg/newtxtt):

```latex
\lstset{
    basicstyle=\footnotesize\usefont{T1}{newtxtt}{m}{n}
}
```

Displaying listing in a frame (must use `fragile`):

```latex
\subsection{Code Blocks}
\begin{frame}[fragile]{\insertsubsectionhead}
% no indentation for this frame as it's verbatim code
\begin{exampleblock}{Shell}
\begin{lstlisting}[language=sh]
#!/bin/bash

cd $HOME
cout << "Hello world!";
\end{lstlisting}
\end{exampleblock}
\end{frame}
```

### Beamer bibliography

- [bibliography icon](https://tex.stackexchange.com/a/68084/140109)
- [numerical references](https://tex.stackexchange.com/a/68081/140109)
- [change font size](https://tex.stackexchange.com/a/205447/140109)

Change font size:

```latex
\AtBeginBibliography{\footnotesize}
```

- [Beamer references](https://en.wikibooks.org/wiki/LaTeX/Presentations#References_%28Beamer%29)
- references which are not cited in the slides using `\nocite{bibid}`

```latex
\begin{frame}
    Citing an article \cite{sigfridsson}, online source \cite{ctan}, and book \cite{aristotle:anima}.
\end{frame}

\section*{References}
\begin{frame}[allowframebreaks]{\insertsectionhead}
    \nocite{angenendt,vangennep,britannica}
    \printbibliography[heading=none]
\end{frame}
```

### Remove navigation symbols

```latex
\setbeamertemplate{navigation symbols}{}
```

### Sectioning

From Overleaf:

- sections can be created in order to organize your presentation into discrete blocks, all sections and subsections are automatically printed in the table of contents as an overview of the talk
- a subsection can be created just before a set of slides with a common theme to further break down your presentation into chunks

```latex
\section{First Section}
\subsection{Subsection Example}
\begin{frame}{Table of Contents}
\tableofcontents[currentsection]
```

## Old

<details>
<summary>
Click to expand
</summary>

### ModernCV <!-- omit in toc -->

***Note: This package has not been updated since 2016***

#### Known issues <!-- omit in toc -->

- main `.tex` file: Some font shapes were not available, defaults substituted
- `fontenc.sty`: Font shape 'TU/qpl/m/n' undefined \ (Font) using 'TU/lmr/m/n' instead
- `moderncvbodyiii.sty`: You have requested package 'moderncvbodyiii', but the package provides 'moderncvbodyiii'.
- `moderncvheadiii.sty`: You have requested package 'moderncvheadiii', but the package provides 'moderncvheadiii'.

#### [Extending a quote's width](https://tex.stackexchange.com/a/247503/140109) <!-- omit in toc -->

```latex
% preamble
\let\originalrecomputecvlengths\recomputecvlengths
\renewcommand*{\recomputecvlengths}{%
\originalrecomputecvlengths%
\setlength{\quotewidth}{.8\textwidth}} % change .8 to desired value
```

#### [Edit space after header](https://tex.stackexchange.com/a/82871/140109) <!-- omit in toc -->

```latex
\makecvtitle
\vspace*{-5mm} % enter right after \makecvtitle
```

#### [Reduce signature whitespace](https://tex.stackexchange.com/a/196910/140109) <!-- omit in toc -->

```latex
% preamble
\patchcmd{\makeletterclosing}{[3em]}{[1em]}{}{}
```

### Bibliography patches <!-- omit in toc -->

To remove empty parentheses if year not provided for `@online`:

```latex
\usepackage{xpatch}
\xpatchbibdriver{online}
{\printtext[parens]{\usebibmacro{date}}}
{\iffieldundef{year}{}{\printtext[parens]{\usebibmacro{date}}}}
{}{}
```

Prioritising DOI or eprint over URL, if present:

- if DOI is not present, print eprint; if eprint is not present, print URL

```latex
\renewbibmacro*{doi+eprint+url}{%
    \printfield{doi}
    \newunit\newblock
    \newunit\newblock
    \iffieldundef{doi}{%
        \usebibmacro{eprint}
        \iffieldundef{eprint}{%
            \usebibmacro{url+urldate}}}
    {}
}
```

Removes unwanted fields for all reference types, except `@misc`:

```latex
\AtEveryBibitem{%
    \ifboolexpr{not (test {\ifentrytype{misc}})}%
    {\clearfield{issn}}{}
}
```

- [supress patching footnotes failed warning](https://tex.stackexchange.com/a/202994/140109)

```latex
\usepackage{silence} % suppress warning below
\WarningFilter{biblatex}{Patching footnotes failed}
```

### `hyperxmp` <!-- omit in toc -->

```latex
\def\licenseurl{https://www.latex-project.org/lppl/lppl-1-3c/} % license URL
\def\copyright{Copyright \textcopyright~\the\year{}~by Author. Licensed under the LPPL, version 1.3c.} % copyright information
\usepackage{hyperxmp}
\hypersetup{pdfcopyright=\copyright,pdflicenseurl=\licenseurl,pdfcontactemail=email@mail.com}
```

### Force table captions to top of the table <!-- omit in toc -->

```latex
\usepackage{floatrow}
\floatsetup[table]{capposition=top}
```

### Ensuring bibliography respects margins and [fix `underfull \hbox` warnings](https://tex.stackexchange.com/a/10928/140109) <!-- omit in toc -->

```latex
\appto{\bibsetup}{\sloppy}
\usepackage{etoolbox}
\apptocmd{\sloppy}{\hbadness 10000\relax}{}{}
```

### Change title of contents <!-- omit in toc -->

```latex
\usepackage[UKenglish]{babel} % UK English language
\addto\captionsUKenglish{\renewcommand\contentsname{Table of Contents}} % specify new title
```

### [Float placeins within subsections](https://tex.stackexchange.com/a/118667/140109) <!-- omit in toc -->

```latex
\usepackage[section]{placeins}
\makeatletter
\AtBeginDocument{%
    \expandafter\renewcommand\expandafter\subsection\expandafter{%
        \expandafter\@fb@secFB\subsection
    }
}
\makeatother
```

### [Adding captions as a node in `tikzpicture`](https://tex.stackexchange.com/a/351672/140109) <!-- omit in toc -->

[`tikzpagenodes`](https://tex.stackexchange.com/a/386331/140109)

### Change date format to DD/MM/YYYY <!-- omit in toc -->

```latex
\usepackage[UKenglish]{babel}
\usepackage[ddmmyyyy]{datetime} % set date format
```

### Rename "Chapter X" to "Part X" <!-- omit in toc -->

```latex
\addto\captionsUKenglish{\renewcommand{\chaptername}{Part}} % specify new name
```

### Beamer <!-- omit in toc -->

#### [Adjust title page vertical spacing](https://tex.stackexchange.com/a/255335/140109) <!-- omit in toc -->

```latex
\makeatletter
\defbeamertemplate*{title page}{mydefault}[1][]{
    \begin{columns}
        \column{.22\paperwidth}% ADJUST
        \mbox{}
        \column{.78\paperwidth}% ADJUST
        \begin{beamercolorbox}[sep=0pt,left,#1]{author}
            \vskip1.5cm
            \usebeamerfont{author}\textcolor{white}\insertauthor
        \end{beamercolorbox}
        \vskip.7cm%<- added
        \begin{beamercolorbox}[sep=0pt,left,#1]{title}
            \usebeamerfont{title}\titlesize\inserttitle\par%
            \ifx\insertsubtitle\@empty%
            \else%
            \vskip0.25em%
            {\usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\insertsubtitle\par}%
            \fi%
        \end{beamercolorbox}%
        \vskip.25cm\par
        \begin{beamercolorbox}[sep=0pt,left,#1]{date}
            \usebeamerfont{date}\footnotesize\date
        \end{beamercolorbox}\vskip.25em
        \begin{beamercolorbox}[sep=0pt,left,#1]{email}
            \usebeamerfont{email}\href{mailto:email@mail.com}{\texttt{\textcolor{white}email@mail.com}}
        \end{beamercolorbox}
    \end{columns}}
\setbeamertemplate{title page}[mydefault][colsep=-4bp,rounded=true,shadow=\beamer@themerounded@shadow,wd=9.5cm]% ADJUST
\makeatother
```

#### [Frame title formatting](https://tex.stackexchange.com/a/306416/140109) <!-- omit in toc -->

```latex
\makeatletter %
\setbeamertemplate{frametitle}{
    \ifbeamercolorempty[bg]{frametitle}{}{\nointerlineskip}%
    \@tempdima=\textwidth%
    \advance\@tempdima by\beamer@leftmargin%
    \advance\@tempdima by\beamer@rightmargin%
    \vspace{.5cm} % ADJUST
    \hspace*{.5cm} % ADJUST
    \begin{beamercolorbox}[sep=.3cm,left,wd=\the\@tempdima]{frametitle}
        \usebeamerfont{frametitle}%
        \vbox{}\vskip-1ex%
        \if@tempswa\else\csname beamer@ftecenter\endcsname\fi%
        \strut\underline{\insertframetitle}\strut\par%
        {%
            \ifx\insertframesubtitle\@empty%
            \else%
            {\usebeamerfont{framesubtitle}\usebeamercolor[fg]{framesubtitle}\insertframesubtitle\strut\par}%
            \fi
        }%
        \vskip-1ex%
        \if@tempswa\else\vskip-.3cm\fi% set inside beamercolorbox... evil here...
    \end{beamercolorbox}}
\makeatother
```

#### [Frame margins](https://tex.stackexchange.com/a/109984/140109) <!-- omit in toc -->

```latex
\setbeamertemplate{footline}{%
    \vspace{.4cm}
}
```

#### Beamer colours <!-- omit in toc -->

```latex
\definecolor{darkblue}{HTML}{050F42} % custom HTML colour
\usecolortheme[named=blue]{structure} % set theme colour
\setbeamertemplate{section in toc}{%
    {\color{blue}\inserttocsectionnumber.}~{\color{blue}\textbf{\inserttocsection}}}
\setbeamertemplate{subsection in toc}{%
    \hspace{2em}{\color{logoblue}\rule[0.3ex]{3pt}{3pt}}~\inserttocsubsection\par}
\setbeamercolor{title}{fg=white}
\setbeamercolor{date}{fg=white}
\setbeamercolor{frametitle}{fg=darkblue}
\setbeamercolor{normal text}{fg=darkblue}
\setbeamercolor{example text}{fg=blue}
```

#### [Change position of navigation symbols](https://tex.stackexchange.com/a/35637/140109) <!-- omit in toc -->

```latex
\hskip1em\usebeamercolor[fg]{navigation symbols dimmed}%
    \insertslidenavigationsymbol%
    \insertframenavigationsymbol% %
    \insertsectionnavigationsymbol%
    \insertsubsectionnavigationsymbol%
    \insertdocnavigationsymbol%
    \insertbackfindforwardnavigationsymbol
```

</details>
