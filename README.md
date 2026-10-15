# LaTeX Template for a Scientific Thesis

This template is a general template for scientific theses.
Currently, it is the unofficial LaTeX template for Master, Bachelor, Diploma, and Student Theses at the computer science departments listed below, each with example PDFs; other departments are untested.
The template will be extended to support theses from more institutions.

## Supported institutions

### University of Stuttgart, Computer Science

- 🇺🇸 [English example](https://latextemplates.github.io/scientific-thesis-template/main-english.pdf)
- 🇺🇸 [English example using the listings package (instead of minted) for source code](https://latextemplates.github.io/scientific-thesis-template/main-basic-listings-english.pdf)
- 🇩🇪 [German example](https://latextemplates.github.io/scientific-thesis-template/main-german.pdf)
- 🇩🇪 [German example using the listings package (instead of minted) for source code](https://latextemplates.github.io/scientific-thesis-template/main-basic-listings-german.pdf)

### Universität Hamburg, Computer Science

- 🇺🇸 [English example](https://latextemplates.github.io/scientific-thesis-template/main-english-university-of-hamburg.pdf)
- 🇩🇪 [German example](https://latextemplates.github.io/scientific-thesis-template/main-german-university-of-hamburg.pdf)

### Technische Hochschule Ulm (THU), Computer Science

- 🇺🇸 [English example](https://latextemplates.github.io/scientific-thesis-template/main-english-thu.pdf)
- 🇩🇪 [German example](https://latextemplates.github.io/scientific-thesis-template/main-german-thu.pdf)

## Quick start

1. Download

    1. Go to the development version at <https://github.com/latextemplates/scientific-thesis-template/archive/main.zip>. Reason: LaTeX packages change so fast over time and we cannot do a release on each change.
    2. Extract `scientific-thesis-template-main.zip` to the directory you want to work. E.g., `c:\users\user\documents\thesis`.

2. Start texing

    - University of Stuttgart:
        - English: `main-english.tex`
        - German: `main-german.tex`
        - Without Python (see below): `main-basic-listings-english.tex`, `main-basic-listings-german.tex`

3. Compile with "lualatex + biber" in your TeX editor or with `latexmk main-english` / `make` on the command line.

### Usage at Overleaf

See [docs/overleaf](docs/overleaf/).

The LaTeX snippets this template is assembled from can be inspected at <https://latextemplates.github.io/latex-snippets/>.

## Writing your thesis

- Read [Student Thesis Projects](https://vdf.ch/product/student-thesis-projects-en.html) by Lichter, Ludewig, Deininger, and Schneider.
  The open-access book explains how to organize, conduct, write, and present a thesis.
- Before handing in, work through the [thesis checklist](docs/thesis-checklist.md).

## Benefits

Following features are enabled in this template:

- (Optional) Typesetting of listings using advanced highlighting powered by the [minted] package.
  `minted` provides better output than [listings], but requires [latexminted] to be installed.
- Generated PDF allows for copy and paste of text without getting words with [ligatures](https://en.wikipedia.org/wiki/Typographic_ligature) such as "workflow" destroyed.
  With pdfLaTeX, this is enabled by `glyphtounicode`, which encodes ligatures (such as fl) using unicode characters; LuaLaTeX does this by itself.
- Ligatures are removed if they are typeset at the wrong place.
  This is enabled by the [selnolig](https://tex.meta.stackexchange.com/questions/2884/new-package-selnolig-that-automates-suppression-of-typographic-ligatures) package.
- Support of hyperlinked references without extra color thanx to [hyperref].
- Better breaking of long URLs.
- Support for `\powerset` command.
- Support todos as pdf annotations. This is enabled by the [pdfcomment] package.
- [microtypographic extensions](https://www.ctan.org/pkg/microtype) for a better look of the paper.
- Modern packages such as [microtype], [zref-clever], [csquotes], [paralist], [hyperref], [hypcap], [upquote], [booktabs].
- LaTeX compilation using the modern [lualatex] compiler.
  For older systems, [pdflatex](https://en.wikipedia.org/wiki/PdfTeX) is still supported.
- [biblatex]+[biber] instead of plain [bibtex] to have a more intuitive `.bib` file:
  Unicode (UTF-8) is fully supported and commands such as `\citeauthor{...}` work out of the box. See also <https://tex.stackexchange.com/q/8411/9075>.
- [latexmk] for easy compilation of the LaTeX document.
- Ready-to-go configuration for [latexindent].
- Proper hyphenation and microtype for English texts.
- Hints on writing an abstract and thesis by Dirk Fahland.

## Disabled features

Following features were not activated for this template.
You can run the [latex template generator] to enable the features.

Congratulations. You chose to use all available features.

## Contained directories and files

### Directories

- [figures](figures/) Directory containing the figures.
  By using LuaLaTex/PDFLaTeX it is possible to use PDFs, JPGs, PNGs, ... We recommend to use PDFs to enable smooth scaling.

### Files

- `main-english.tex` - The main `.tex` file loading all LaTeX packages and their configurations.
  - Add text here
  - Adjust title, … here
- [bibliography.bib](bibliography.bib) - Bibliography. [biblatex] format. Manage it with [JabRef].
- [abbreviations.tex](abbreviations.tex) - Acronyms and abbreviations.
- [commands.tex](commands.tex) - Example LaTeX macros.

Following additional files are included, which do not need to be adapted:

- [localSettings.yaml](localSettings.yaml) - Settings for [latexindent](https://ctan.org/pkg/latexindent)
- [Makefile](Makefile) - The Makefile. Builds on latexmk.
- [Texlivefile](Texlivefile) - List of packages required for a minimal TeXLive installation.

## LaTeX compilation

Compile either in a Docker container (recommended) or with a LaTeX distribution installed on your machine.

### Docker-based (recommended)

The [TeX Live docker image by the Island of TeX](https://gitlab.com/islandoftex/images/texlive#tex-live-docker-image) works the same on Windows, macOS, and Linux.
It ships a complete TeX Live including `latexmk`, `biber`, `latexindent`, Python, and [latexminted].
Thus, `minted` works out of the box - also on Windows, without a separate Python setup.

1. Install [Docker](https://docs.docker.com/get-started/get-docker/) ([Docker Desktop](https://docs.docker.com/desktop/) on Windows and macOS).
1. Open a terminal in the directory of this document and compile in the container.
   The first run downloads the image (approx. 3 GB); its tag selects the TeX Live version of this template.

   Windows (PowerShell):

   ```powershell
   docker run --rm -v "${PWD}:/workdir" registry.gitlab.com/islandoftex/images/texlive:latest latexmk main-english
   ```

   Windows (Command Prompt):

   ```cmd
   docker run --rm -v "%cd%:/workdir" registry.gitlab.com/islandoftex/images/texlive:latest latexmk main-english
   ```

   Linux and macOS:

   ```shell
   docker run --rm -v "$PWD:/workdir" registry.gitlab.com/islandoftex/images/texlive:latest latexmk main-english
   ```

1. Optional: Let VS Code compile in the container, see ["VS Code configuration"](#vs-code-configuration).

If you need additional tools in the image, extend the generated `Dockerfile`, build it with `docker build -t ltg .`, and use `ltg` instead of the image name.

### Traditional

Install a LaTeX distribution on your machine:

- Windows: Recent [MiKTeX](http://miktex.org/). MiKTeX installation hints are given at <http://latextemplates.github.io/scientific-thesis-template/#installation-hints-for-windows>.
- macOS: Recent [TeX Live](https://www.tug.org/texlive/) (e.g. through [MacTeX](https://tug.org/mactex/)) - Try `sudo tlmgr update --all` if you encounter issues with biblatex
- Linux: Recent TeX Live distribution

See <docs/latex-setup.md> for refined installation instructions.

To have `minted` running with a traditional installation, you have to do following steps on Windows (the Docker image already contains all of this):

1. Install python: `choco install python` - that uses [chocolatey](https://chocolatey.org/) to install Python
2. Install [latexminted]: `pip install latexminted` - that uses the Python package manager to install the minted library
### latexmk hints

[latexmk] runs the LaTeX tools (e.g., lualatex and biber) as often as needed to get the final PDF ([why `latexmk` is great](https://tex.stackexchange.com/a/249243/9075)).
It reads its configuration from `.latexmkrc` in the directory of the document.
Overleaf reads `.latexmkrc`, too, so the "Compiler" setting of the Overleaf project does not matter; select TeX Live 2026 there.
To use the configuration for all your documents, put it at [the right place](http://tex.stackexchange.com/a/41149/9075).

Build the document:

```bash
latexmk main-english
```

In the Docker-based setup, put the `docker run ...` part from ["Docker-based (recommended)"](#docker-based-recommended) in front, or just run `make`.
In the traditional setup, `latexmk` needs Perl (TeX Live ships it; with MiKTeX, install it, e.g., via `choco install strawberryperl`).

To recompile on every change and open the PDF, run:

```bash
latexmk -pvc main-english
```

On Windows, the configuration opens the PDF in [Sumatra PDF], which reloads the PDF automatically.

## Tool hints

### Advanced usage

On the command line, there are additional features:

- `make` builds the PDF in the Docker container; `make LOCAL=1` uses your local LaTeX distribution (this works for all `make` targets)
- `latexmk -C` or `make clean` for cleaning up
- `make log` shows only the relevant messages of the last LaTeX run (using [texlogsieve](https://ctan.org/pkg/texlogsieve))
- `make format` to reformat the `.tex` files (one sentence per line and indent)
- `make aspell` for interactive spell checking
- `make stand`: Creates a new PDF with the current status of the document.
- `make view`: Opens the configured viewer
- `make mrproper`: Cleans up and removes also editor backup files.

The `textlint` job of the `Check` workflow reports weakening words (e.g., "clearly", "just") in the English `.tex` files as annotations.
Run it locally with `npx` (needs Node.js; rules come from `.textlintrc.json`):

```bash
npx --yes --package textlint --package textlint-plugin-latex2e --package textlint-filter-rule-allowlist --package textlint-rule-terminology --package textlint-rule-write-good textlint main-english.tex
```

The `textidote` job of the `Check` workflow checks spelling, grammar, and style of English documents with [TeXtidote](https://github.com/sylvainhalle/textidote) and reports its findings as annotations.
Its options are in `.textidote`.
Run it locally with Java and the [`textidote.jar`](https://github.com/sylvainhalle/textidote/releases):

```bash
java -jar textidote.jar --output html main-english.tex > textidote.html
```

### UML diagrams with PlantUML or Mermaid

The "LaTeX Hints" chapter shows UML diagrams drawn with MetaUML and pgf-umlsd, which need no further tools.
PlantUML and Mermaid offer a more compact syntax and lay out the diagrams automatically, but need further tools: they are contained in the [Docker image by DANTE e.V.](https://github.com/dante-ev/docker-texlive).
To use them, generate an own copy of this template with the [latex template generator]:

```bash
npx -p yo -p generator-latex-template -c 'yo latex-template --documentclass=scientific-thesis --latexcompiler=both --overleaf=true --texlive=2026 --enquotes=csquotes --tweakouterquote=babel --todo=pdfcomment --examples=true --howtotext=true --uml=plantuml --docker=dante'
```

Use `--uml=mermaid` for Mermaid.
The generator asks for the remaining options (institution, language, and package for source code), which distinguish the `main*.tex` files of this template.

### VS Code configuration

Currently, following extensions are recommended:

- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) to support LaTeX in VS Code and
- [LaTeX Utilities](https://marketplace.visualstudio.com/items?itemName=tecosaur.latex-utilities) to enhance LaTeX Workshop
- [LTeX+] to have a nice spell checker that also identifies grammar issues

With the settings below, LaTeX Workshop compiles with the recipe "lualatex ➞ biber ➞ lualatex × 2".
To compile in the Docker container (see ["Docker-based (recommended)"](#docker-based-recommended)), add the following lines to VS Code's `settings.json` (<kbd>Shift</kbd>+<kbd>Ctrl</kbd>+<kbd>P</kbd>, then "Preferences: Open Settings (JSON)"):

```javascript
    "latex-workshop.docker.enabled": true,
    "latex-workshop.docker.image.latex": "registry.gitlab.com/islandoftex/images/texlive:latest",
```

The following settings are additionally recommended:

```javascript
{
    "editor.wordWrap": "on",                                          // enable soft line breaks
    "latex-workshop.view.pdf.viewer": "tab",                          // display the generated PDF in a separate tab
    "latex-workshop.view.pdf.color.light.backgroundColor": "#cccccc", // light theme: use a darker background in the PDF viewer to lift the pages off it
    "latex-workshop.view.pdf.color.dark.backgroundColor": "#121314",  // dark theme: same, with a dark gray matching the editor
    "latex-workshop.latex.autoBuild.run": "never",                    // never automatically build; alternative: "onSave" (on saving .tex files)
    "editor.renderWhitespace": "all",                                 // display all whitespaces
}
```

Alternatively, just copy and paste the contents of the [vscode.settings.json](vscode.settings.json) file to your VS Code settings file.

You can manually trigger compilation by hitting the green button in the extension or using other methods provided by LaTeX Workshop.

### LTeX+ tips and tricks

[LTeX+] is an offline grammar and spell checker with support for LaTeX and Markdown.

The main file starts with a magic comment that tells LTeX+ the language of the document, e.g., `% LTeX: language=en-US`.
Add the same comment to further `.tex` files.

## FAQs

### Q: How do I find the cause of a LaTeX error?

In case something goes wrong, you can instruct the LaTeX compiler to stop at the first error:

```bash
lualatex --synctex=1 main-english
```

Run `biber main-english` to get the bibliography rendered (execute `lualatex` afterwards).

### Q: How do I spell check a passage in another language?

Use the `\foreignlanguage{language}{text}` command.
LTeX+ will detect these elements and automatically switch the spell checker's language.
For example:

```latex
\foreignlanguage{english}{Therefore, our proposed approach will change the world.}
```

### Q: How can I synchronize updates from the template to my repository?

1. Initialize your git repository as usual
2. Add this repository as git remote: `git remote add template https://github.com/latextemplates/{template}.git`
3. Merge the branch `template/main` into your `main` branch: `git merge template/main`.

After that you can use and push the `main` branch as usual.
Notes on syncing with the upstream repository [are available from GitHub](https://help.github.com/articles/syncing-a-fork/).

### Q: I get the error `! pdfTeX error (font expansion): auto expansion is only possible with scalable fonts.`

Install the `cm-super` package using the MiKTeX package manager. Then, run `initexmf --mkmaps` on the command line. (Long description: <https://tex.stackexchange.com/a/324972/9075>)

### Q: I get `Package csquotes Error: Unbalanced groups or invalid nesting.` What can I do?

A: You have activated `\MakeOuterQuote{"}` and used some special babel command to allow hyphenation at other places as a dash. One example is writing `application"=specific`.
Now, you have to decide whether you want keep using plain quotes to enquote a word or use the special hyphenation command.
In other words: Do you want `"quote"` and `app\-lication\-specific` or `\enquote{quote} and  application"=specific`?

Note that this should not happen when the template is generated as the setting `tweakouterquote` ensures that these two options are mutually exclusive.

### Q: I need more space. What can I do?

The most simple solution to get more space is to exchange the font.

### Q: How can I reformat my `.tex` files?

Execute `latexindent -l -s -sl -w main-english.tex`

Alternatively, execute `make format`.

### Q: How I want to obey the one-sentence-per-line rule. How to do?

See "How can I reformat my `.tex` files?"

### Q: I want to use minted, because I think its syntax highlighting seems to be better.

You can re-generate the template and choose `minted` as listings environment.
Moreover, ensure that python and [latexminted] are installed properly:

- `choco install python`
- `pip install latexminted`

### Q: I have troubles with minted on Windows.

For instance, on gets following output:

```text
! Package minted Error: minted v3+ executable is not installed, is not added to
 PATH, or is not permitted with restricted shell escape; or MiKTeX is being use
d with -aux-directory or -output-directory without setting a TEXMF_OUTPUT_DIREC
TORY environment variable.
```

Try out following command to update `latexminted`.
See [minted#425](https://github.com/gpoore/minted/issues/425) for details.

```shell
python3 -m pip install --force-reinstall latexminted
```

### Q: Can I also write in German?

Yes. You can regenerate the template and choose "German" as language.

### Q: I was recommended the Harvard style

This template uses the alphabetic style.
That style is explained at the [biblatex documentation](http://texdoc.net/texmf-dist/doc/latex/biblatex/biblatex.pdf) on page 60:

> The alphabetic labels resemble a compact author-year
> style to some extent, but the way they are employed is similar to a numeric citation
> scheme. For example, instead of “Jones 1995” this style would use the label “[Jon95]”.
> “Jones and Williams 1986” would be rendered as “[JW86]”.

We are aware that the University of Stuttgart [recommends to use the Hardvard style](https://ilias3.uni-stuttgart.de/ilias.php?ref_id=12257&from_page=11895&obj_id=11896&cmd=layout&cmdClass=illmpresentationgui&cmdNode=dn&baseClass=ilLMPresentationGUI).
However, this style is not common in natural sciences and information science.

### Q: `ngerman-x-latest` is reported missing

Install the package `dehyph-exptl`.

### Q: I get ``! I can't find file `clmr28t10+20'.``

`latexmk` runs `latex`, which produces a DVI file (and not a PDF file), because it does not find its configuration.
Make sure that `.latexmkrc` is in the directory of the document.

### Q: I get `Font "LatinModernMath-Regular" not found.`. What can I do?

Error message:

```text
luaotfload | db : Reload initiated (formats: otf,ttf,ttc); reason: Font "LatinModernMath-Regular" not found.
luaotfload | resolve : sequence of 3 lookups yielded nothing appropriate.

! Package fontspec Error: The font "LatinModernMath-Regular" cannot be found.
```

Install the package `lm-math` manually.

### Q: I get ``File `ushyphex.tex' not found.``

Install package `tugboat`.

### Q: I get `! Package fontspec Error: The font "LinuxLibertineO" cannot be found.`. What can I do?

Install the package `libertine` manually.

### Q: I get `! Package fontspec Error: The font "TeXGyreTermes" cannot be found.`. What can I do?

Install the package `tex-gyre` and `tex-gyre-math` manually.

### Q: I get `! error:  (type 1): cannot find encoding file 'ntx-ot1-tlf.enc' for reading`. What can I do?

See <https://tex.stackexchange.com/a/240850/9075>: Install the packages `newpx` and `newtxsf` manually.

### Q: I get `! TeX capacity exceeded, sorry [main memory size=3000000].`. What can I do?

Follow the steps at <https://tex.stackexchange.com/a/548335/9075>

Try with following command

```bash
lualatex -shell-escape --extra-mem-top=10000000 --synctex=1 main-english.tex
```

See <https://tex.stackexchange.com/a/124206/9075> for details.

### Q: There is an output that biber/biblatex too old

See installation hints of how to update them at different systems.

### Q: MiKTeX complains about missing `.sty` files.

Use the [MiKTeX console](https://miktex.org/howto/miktex-console) to refresh the package index.
Then, automatic installation should work again.

### Q: How to include Excel charts properly?

1. Select the Excel chart you want to use.
2. Print to PDF with the option "Print Selected Chart".
3. Remove empty space of the created PDF page with `pdfcrop chart.pdf chart_cropped.pdf` (install via MikTeX first, if not available; check via `pdfcrop --version`).
4. Use [pdfscissors](https://sites.google.com/site/pdfscissors) to crop the borders and title (maybe you have to allow <https://sites.google.com> in the Java security center in the control panel).
5. Include the PDF in LaTeX via `\includegraphics{chart_cropped.pdf}`.

### Q: How do I change the appearance of chapter headings?

Look for `% Code for my fancy chapters.` in your main `.tex` file and play around with parameters.

### Q: Aren't there other templates?

Sure. The [Hagenberg Thesis Document Collection](https://github.com/Digital-Media/HagenbergThesis) seems to be the most promising.
However, they currently do not support microtype and not the cover of the University of Stuttgart.

We are collecting alternatives at the issue [#25](https://github.com/latextemplates/scientific-thesis-template/issues/25) and plan to add a comparison to each other template.

### Q: Do I have to do something special for the final version?

- If you included some version control statements, please remove them. Currently, the template does not support any, but it used to support SVN.
- By using `\largepage` and `\shortpage`, single lines at the bottom or at the top of the page can be manually fixed.
- Search the PDF for "TODO" or similar things. Remove `\usepackage{todonotes}` in your main `.tex` file.
- Ensure that you run `lualatex` at least three times and that there are no "undefined references".
- The margins are intended for good screen reading. **Do not change them** (or do exactly know what you are doing).
## Further information

- Why the templates use which packages: [decision records of the template generator](https://github.com/latextemplates/generator-latex-template/tree/main/docs/decisions)
- Other templates: <https://latextemplates.github.io/>
- For German users, go to <https://texfragen.de/>.
- Frank Mittelbach with Ulrike Fischer: [The LaTeX Companion](https://www.latex-project.org/news/2023/03/17/TLC3/) is the ultimate guide for LaTeX: The authors went through all packages offered by [CTAN](https://ctan.org/), selected the most promising ones, described them, and provide minimal working example for each of it.
- Lutz Hering, Heike Hering: [How to Write Technial Reports](https://doi.org/10.1007/978-3-540-69929-3), Springer, 2010; also available in German [Technische Berichte - verständlich gliedern, gut gestalten, überzeugend vortragen](https://doi.org/10.1007/978-3-8348-8317-9). - Highly recommended, because it guides through all aspects of a report (such as a Master Thesis).
- Marcus Deininger et al.: [Studienarbeiten - Ein Leitfaden zur Erstellung, Durchführung und Präsentation wissenschaftlicher Abschlussarbeiten am Beispiel Informatik](https://vdf.ch/studienarbeiten.html?author_id=2877), vdf. - Recommended as guideline for planning and working on the whole thesis.
- Charles Lipson, [Cite Right, Second Edition: A Quick Guide to Citation Styles--MLA, APA, Chicago, the Sciences, Professions, and More](http://www.press.uchicago.edu/ucp/books/book/chicago/C/bo10702043.html), Chicago Guides to Writing, Editing, and Publishing, 2011. - Recommended in case you are unsure about how to correctly cite something.

## License

The license of this work is [0BSD](https://spdx.org/licenses/0BSD.html) which corresponds to "public domain".
Any derived work can freely be relicensed and can omit original copyright and license information.

### Exceptions

The logos are trademarks of the universities: use them only on the title page of a thesis submitted there, so that the thesis is not mistaken for a publication of the university.

- `figures/uhh-logo.pdf` is the logo of the Universität Hamburg, converted from [UHH Universität Hamburg Logo mit Schrift 2010 Farbe CMYK.svg](https://commons.wikimedia.org/wiki/File:UHH_Universit%C3%A4t_Hamburg_Logo_mit_Schrift_2010_Farbe_CMYK.svg) (public domain, via Wikimedia Commons).
- `figures/thu-logo.png` is [THU Logo Subline deutsch RGB.png](https://commons.wikimedia.org/wiki/File:THU_Logo_Subline_deutsch_RGB.png) by Hochschule Ulm, licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/), via Wikimedia Commons.

[biber]: https://www.ctan.org/pkg/biber
[biblatex]: http://tex.stackexchange.com/tags/biblatex/info
[bibtex]: https://www.ctan.org/pkg/bibtex
[booktabs]: https://ctan.org/pkg/booktabs
[zref-clever]: https://ctan.org/pkg/zref-clever
[csquotes]: https://www.ctan.org/pkg/csquotes
[hypcap]: https://www.ctan.org/pkg/hypcap
[hyperref]: https://ctan.org/pkg/hyperref
[latexindent]: https://ctan.org/pkg/latexindent
[latexmk]: http://tex.stackexchange.com/tags/latexmk/info
[listings]: https://ctan.org/pkg/listings
[lualatex]: http://www.luatex.org/
[microtype]: https://ctan.org/pkg/microtype
[minted]: https://ctan.org/pkg/minted
[natbib]: https://ctan.org/pkg/natbib
[paralist]: https://www.ctan.org/pkg/paralist
[pdfcomment]: https://www.ctan.org/pkg/pdfcomment
[upquote]: https://www.ctan.org/pkg/upquote

[JabRef]: https://www.jabref.org
[LanguageTool]: https://languagetool.org/
[latex template generator]: https://www.npmjs.com/package/generator-latex-template
[LTeX+]: https://marketplace.visualstudio.com/items?itemName=ltex-plus.vscode-ltex-plus
[latexminted]: https://pypi.org/project/latexminted/
[Sumatra PDF]: https://www.sumatrapdfreader.org/free-pdf-reader

<!-- disable markdown-lint rules contradicting our writing of FAQs -->
<!-- markdownlint-disable-file MD001 MD013 MD026 -->
