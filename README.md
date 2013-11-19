About
=====

Unoffical LaTeX template for Master, Bachelor, Diploma, and Student Theses at the University of Stuttgart, Computer Science.

More information at https://github.com/latextemplates/USTUTT-computer-science.

It originates from the studiforge server at https://vorlagen.studiforge.informatik.uni-stuttgart.de/trac/

Characteristics
---------------
* UTF-8
* pdflatex
* Depends on bibtex (and not to biblatex yet)

This template runs at Windows using the current [MiKTeX](http://www.miktex.org) distribution. Linux should work without any issues. In some cases, `make fetchstys` might be necessary to fetch required `.sty` files.

Using with your git repository
==============================

Initialization
--------------
This howto assumes that you have not a git repository for your thesis.
If you have, just add https://github.com/latextemplates/USTUTT-computer-science.git as upstream and merge the branch "template" into your "master" branch.

1. Open command line
1. git clone https://github.com/latextemplates/USTUTT-computer-science.git
1. cd USTUTT-computer-science
1. git remote rename origin github
1. git checkout -b master
1. git submodule init
1. git submodule update

Now, you are on the master branch, where you can write your thesis and push it to your (remote) origin repository, in case you have one.

Merging updates from the template
---------------------------------
If you want to merge updates from github, do the following:

1. git fetch github
1. git merge github/template
1. git submodule update

LaTeX compilation
=================
The template is compiled using normal LaTeX commands.

If you want to include .svg graphics, inkscape has to be in your path.

Usual LaTeX run
---------------

    pdflatex ausarbeitung
    bibtex ausarbeitung
    pdflatex ausarbeitung
    pdflatex ausarbeitung

Automatic compilation using make
--------------------------------

    make


Automatic compilation using texify
----------------------------------
 
    texify -p ausarbeitung.tex

Automatic compilation using latexmk
-----------------------------------

    latexmk -pdf ausarbeitung

Continuous previewing using latexmk
-----------------------------------

    latexmk -pvc -pdf ausarbeitung

This will open Acrobat Reader once. Close it and start a PDF reader supporting instant reload of PDFs. We recommend [Sumatra PDF](http://blog.kowalczyk.info/software/sumatrapdf/free-pdf-reader-de.html).


Make targets
============

For those, who have [cygwin](http://www.cygwin.com/) installed or run a linux machine, this template offers a simple LaTeX makefile. It is not so sophisticated as other projects, but does its job

pdf (default)
-------------

Generates ausarbeitung.pdf

aspell
------

Checks all files using aspell.

dokumentationen
---------------

Fetches PDFs for important included LaTeX packages.

clean
-----

Removes all temporary files.

mrproper
--------

Cleans up and removes also editor backup files.

stand
-----

Creates a new PDF with the current status of the thesis.

view
----

Opens the configured viewer

6
-

Generates a 3x2 postscriptfile using psnup.

Alternatives
------------

* http://code.google.com/p/latex-makefile/
* https://github.com/ransford/pdflatex-makefile
* https://github.com/brotchie/latex-rubber-makefile
* See http://stackoverflow.com/questions/1240037/recommended-build-system-for-latex
* Current favorite: [LaTeX-Mk](http://latex-mk.sourceforge.net/).

Tweaks
======

Switching to English
--------------------

The template has been built primarily for German documents. English documents, however, are also very welcome.

Two steps to switch to English typesetting:

1. `ausarbeitung.tex`: Right on top: remove the `%` before `pointlessnumbers` (line 17)
1. `ausarbeitung.tex`: Exchange commands `\ifdeutsch` and `\ifenglisch`. (Lines 23,23 <-> 27,28).
1. `preambel/packages_and_options.tex` at `usepackage` of `uni-stuttgart-cs-cover`: disabled `language=german` and enable `language=english`. (Lines 448 and 449)
1. Cleanup everything (e.g., `make clean`). Otherwise pdflatex will complain because of `ngerman`.

Change Appearance of Chapter Headings
-------------------------------------

Edit `preambel/chapterheads.tex`.

Final version
-------------

  - If you included some version control statements, please remove them. Currently, the template does not support any, but it used to support SVN.
  - By using `\largeparge` and `\shortpage`, single lines at the bottom or at the top of the page can be manually fixed.
  - Search the PDF for "TODO" or similar things. Remove `\usepackage{todonotes}` in `preambel/packages_and_options`.
  - Ensure that you run `pdflatex` at least three times and that there no "undefined references".
  - The margins are intended for a duplex printing. **Do not change them** (or do exactly know what you are doing).

Further Reading
---------------

See http://wiki.flupp.de/LaTeX


# Contained Files and Directories

## Main directory

### ausarbeitung.tex
* Main file
* New chapters are added by using `\input`
* Adjust title etc. here


### Makefile

The Makefile.

### README.md

This file.

## Diplomtitle

### diplomtitle/diplomtitel.sty

Style file for the cover sheet of the document.

## Bibliography

### bibliography/literatur.bib

Bibliography. BibTex format. Manage it with [JabRef](http://jabref.sf.net) or similar BibTeX tooling.

### bibliography/IAAS.bst

BibTeX style file for English bibliographies. Possibly, it can be used for German bibliographies, too.

### bibliography/IAAS.dbj

Source for generating `IAAS.bst` (`latex IAAS.dbj`, requires custombib)

## content/

Place for the actual content

### content/einleitung.tex

First chapter: The introduction

### content/kapitel2.tex

Second chapter

### content/zusammenfassung`_`und`_`ausblick.tex

Conclusion and outlook.

### content/anhang.tex

Appendix

## graphics/

Directory containing the figures.

By using PDFLaTeX it is possible to use PDFs, JPGs, PNGs, ... We recommend to use PDFs to enable smooth scaling.

## macros/ 

Directory for macros.

### macros/commands.tex

Sample macros

## preambel/

Latex header of the document ("preambel" in latex)

### preambel/chapterheads.tex

Definition for the chapter headings.

### preambel/fonts.tex

Font selection

### preambel/margins.tex

Margin settings

Einstellung der Seitenränder

### preambel/packages`_`and`_`options.tex

Includes required packages and their options.

### preambel/pagestyle.tex

Defines the head and the foot of a page.