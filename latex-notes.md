# LaTeX notes

My LaTeX documents are compiled using [latexmk](https://ctan.org/pkg/latexmk) on [Visual Studio Code](https://code.visualstudio.com/) with [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) and [texlive](https://tug.org/texlive/).

## Book / article / report document class

### Compilation

PdfLaTeX > Makeglossaries > Biber > PdfLaTeX > PdfLaTeX

### Preamble 

[Avoid overfulls in right margin](https://tex.stackexchange.com/a/391321/140109): 

```latex
\emergencystretch 3em 
```

[Remove blank pages after chapters](https://tex.stackexchange.com/a/334126/140109):

```
\documentclass[11pt,openany]{book}
\let\cleardoublepage=\clearpage
```

Change title of contents:

```
\usepackage[UKenglish]{babel} % UK English language
\addto\captionsUKenglish{\renewcommand\contentsname{Table of Contents}} % specify new title
```

Listings:

```
\usepackage{listings}
\renewcommand{\lstlistlistingname}{List of Listings} % add/rename title of list of listings
```

Sans serif headings with serif body and math:

* [Font catalogue](http://www.tug.dk/FontCatalogue/)

```
\usepackage{lmodern} % latin modern 	
\usepackage{mathpazo} % mathpazo font for body + math
\usepackage{sectsty} % for setting section headings to sans serif
\allsectionsfont{\raggedright\normalfont\sffamily\bfseries} % ^ bold + sans serif section headings; aligned left
```

[Adding lists to the table of contents](https://ctan.org/pkg/tocbibind):

```
\usepackage[nottoc,notbib]{tocbibind}
```

[Defining custom HTML colours](https://htmlcolorcodes.com/color-names/):

```
\definecolor{EnsystraGreen}{HTML}{00CD98}
```

Hyperlink and pdf metadata:

* use hidelinks to remove hyperlink borders
* https://ctan.org/pkg/hyperxmp
* [format hyperlink colours](https://www.overleaf.com/learn/latex/hyperlinks)

```
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
Rename "Chapter X" to "Part X":

```
\addto\captionsUKenglish{\renewcommand{\chaptername}{Part}} % specify new name
```

Caption font:

```
\usepackage[font=small,labelfont=bf]{caption} 
```

Force table captions to top of the table:

```
\usepackage{floatrow}  
\floatsetup[table]{capposition=top}
```

Header and footer settings using `fancyhdr`:

* https://tex.stackexchange.com/a/97442/140109
* [remove horizontal line from header](https://tex.stackexchange.com/a/13897/140109)
* https://www.overleaf.com/learn/latex/Headers_and_footers 
* https://tex.stackexchange.com/a/121808/140109
* https://tex.stackexchange.com/a/340126/140109

```
\usepackage{fancyhdr} 
\pagestyle{fancy}
\fancypagestyle{plain}{
	\fancyhf{}
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

[Float placeins within subsections](https://tex.stackexchange.com/a/118667/140109):

```
\usepackage[section]{placeins} 
\makeatletter
\AtBeginDocument{%
	\expandafter\renewcommand\expandafter\subsection\expandafter{%
		\expandafter\@fb@secFB\subsection
	}
}
\makeatother
```

Tables:

* ["ThreePartTable" environment](https://tex.stackexchange.com/a/209851/140109)
* [More space between rows](https://www.inf.ethz.ch/personal/markusp/teaching/guides/guide-tables.pdf)
* [Set table content to align left; for removing underfull hbox warning in table](https://tex.stackexchange.com/a/275310/140109)

```
\usepackage{longtable,tabulary}  
\usepackage{booktabs} 
\usepackage{threeparttablex}
\renewcommand{\arraystretch}{1.2}
\newcolumntype{P}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}} 
```

[Images path](https://www.overleaf.com/learn/latex/How_to_Write_a_Thesis_in_LaTeX_(Part_1):_Basic_Structure):

```
\usepackage{graphicx}
\graphicspath{ {images/} }
```

Bibliography package:

```
\usepackage[backend=biber,style=ieee,uniquename=init,giveninits,urldate=long]{biblatex}
```

To remove empty parentheses if year not provided for `@online`:

```
\usepackage{xpatch} 
\xpatchbibdriver{online}
{\printtext[parens]{\usebibmacro{date}}}
{\iffieldundef{year}{}{\printtext[parens]{\usebibmacro{date}}}}
{}{} 
```

Prioritising DOI or eprint over URL, if present:

* if DOI is not present, print eprint; if eprint is not present, print URL

```
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

Ensuring bibliography respects margins and [fix `underfull \hbox` warnings](https://tex.stackexchange.com/a/10928/140109):

```
\appto{\bibsetup}{\sloppy} 
\usepackage{etoolbox}
\apptocmd{\sloppy}{\hbadness 10000\relax}{}{} 
```

% removes unwanted fields for all reference types, except `@misc`

```
\AtEveryBibitem{%
	\ifboolexpr{not (test {\ifentrytype{misc}})}%
	{\clearfield{issn}}{}
}
```

[Remap `@software` entries to `@online`](https://tex.stackexchange.com/a/325255/140109)

```
\DeclareBibliographyAlias{software}{online}
```

List of abbreviations:

```
\usepackage[acronym,nomain,nonumberlist,nopostdot,nogroupskip,automake,toc]{glossaries} 
\setglossarystyle{index}
\makeglossaries 
```