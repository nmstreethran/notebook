# Document conversion notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Ghostscript](#ghostscript)
  - [Compressing PDF files to reduce their size](#compressing-pdf-files-to-reduce-their-size)
  - [Merging PDF files and generating bookmarks](#merging-pdf-files-and-generating-bookmarks)
- [Poppler](#poppler)
  - [Merging PDF files](#merging-pdf-files)
  - [Separating PDF files](#separating-pdf-files)
  - [Convert PDF to image](#convert-pdf-to-image)

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

See Adobe's [pdfmark reference](https://opensource.adobe.com/dc-acrobat-sdk-docs/acrobatsdk/pdfs/acrobatsdk_pdfmark.pdf) for more information.

Source:

- <https://ubuntuforums.org/showthread.php?t=1545064>
- <http://physics.drexel.edu/~wking/unfolding-disasters-old/posts/PDF_bookmarks_with_Ghostscript/>

## Poppler

Source: <https://ostechnix.com/how-to-merge-pdf-files-in-command-line-on-linux/>

Installing in Ubuntu:

```sh
sudo apt-get install poppler-utils
```

### Merging PDF files

This method preserves hyperlinks.

```sh
pdfunite file1.pdf file2.pdf file3.pdf outputfile.pdf
```

### Separating PDF files

Separating individual pages of a PDF file.

```sh
pdfseparate -f x -l y inputfile.pdf output_%d.pdf
```

Replace `x` and `y` with the numbers of the first and last page to extract, respectively. `-f` and `-l` can be omitted, which causes the extraction to start with the first and end with the last page of the document, respectively. The `%d` in the output files will be replaced by the page number.

Source: <http://linux-commands-examples.com/pdfseparate>

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
