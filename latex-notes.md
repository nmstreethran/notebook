# LaTeX notes <!-- omit in toc -->

My LaTeX documents are compiled on [VSCodium](https://vscodium.github.io/) (open-source alternative to [Visual Studio Code](https://code.visualstudio.com/)) with [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) and [TeX Live](https://tug.org/texlive/).

## Table of contents <!-- omit in toc -->

- [General](#general)
  - [Reusing defined commands](#reusing-defined-commands)
  - [Define shortcuts to document properties](#define-shortcuts-to-document-properties)
  - [Set images path](#set-images-path)
  - [Adding captions as a node in `tikzpicture`](#adding-captions-as-a-node-in-tikzpicture)
  - [Defining custom HTML colours](#defining-custom-html-colours)
  - [Hyperlink and pdf metadata](#hyperlink-and-pdf-metadata)
- [Bibliography](#bibliography)
  - [Patches](#patches)
  - [BibLaTeX styles](#biblatex-styles)
  - [Listing entries without in-text citation](#listing-entries-without-in-text-citation)
- [Book / article / report document class](#book--article--report-document-class)
  - [Avoid overfulls in right margin](#avoid-overfulls-in-right-margin)
  - [Remove blank pages after chapters](#remove-blank-pages-after-chapters)
  - [Fix spacing problem for header and footer using `headheight`](#fix-spacing-problem-for-header-and-footer-using-headheight)
  - [Change title of contents](#change-title-of-contents)
  - [Listings](#listings)
  - [Sans serif headings with serif body and math](#sans-serif-headings-with-serif-body-and-math)
  - [Adding lists to the table of contents](#adding-lists-to-the-table-of-contents)
  - [Rename "Chapter X" to "Part X"](#rename-chapter-x-to-part-x)
  - [Caption font](#caption-font)
  - [Force table captions to top of the table](#force-table-captions-to-top-of-the-table)
  - [Header and footer settings using `fancyhdr`](#header-and-footer-settings-using-fancyhdr)
  - [Remove headers and footers for a page](#remove-headers-and-footers-for-a-page)
  - [Float placeins within subsections](#float-placeins-within-subsections)
  - [Tables](#tables)
  - [Globally change table font size](#globally-change-table-font-size)
  - [Bibliography package](#bibliography-package)
  - [Ensuring bibliography respects margins and fix `underfull \hbox` warnings](#ensuring-bibliography-respects-margins-and-fix-underfull-hbox-warnings)
  - [List of abbreviations](#list-of-abbreviations)
  - [Frontmatter, mainmatter and backmatter](#frontmatter-mainmatter-and-backmatter)
  - [Word count](#word-count)
- [Beamer class](#beamer-class)
  - [Themes and colours](#themes-and-colours)
  - [Change date format to DD/MM/YYYY](#change-date-format-to-ddmmyyyy)
  - [Bibliography](#bibliography-1)
  - [Adjust title page vertical spacing](#adjust-title-page-vertical-spacing)
  - [Frame title formatting](#frame-title-formatting)
  - [Frame margins](#frame-margins)
  - [Remove navigation symbols](#remove-navigation-symbols)
  - [Change position of navigation symbols](#change-position-of-navigation-symbols)
  - [Sectioning](#sectioning)
- [ModernCV](#moderncv)
  - [Known issues](#known-issues)
  - [Extending a quote's width](#extending-a-quotes-width)
  - [Edit space after header](#edit-space-after-header)
  - [Reduce signature whitespace](#reduce-signature-whitespace)

## General

### Reusing defined commands

[Reusing the `\title`, `\author` and `\date` commands in different areas of a document](https://tex.stackexchange.com/a/10131/140109)

> The `\title`, `\author` and `\date` macros are saving their argument into `\@title`, `\@author`, and `\@date`, respectively. You can use this macros after `\makeatletter`. Afterwards use `\makeatother`. Note that they are cleared by `\maketitle`. - *Martin Scharrer*

```latex
\title{Example}
\author{Me}
\date{\today}

% ...

\makeatletter
\begin{titlepage}

The title is \@title
It was written by \@author\space on \@date

\end{titlepage}
\makeatother
```

### [Define shortcuts to document properties](https://en.wikibooks.org/wiki/TeX/def)

```latex
\def \auth {Author's Name} % author
```

### Set images path

Source: <https://www.overleaf.com/learn>

```latex
\usepackage{graphicx}
\graphicspath{ {images/} }
```

### [Adding captions as a node in `tikzpicture`](https://tex.stackexchange.com/a/351672/140109)

[`tikzpagenodes`](https://tex.stackexchange.com/a/386331/140109)

### [Defining custom HTML colours](https://htmlcolorcodes.com/color-names/)

```latex
\definecolor{EnsystraGreen}{HTML}{00CD98}
```

### Hyperlink and pdf metadata

- use hidelinks to remove hyperlink borders
- [`hyperxmp` package](https://ctan.org/pkg/hyperxmp)
- [format hyperlink colours](https://www.overleaf.com/learn/latex/hyperlinks)

```latex
\def \licenseurl {https://www.latex-project.org/lppl/lppl-1-3c/} % license URL
\def \copyright {Copyright \textcopyright~\the\year{}~by Author. Licensed under the LPPL, version 1.3c.} % copyright information
\usepackage{hyperxmp}
\usepackage[hidelinks,pdftex,
    pdfauthor={Author},
    pdftitle={Title},
    pdfsubject={Subject},
    pdfkeywords={keyword1,keyword2}]{hyperref}
\hypersetup{colorlinks=true,linkcolor=blue,urlcolor=blue,citecolor=blue,pdfcopyright=\copyright,pdflicenseurl=\licenseurl,pdfcontactemail=email@mail.com}
```

## Bibliography

### Patches

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

[Remap `@software` entries to `@online`](https://tex.stackexchange.com/a/325255/140109):

```latex
\DeclareBibliographyAlias{software}{online}
```

### [BibLaTeX styles](https://www.overleaf.com/learn/latex/Biblatex_citation_styles)

Alphanumeric style

- [edit to include title for entries with no author and 'ND' for entries with no date; minimum 4 characters for title/author](https://tex.stackexchange.com/a/68875/140109)
- [display only first author's name in label using `maxalphanames=1`](https://tex.stackexchange.com/a/276530/140109)
- [ignore spaces in author name or title](https://tex.stackexchange.com/a/276530/140109)

```latex
\usepackage[backend=biber,style=alphabetic,urldate=long,maxalphanames=1]{biblatex}
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

### [Listing entries without in-text citation](https://tex.stackexchange.com/a/17132/140109)

`\nocite{*}` prints all entries, while `\nocite{key1,key2,...,keyn}` prints entries corresponding to the `key1,key2,...,keyn` keys. Use either of these commands before `\printbibliography`.

## Book / article / report document class

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

### Change title of contents

```latex
\usepackage[UKenglish]{babel} % UK English language
\addto\captionsUKenglish{\renewcommand\contentsname{Table of Contents}} % specify new title
```

### Listings

```latex
\usepackage{listings}
\renewcommand{\lstlistlistingname}{List of Listings} % add/rename title of list of listings
```

### Sans serif headings with serif body and math

- [Font catalogue](http://www.tug.dk/FontCatalogue/)

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

### Rename "Chapter X" to "Part X"

```latex
\addto\captionsUKenglish{\renewcommand{\chaptername}{Part}} % specify new name
```

### Caption font

```latex
\usepackage[font=small,labelfont=bf]{caption}
```

### Force table captions to top of the table

```latex
\usepackage{floatrow}  
\floatsetup[table]{capposition=top}
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

### [Float placeins within subsections](https://tex.stackexchange.com/a/118667/140109)

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

### Tables

- ["ThreePartTable" environment](https://tex.stackexchange.com/a/209851/140109)
- [More space between rows](https://www.inf.ethz.ch/personal/markusp/teaching/guides/guide-tables.pdf)
- [Set table content to align left; for removing `underfull \hbox` warning in table](https://tex.stackexchange.com/a/275310/140109)

```latex
\usepackage{longtable,tabulary}
\usepackage{booktabs}
\usepackage{threeparttablex}
\renewcommand{\arraystretch}{1.2}
\newcolumntype{P}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
```

### [Globally change table font size](https://tex.stackexchange.com/a/220258/140109)

```latex
\let\oldtabular\tabular
\renewcommand{\tabular}{\footnotesize\oldtabular}
```

### Bibliography package

```latex
\usepackage[backend=biber,style=ieee,uniquename=init,giveninits,urldate=long]{biblatex}
```

### Ensuring bibliography respects margins and [fix `underfull \hbox` warnings](https://tex.stackexchange.com/a/10928/140109)

```latex
\appto{\bibsetup}{\sloppy}
\usepackage{etoolbox}
\apptocmd{\sloppy}{\hbadness 10000\relax}{}{}
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

[TeXcount](http://ctan.uib.no/support/texcount/doc/TeXcount.pdf) package documentation.

[Ignore sections or inputs of a document when calculating the number of words using TeXcount](https://tex.stackexchange.com/a/259296/140109):

```latex
% regions between TC:ignore and TC:endignore will be ignored from word count
%TC:ignore
\appendix
And now for something completely different
%TC:endignore
```

## Beamer class

### Themes and colours

- [Beamer theme gallery](http://deic.uab.es/~iblanes/beamer_gallery/index.html)
- [Beamer docs](https://ctan.org/pkg/beamer)
- [Beamer template tutorial by Claudio Fiandrino](https://tex.stackexchange.com/a/146682/140109)
- [Overleaf Beamer guide](https://www.overleaf.com/learn/latex/Beamer)
- [set colours for sections and subsections in table of contents](https://tex.stackexchange.com/a/69721/140109)

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

### Change date format to DD/MM/YYYY

```latex
\usepackage[UKenglish]{babel}
\usepackage[ddmmyyyy]{datetime} % set date format
```

### Bibliography

- [bibliography icon](https://tex.stackexchange.com/a/68084/140109)
- [supress patching footnotes failed warning](https://tex.stackexchange.com/a/202994/140109)
- [numerical references](https://tex.stackexchange.com/a/68081/140109)
- [change font size](https://tex.stackexchange.com/a/205447/140109)

```latex
\usepackage[style=ieee,urldate=long]{biblatex}
\usepackage{silence} % suppress warning below
\WarningFilter{biblatex}{Patching footnotes failed}
\setbeamertemplate{bibliography item}[text] % show numerical reference
\AtBeginBibliography{\tiny} % change font size
```

- [beamer references](https://en.wikibooks.org/wiki/LaTeX/Presentations#References_(Beamer))
- references which are not cited in the slides using `\nocite{bibid}`

```latex
\begin{frame}[noframenumbering,plain,allowframebreaks]{References}
\nocite{vangennep:related,ctan}
\printbibliography
\end{frame}
```

### [Adjust title page vertical spacing](https://tex.stackexchange.com/a/255335/140109)

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

### [Frame title formatting](https://tex.stackexchange.com/a/306416/140109)

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

### [Frame margins](https://tex.stackexchange.com/a/109984/140109)

```latex
\setbeamertemplate{footline}{%
    \vspace{.4cm}
}
```

### Remove navigation symbols

```latex
\setbeamertemplate{navigation symbols}{}
```

### [Change position of navigation symbols](https://tex.stackexchange.com/a/35637/140109)

```latex
\hskip1em\usebeamercolor[fg]{navigation symbols dimmed}%
    \insertslidenavigationsymbol%
    \insertframenavigationsymbol% %
    \insertsectionnavigationsymbol%
    \insertsubsectionnavigationsymbol%
    \insertdocnavigationsymbol%
    \insertbackfindforwardnavigationsymbol
```

### Sectioning

- sections can be created in order to organize your presentation into discrete blocks, all sections and subsections are automatically printed in the table of contents as an overview of the talk
- a subsection can be created just before a set of slides with a common theme to further break down your presentation into chunks

```latex
\section{First Section}
\subsection{Subsection Example}
\begin{frame}{Table of Contents}
\tableofcontents[currentsection]
```

## ModernCV

***Note: This package has not been updated since 2016***

### Known issues

- main `.tex` file: Some font shapes were not available, defaults substituted
- `fontenc.sty`: Font shape 'TU/qpl/m/n' undefined \ (Font) using 'TU/lmr/m/n' instead
- `moderncvbodyiii.sty`: You have requested package 'moderncvbodyiii', but the package provides 'moderncvbodyiii'.
- `moderncvheadiii.sty`: You have requested package 'moderncvheadiii', but the package provides 'moderncvheadiii'.

### [Extending a quote's width](https://tex.stackexchange.com/a/247503/140109)

```latex
% preamble
\let\originalrecomputecvlengths\recomputecvlengths
\renewcommand*{\recomputecvlengths}{%
\originalrecomputecvlengths%
\setlength{\quotewidth}{.8\textwidth}} % change .8 to desired value
```

### [Edit space after header](https://tex.stackexchange.com/a/82871/140109)

```latex
\makecvtitle
\vspace*{-5mm} % enter right after \makecvtitle
```

### [Reduce signature whitespace](https://tex.stackexchange.com/a/196910/140109)

```latex
% preamble
\patchcmd{\makeletterclosing}{[3em]}{[1em]}{}{}
```
