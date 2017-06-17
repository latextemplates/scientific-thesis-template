[![Build Status](https://travis-ci.org/latextemplates/uni-stuttgart-computer-science-template.svg?branch=template)](https://travis-ci.org/latextemplates/uni-stuttgart-computer-science-template)

# LaTeX Template for Scientific Theses

This template is a general template for scientific theses.
Currently, it is the unoffical LaTeX template for Master, Bachelor, Diploma, and Student Theses at the University of Stuttgart, Computer Science.
It will be extended to support theses from different universities.

More information at <https://github.com/latextemplates/scientific-thesis-template>.

## Characteristics of the template

* UTF-8
* pdflatex
* [latexmk] - Reasoning available at <https://tex.stackexchange.com/a/249243/9075>.
* [biblatex]+[biber] instead of plain [bibtex]
* Most recent packages and package configuration based on long-time experience
* Open for contributions

Even though AuToLaTeX is [more powerful than latexmk](http://www.arakhne.org/autolatex/), it is [not included in MiKTeX](http://www.ctan.org/pkg/autolatex) and therefore it is not used here.

## Quick start

If you don't want to use git, just download https://github.com/latextemplates/scientific-thesis-template/archive/template.zip

## Recommended LaTeX environments

* offline: Grammar and spell checking is available at [TeXstudio].
  Please download [LanguageTool] and [configure TeXstudio to use it](http://wiki.languagetool.org/checking-la-tex-with-languagetool#toc4).
  Note that it is enough to point to `languagetool.jar`.
  Use [JabRef] to manage your bibliography.
  Quick installation using [Chocolatey]: `choco install texstudio languagetool jabref`
* online: [overleaf]. Also with [git support](https://www.overleaf.com/blog/195-new-collaborate-online-and-offline-with-overleaf-and-git-beta#.VYFC2UZejkU).

See [LaTeX Editors/IDEs question on TeX.SX](http://tex.stackexchange.com/questions/339/latex-editors-ides) for a complete list of LaTeX editors.

## Trouble shooting

* biber/biblatex too old -> see installation hints of how to update them at different systems
* `! pdfTeX error (font expansion): auto expansion is only possible with scalable fonts.` -> Install the `cm-super` package using the MiKTeX package manager. Then, run `initexmf --mkmaps` on the command line. (Long description: http://tex.stackexchange.com/a/324972/9075)

## Installation hints for Ubuntu

Ubuntu currently [ships biber 2.4](https://bugs.launchpad.net/ubuntu/+source/biber/+bug/1589644), so you have to upgrade your texlive distribution.
The easiest way is to uninstall the ubuntu package and use [install-tl-ubuntu](https://github.com/scottkosty/install-tl-ubuntu).
Then, you can follow the instructions given at http://tex.stackexchange.com/a/55459/9075 to update your tex live distribution.
If you do not want to have an updated installation, but fiddle around with dirty patching your installation, please follow  http://tex.stackexchange.com/questions/84624/how-to-upgrade-biblatex-properly.

## Installation hints for Windows

* The default installation of MiKTeX ships with incompatible biblatex and biber packages. You have to keep your MiKTeX up to date. In case you followed the linked installation steps, you only have to run "Update MiKTeX". If you installed MiKTeX other ways, you have to run "Update MiKTeX (Admin)" and "Update MiKTeX" and check in both tools for updates (see http://tex.stackexchange.com/a/108490/9075)
* Install other tools using [chocolatey]: `choco install texstudio sumatrapdf.install latexmk strawberryperl jabref languagetool jre8`. This allows you to run `choco upgrade all` to keep the software updated.
* Ensure that in the "MiKTeX Package Manager" "biber" and "biblatex-lni" are installed

### Recommended setup of MiKTeX
* Download the basic installer from http://miktex.org/download
* Start it
* First screen: Read the license condiditions and be sure that you really agree.
* Second screen: "Shared Installation": Install MiKTeX for: "Only for: `username`"
* Third screen: "Installation Directory": Install MiKTeX to: `C:\MiKTeX`. This enabled browsing for documentation at `C:\MiKTeX29\doc\latex`
* Fourth screen: "Settings": Preferred paper: A4 and Install missing packages on the fly: `Yes`
* Fifth screen: Press "Start"
* After the installation:
  1. Open `cmd.exe`
  2. Execute `mpm --update-db`
  3. Execute `mpm --update`
  4. Execute `mpm --install=cm-super`
  5. Execute `initexmf --update-fndb`

## Using with your own git repository

### Initialization

This howto assumes that you have not a git repository for your thesis.
If you have, just add https://github.com/latextemplates/scientific-thesis-template.git as upstream and merge the branch "template" into your "master" branch.

1. Open command line
1. Change to the directory where you want to have your main tex file.
1. Fetch the template from github: `git clone https://github.com/latextemplates/scientific-thesis-template.git .`
1. Rename `origin` to `github` to enable adding your own `origin` repository: `git remote rename origin github`
1. Create a new branch master starting from the latest commit in the `template` branch: `git checkout -b master`

Now, you are on the `master` branch, where you can write your thesis and push it to your (remote) `origin` repository, in case you have one.

### Merging updates from the template

If you want to merge updates from github, do the following:

1. git fetch github
1. git merge github/template


## LaTeX compilation

The template is compiled using normal LaTeX commands.
Your LaTeX environment (such as [TeXStudio]) should take care about the compilation transparently.
When the "Package Installation" dialog pops up at TeXStudio, choose your username at "The package will be installed for:" and uncheck "Always show this dialog before installing packages."
If you want to include .svg graphics, [inkscape] has to be in your path.

If you want to compile using the command line, you can use following tools.

### Automatic compilation using latexmk

    latexmk ausarbeitung

### Continuous previewing using latexmk

    latexmk -pvc ausarbeitung

This will open a [Sumatra PDF] and only works with the supplied configuration.

### latexmk configuration

This repository ships a `.latexmk` which is read by latexmk.
It is configured for Windows and especially sets Sumatra PDF as default PDF viewer.
You can make this local configuration a global configuration, when you put it at [the right place](http://tex.stackexchange.com/a/41149/9075).

If you want to add more packages, configure it there.
For instance, for support of makeglossaries see http://tex.stackexchange.com/questions/1226/how-to-make-latexmk-use-makeglossaries.

## FAQ

### Q: How do I switch to English?

The template has been built primarily for German documents. English documents, however, are also very welcome.

Five steps to switch to English typesetting:

1. `ausarbeitung.tex`: Exchange commands `\ifdeutsch` and `\ifenglisch`. (Lines 11,12 <-> 15,16).
1. Cleanup everything (e.g., `latexmk -c ausarbeitung`). Otherwise pdflatex will complain because of `ngerman`.

### Q: How do I change the appearance of chapter headings?

Edit `preambel/chapterheads.tex`.

### Q: Do I have to do something special for the final version?

  - If you included some version control statements, please remove them. Currently, the template does not support any, but it used to support SVN.
  - By using `\largepage` and `\shortpage`, single lines at the bottom or at the top of the page can be manually fixed.
  - Search the PDF for "TODO" or similar things. Remove `\usepackage{todonotes}` in `preambel/packages_and_options`.
  - Ensure that you run `pdflatex` at least three times and that there are no "undefined references".
  - The margins are intended for a duplex printing. **Do not change them** (or do exactly know what you are doing).

### Q: I want to use make instead of latexmk

For those, who have [cygwin](http://www.cygwin.com/) installed or run a linux machine, this template offers a simple LaTeX makefile.
It is not as sophisticated as other projects, but does its job.

    make

Make targets:
 * `pdf` (default): Generates ausarbeitung.pdf
 * `aspell`: Checks all files using aspell.
 * `clean`: Removes all temporary files.
 * `mrproper`: Cleans up and removes also editor backup files.
 * `stand`: Creates a new PDF with the current status of the thesis.
 * `view`: Opens the configured viewer
 * `6`: Generates a 3x2 postscriptfile using psnup.

### Q: Are there any other alternatives to latexmk and make?

* https://github.com/akerbos/ltx2any
* https://github.com/shiblon/latex-makefile
* https://github.com/ransford/pdflatex-makefile
* https://github.com/brotchie/latex-rubber-makefile
* [LaTeX-Mk](http://latex-mk.sourceforge.net/)
* See also [Recommended build system for latex?](https://stackoverflow.com/q/1240037/873282) and [How to properly 'make' a latex project?](https://tex.stackexchange.com/q/40738/9075)

### Q: Is there any other place to look for further information?

See <http://wiki.flupp.de/LaTeX>.


## Contained Files and Directories

* ausarbeitung.tex
  * Main file
  * New chapters are added by using `\input`
  * Adjust title etc. here
* Makefile: The Makefile.
* README.md: This file.
* uni-stuttgart-cs-cover.sty: Verbatim copy of uni-stuttgart-cs-cover.sty available at https://github.com/latextemplates/uni-stuttgart-computer-science-cover
* `bibliography.bib`. Bibliography. [biblatex] format. Manage it with [JabRef].
* content/: Place for the actual content
  * content/einleitung.tex: First chapter: The introduction
  * content/kapitel2.tex: Second chapter
  * content/zusammenfassung`_`und`_`ausblick.tex: Conclusion and outlook.
  * content/anhang.tex
* graphics/: Directory containing the figures.
  By using PDFLaTeX it is possible to use PDFs, JPGs, PNGs, ... We recommend to use PDFs to enable smooth scaling.
* macros/: Directory for macros.
  * macros/commands.tex: Example macros
* preambel/: Latex header of the document ("preambel" in latex)
  * preambel/chapterheads.tex: Definition for the chapter headings.
  * preambel/fonts.tex: Font selection
  * preambel/margins.tex: Margin settings / Einstellung der Seitenränder
  * preambel/packages`_`and`_`options.tex: Includes required packages and their options.
  * preambel/pagestyle.tex: Defines the head and the foot of a page.

 [biber]: https://www.ctan.org/pkg/biber
 [biblatex]: http://tex.stackexchange.com/tags/biblatex/info
 [bibtex]: https://www.ctan.org/pkg/bibtex
 [inkscape]: http://inkscape.org/
 [chocolatey]: https://chocolatey.org/
 [JabRef]: https://www.jabref.org
 [LanguageTool]: https://languagetool.org/
 [latexmk]: http://tex.stackexchange.com/tags/latexmk/info
 [overleaf]: https://www.overleaf.com/
 [Sumatra PDF]: http://blog.kowalczyk.info/software/sumatrapdf/free-pdf-reader-de.html
 [TeXstudio]: http://texstudio.sourceforge.net/
