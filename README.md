# LaTeX Template for Scientific Theses [![Build Status](https://circleci.com/gh/latextemplates/scientific-thesis-template/tree/master.svg?style=shield)](https://circleci.com/gh/latextemplates/scientific-thesis-template/)

This template is a general template for scientific theses.
Currently, it is the unofficial LaTeX template for Master, Bachelor, Diploma, and Student Theses at following institutions:

  - University of Stuttgart, Computer Science.
    [[example-english](https://latextemplates.github.io/scientific-thesis-template/main-english.pdf)],
    [[example-german](https://latextemplates.github.io/scientific-thesis-template/main-german.pdf)],
    [[example-minted-german](https://latextemplates.github.io/scientific-thesis-template/main-minted-german.pdf)]
  - Paderborn University, Computer Science. - To be confirmed.
    [[example-english](https://latextemplates.github.io/scientific-thesis-template/main-paderborn-english.pdf)]
    [[example-german](https://latextemplates.github.io/scientific-thesis-template/main-paderborn-german.pdf)]

It will be extended to support theses from different institutions.

This file (`README.md`) of the template is also rendered at <https://latextemplates.github.io/scientific-thesis-template/>.
For [architectural decision records](https://adr.github.io) see [docs/adr](https://latextemplates.github.io/scientific-thesis-template/adr/).

<!-- toc -->

- [Characteristics of the template](#characteristics-of-the-template)
- [Quick start](#quick-start)
  * [Download](#download)
  * [Usage at overleaf](#usage-at-overleaf)
  * [Usage using plain git](#usage-using-plain-git)
- [Recommended LaTeX environments](#recommended-latex-environments)
- [Installation hints for Ubuntu](#installation-hints-for-ubuntu)
- [Installation hints for Windows](#installation-hints-for-windows)
  * [Recommended setup of MiKTeX](#recommended-setup-of-miktex)
- [LaTeX compilation](#latex-compilation)
  * [Automatic compilation using latexmk](#automatic-compilation-using-latexmk)
  * [Continuous previewing using latexmk](#continuous-previewing-using-latexmk)
  * [latexmk configuration](#latexmk-configuration)
- [FAQ](#faq)
  * [Q: There is an output that biber/biblatex too old](#q-there-is-an-output-that-biberbiblatex-too-old)
  * [Q: My Paderborn title page is strange. The boxes seem to be located arbitrarily.](#q-my-paderborn-title-page-is-strange-the-boxes-seem-to-be-located-arbitrarily)
  * [Q: I get the error `! pdfTeX error (font expansion): auto expansion is only possible with scalable fonts.`](#q-i-get-the-error---pdftex-error-font-expansion-auto-expansion-is-only-possible-with-scalable-fonts)
  * [Q: How do I change the appearance of chapter headings?](#q-how-do-i-change-the-appearance-of-chapter-headings)
  * [Q: Do I have to do something special for the final version?](#q-do-i-have-to-do-something-special-for-the-final-version)
  * [Q: I want to use make instead of latexmk](#q-i-want-to-use-make-instead-of-latexmk)
  * [Q: Are there any other alternatives to latexmk and make?](#q-are-there-any-other-alternatives-to-latexmk-and-make)
  * [Q: I want to use minted as its syntax highlighting seems to be better](#q-i-want-to-use-minted-as-its-syntax-highlighting-seems-to-be-better)
  * [Q: Is there any other place to look for further information?](#q-is-there-any-other-place-to-look-for-further-information)
  * [Q: I was recommended the Harvard style](#q-i-was-recommended-the-harvard-style)
  * [Q: Aren't there other templates?](#q-arent-there-other-templates)
- [Contained Files and Directories](#contained-files-and-directories)
  * [Directories](#directories)
  * [Files](#files)
- [License](#license)
  * [Exceptions](#exceptions)

<!-- tocstop -->

## Characteristics of the template

* UTF-8
* pdflatex
* [latexmk] - Reasoning available at <https://tex.stackexchange.com/a/249243/9075>.
* [biblatex]+[biber] instead of plain [bibtex], because biblatex fully supports UTF-8 and commands such as `\citeauthor{...}` work out of the box. See also <https://tex.stackexchange.com/q/8411/9075>.
* Optional: Render listings using [minted](https://github.com/gpoore/minted/), which provides better output than [listings](https://ctan.org/pkg/listings), but requires [pygments](http://pygments.org/) to be installed.
* Most recent packages and package configuration based on long-time experience
* Open for contributions

Even though AuToLaTeX is [more powerful than latexmk](http://www.arakhne.org/autolatex/), it is [not included in MiKTeX](http://www.ctan.org/pkg/autolatex) and therefore it is not used here.

## Quick start

### Download

1. Go to the latest release via <https://github.com/latextemplates/scientific-thesis-template/releases/latest>.
2. Download the file `source.zip`
3. Extract `source.zip` to the directory you want to work. E.g., `c:\users\user\documents\thesis`.
4. Start texing at `main-english.tex` or `main-german.tex`.
5. Users of Paderborn University: Adapt `logos/UBP-background-picture.pdf` to your needs. It has the format 20cm x 10cm.

### Usage at overleaf

See [overleaf](overleaf.md).

### Usage using plain git

We do not recommend to fork this project as a fork denotes that you work on improving the template itself.
Thus, just create a new git repository and populate it using the files provided at <https://github.com/latextemplates/scientific-thesis-template/archive/master.zip>


## Recommended LaTeX environments

* offline: Grammar and spell checking is available at [TeXstudio].
  Please download [LanguageTool] and [configure TeXstudio to use it](http://wiki.languagetool.org/checking-la-tex-with-languagetool#toc4).
  Note that it is enough to point to `languagetool.jar`.
  Use [JabRef] to manage your bibliography.
  Quick installation using [Chocolatey]: `choco install texstudio languagetool jabref`.
  A comparison to other literature management software is available at <https://ultimate-comparisons.github.io/ultimate-reference-management-software-comparison/>.
* online: [overleaf]. Also with [git support](https://www.overleaf.com/blog/195-new-collaborate-online-and-offline-with-overleaf-and-git-beta#.VYFC2UZejkU).

See [LaTeX Editors/IDEs question on TeX.SX](http://tex.stackexchange.com/questions/339/latex-editors-ides) for a complete list of LaTeX editors.

## Installation hints for Ubuntu

From Ubuntu 17.04 onwards, this template works without issues.

Ubuntu 16.04 [ships biber 2.4](https://bugs.launchpad.net/ubuntu/+source/biber/+bug/1589644), so you have to upgrade your texlive distribution.
The easiest way is to uninstall the ubuntu package and use [install-tl-ubuntu](https://github.com/scottkosty/install-tl-ubuntu).
Then, you can follow the instructions given at <http://tex.stackexchange.com/a/55459/9075> to update your texlive distribution.
If you do not want to have an updated installation, but fiddle around with dirty patching your installation, please follow  <http://tex.stackexchange.com/questions/84624/how-to-upgrade-biblatex-properly>.

## Installation hints for Windows

* The default installation of MiKTeX ships with incompatible biblatex and biber packages.
  You have to keep your MiKTeX up to date.
  In case you followed the linked installation steps, you only have to run "Update MiKTeX".
  If you installed MiKTeX other ways, you have to run "Update MiKTeX (Admin)" and "Update MiKTeX" and check in both tools for updates (see <http://tex.stackexchange.com/a/108490/9075>).
* Install other tools using [chocolatey]:
  `choco install texstudio sumatrapdf.install latexmk strawberryperl jabref languagetool jre8`.
  This allows you to run `choco upgrade all` to keep the software updated.
* Ensure that in the "MiKTeX Package Manager" "biber" and "biblatex-lni" are installed

### Recommended setup of MiKTeX

* Download the basic installer from <http://miktex.org/download>
* Start it
* First screen: Read the license conditions and be sure that you really agree.
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
  6. Execute `initexmf --mklinks --force`


## LaTeX compilation

The template is compiled using normal LaTeX commands.
Your LaTeX environment (such as [TeXStudio]) should take care about the compilation transparently.
When the "Package Installation" dialog pops up at TeXStudio, choose your username at "The package will be installed for:" and uncheck "Always show this dialog before installing packages."
If you want to include .svg graphics, [inkscape] has to be in your path.

If you want to compile using the command line, you can use following tools.

### Automatic compilation using latexmk

    latexmk main-german

### Continuous previewing using latexmk

    latexmk -pvc main-german

This will open a [Sumatra PDF] and only works with the supplied configuration.

### latexmk configuration

This repository ships a `.latexmk` which is read by latexmk.
It is configured for Windows and especially sets Sumatra PDF as default PDF viewer.
You can make this local configuration a global configuration, when you put it at [the right place](http://tex.stackexchange.com/a/41149/9075).

If you want to add more packages, configure it there.
For instance, for support of makeglossaries see <http://tex.stackexchange.com/questions/1226/how-to-make-latexmk-use-makeglossaries>.

## FAQ

### Q: There is an output that biber/biblatex too old

See installation hints of how to update them at different systems.


### Q: My Paderborn title page is strange. The boxes seem to be located arbitrarily.

Just run pdflatex again.


### Q: I get the error  `! pdfTeX error (font expansion): auto expansion is only possible with scalable fonts.`

Install the `cm-super` package using the MiKTeX package manager. Then, run `initexmf --mkmaps` on the command line. (Long description: http://tex.stackexchange.com/a/324972/9075)


### Q: How do I change the appearance of chapter headings?

Edit `preambel/chapterheads.tex`.


### Q: Do I have to do something special for the final version?

  - If you included some version control statements, please remove them. Currently, the template does not support any, but it used to support SVN.
  - By using `\largepage` and `\shortpage`, single lines at the bottom or at the top of the page can be manually fixed.
  - Search the PDF for "TODO" or similar things. Remove `\usepackage{todonotes}` in `config.tex`.
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

* <https://github.com/akerbos/ltx2any>
* <https://github.com/shiblon/latex-makefile>
* <https://github.com/ransford/pdflatex-makefile>
* <https://github.com/brotchie/latex-rubber-makefile>
* [LaTeX-Mk](http://latex-mk.sourceforge.net/)
* See also [Recommended build system for latex?](https://stackoverflow.com/q/1240037/873282) and [How to properly 'make' a latex project?](https://tex.stackexchange.com/q/40738/9075)


### Q: I want to use minted as its syntax highlighting seems to be better

1. Install python and [pygments](http://pygments.org/):
  - `choco install python`
  - `pip install pygments`
1. Start with `main-minted-german.tex`
2. Use `-shell-escape` when texing: `pdflatex -shell-escape main-minted-german.tex`


### Q: Is there any other place to look for further information?

For German users, go to <http://texfragen.de/>.


### Q: I was recommended the Harvard style

This template uses the alphabetic style.
That style is explained at the [biblatex documentation](http://texdoc.net/texmf-dist/doc/latex/biblatex/biblatex.pdf) on page 60:

> The alphabetic labels resemble a compact author-year
> style to some extent, but the way they are employed is similar to a numeric citation
> scheme. For example, instead of “Jones 1995” this style would use the label “[Jon95]”.
> “Jones and Williams 1986” would be rendered as “[JW86]”.

We are aware that the University of Stuttgart [recommends to use the Hardvard style](https://ilias3.uni-stuttgart.de/ilias.php?ref_id=12257&from_page=11895&obj_id=11896&cmd=layout&cmdClass=illmpresentationgui&cmdNode=dn&baseClass=ilLMPresentationGUI).
However, this style is not common in natural sciences and information science.


### Q: How can I reformat my .tex files?

Execute `latexindent -l -s -sl -w main-english.tex`


### Q: How I want to obey the one-sentence-per-line rule.

Execute `latexindent -m -l -s -sl -w main-english.tex`


### Q: Aren't there other templates?

Sure. The [Hagenberg Thesis Document Collection](https://github.com/Digital-Media/HagenbergThesis) seems to be the most promising.
However, they currently do not support microtype and not the cover of the University of Stuttgart.

We are collecting alternatives at the issue [#25](https://github.com/latextemplates/scientific-thesis-template/issues/25) and plan to add a comparison to each other template.


## Contained Files and Directories

### Directories

* [graphics](graphics/) Directory containing the figures.
  By using PDFLaTeX it is possible to use PDFs, JPGs, PNGs, ... We recommend to use PDFs to enable smooth scaling.

### Files

- `main-*.tex` - Start file for theses
  * The files follow the pattern `main-[institution-][feature-][language].tex`, where
    - `institution` is empty or `paderborn`
    - `feature` is empty or `minted`
    - `language` is `english` or `german`
    - [main-german.tex](https://github.com/latextemplates/scientific-thesis-template/blob/master/main-german.tex) for German
    - [main-english.tex](https://github.com/latextemplates/scientific-thesis-template/blob/master/main-english.tex) for English
    - [main-paderborn-german.tex](https://github.com/latextemplates/scientific-thesis-template/blob/master/main-paderporn-german.tex) for German theses at Paderborn University
    - [main-paderborn-english.tex](https://github.com/latextemplates/scientific-thesis-template/blob/master/main-paderborn-english.tex) for English theses at Paderborn University
  * Add text here
  * Adjust title etc. here
- [bibliography.bib](bibliography.bib) - Bibliography. [biblatex] format. Manage it with [JabRef].
- [acronyms.tex](acronyms.tex) - Abbreviations.
- [commands.tex](commands.tex) - Example macros
- [config.tex](config.tex) - The place to add packages etc.

Following additional files are included, which do not need to be adapted:

- [Makefile](https://github.com/latextemplates/scientific-thesis-template/blob/master/Makefile) - The Makefile. Builds on latexmk.
- [README.md](https://github.com/latextemplates/scientific-thesis-template/blob/master/README.md) - Explains the template

## License

The license of this work is [CC0](https://creativecommons.org/publicdomain/zero/1.0/), which corresponds to "public domain".

### Exceptions

The images in `logos` are subject to other copyright from other parties:

- `UPB_LOGO_GB_RGB_15.pdf` and `UPB_Logo_RGB_D_2012.pdf` are copyright Paderborn University.
  Refer to <https://www.uni-paderborn.de/universitaet/marketing/design-vorgaben-templates/> for proper use.
- `UBP-background-picture.*` are demonstration files generated using an educational edition of Microsoft Office.
  They can be used in a scientific context only.
  For commercial use, please change them.
- `UBP-background-picture.pdf` is generated out of `UBP-background-picture.pptx` and is free for personal use only.

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
