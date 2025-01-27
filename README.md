# LaTeX Template for a Scientific Thesis

This template is a general template for scientific theses.
Currently, it is the unofficial LaTeX template for Master, Bachelor, Diploma, and Student Theses at following institutions:

- University of Stuttgart, Computer Science
  - [English example](https://latextemplates.github.io/scientific-thesis-template/main-english.pdf)
  - [English example with minted and PlantUML](https://latextemplates.github.io/scientific-thesis-template/main-minted-english.pdf)
  - [German example](https://latextemplates.github.io/scientific-thesis-template/main-german.pdf)
  - [German example with minted and PlantUML](https://latextemplates.github.io/scientific-thesis-template/main-minted-german.pdf)

The template will be extended to support theses from different institutions.

For [architectural decision records](https://adr.github.io) see [docs/adr](docs/adr/).

## Usage

- `thesis-example.tex` is the main document
- Use "lualatex + biblatex" in your TeX editor or `latexmk  main-english` / `make` in the command line

### Using `latexmk`

[latexmk] is a very smart tool for latex compilation.
It executes the latex tools as often as needed to get the final PDF.

To build the whole document, execute following command.
Note that this requires a working perl installation.

```bash
latexmk main-english
```

To enable latexmk, please move `_latexmkrc` to `latexmkrc`.

In case something goes wrong, you can instruct the LaTeX compiler to stop at the first error:

```bash
lualatex main-english
```

### Advanced usage

On the command line, there are additional features:

- `latexmk -C` or `make clean` for cleaning up
- `make format` to reformat the `.tex` files (one sentence per line and indent)
- `make aspell` for interactive spell checking

## Benefits

Following features are enabled in this template:

- (Optional) Typesetting of listings using advanced highlighting powered by the [minted] package.
- Generated PDF allows for copy and paste of text without getting words with ligatures such as "workflow" destroyed.
  This is enabled by `glyphtounicode`, which encodes ligatures (such as fl) using unicode characters.
- Support of hyperlinked references without extra color thanx to [hyperref].
- Better breaking of long URLs.
- Support for `\powerset` command.
- Support todos as pdf annotations. This is enabled by the [pdfcomment] package.
- [microtypographic extensions](https://www.ctan.org/pkg/microtype) for a better look of the paper.
- Modern packages such as [microtype], [cleveref], [csquotes], [paralist], [hyperref], [hypcap], [upquote], [booktabs].
- LaTeX compilation using the modern lualatex compiler.
- [biblatex]+[biber] instead of plain [bibtex] to have a more intuitive `.bib` file.
- [latexmk] for easy compilation of the LaTeX document.
- Ready-to-go configuration for [latexindent].
- Proper hyphenation and microtype for English texts.
- Hints on writing an abstract and thesis by Dirk Fahland.

## Disabled features

Following features were not activated for this template.
You can run the [latex template generator] to enable the features.

Congratulations. You chose to use all available features.

## Tool hints

### Prerequisites

- Windows: Recent [MiKTeX](http://miktex.org/). MiKTeX installation hints are given at <http://latextemplates.github.io/scientific-thesis-template/#installation-hints-for-windows>.
- Mac OS X: Recent [TeX Live](https://www.tug.org/texlive/) (e.g. through [MacTeX](https://tug.org/mactex/)) - Try `sudo tlmgr update --all` if you encounter issues with biblatex
- Linux: Recent TeX Live distribution

### Usage of `minted`

To have minted running properly, you have to do following steps on Windows:

1. Install python: `choco install python` - that uses [chocolatey](https://chocolatey.org/) to install Python
2. Install [pygments]: `pip instal pygments` - that uses the Pyhton package manager to install the pygments library
3. When latexing, use `-shell-escape`: `pdflatex -shell-escape main-english`.
   You can also just execute `latexmk main-english`.

### VSCode configuration

Currently, following extensionsa re recommended:

- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) to support LaTeX in VSCode and
- [LaTeX Utilities](https://marketplace.visualstudio.com/items?itemName=tecosaur.latex-utilities) to enhance LaTeX Workshop
- [LTeX+] to have a nice spell checker that also identifies grammar issues

Then, change the setting of LaTeX Workshop to use biber:
Update the following lines in the VSCode `settings.json` to contain:

```javascript
    "latex-workshop.latex.recipes": [
        {
            "name": "lualatex ➞ biblatex ➞ lualatex × 2 🔃",
            "tools": [
                "lualatex",
                "biblatex",
                "lualatex",
                "lualatex"
            ]
        },
    ],
    "latex-workshop.latex.tools": [
        // ...
        {
            "name": "biblatex",
            "command": "biblatex",
            "args": [
                "%DOCFILE%"
            ],
            "env": {}
        },
        // ...
    ],
```

The following settings are additionally recommended:

```javascript
{
    "editor.wordWrap": "on",                              // enable soft line breaks
    "latex-workshop.view.pdf.viewer": "tab",              // display the generaded PDF in a separate tab
    "latex-workshop.view.pdf.backgroundColor": "#cccccc", // use a darker background in de PDF viewer to lift of the pages from it
    "latex-workshop.latex.autoBuild.run": "onSave",       // automatically build on saving .tex files
    "editor.renderWhitespace": "all",                     // display all whitespaces
}
```

Alternatively, just copy and paste the contents of the [vscode.settings.json](./vscode.settings.json) file to your VSCode settings file.

### LTeX+ tips and tricks

[LTeX+] is an offline grammar and spell checker with support for LaTeX and Markdown.

Add a magic comment to your files to tell LTeX+ which language to use:

```latex
% LTeX: language=de-DE
```

If you want to use different languages in the text, use the `\foreignlanguage{language}{text}` command.
LTeX+ will detect these elements and automatically switch the spell checker's language.
For example:

```latex
\foreignlanguage{english}{Therefore, our proposed approach will change the world.}
```

### Other hints

- Grammar and spell checking is available at [TeXstudio].
  Please download [LanguageTool] (Windows: `choco install languagetool`) and [configure TeXstudio to use it](http://wiki.languagetool.org/checking-la-tex-with-languagetool#toc4).
  Note that it is enough to point to `languagetool.jar`.
  **If TeXstudio doesn't fit your need, check [the list of all available LaTeX Editors](http://tex.stackexchange.com/questions/339/latex-editors-ides).**
- Use [JabRef] to manage your bibliography (Windows: `choco install jabref`).

## Usage with docker

The generated `Dockerfile` is based on the [Dockerfile by the Island of TeX](https://gitlab.com/islandoftex/images/texlive#tex-live-docker-image).

```cmd
docker run --rm -v "c:\users\example\latex-document:/workdir" ltg latexmk
```

Following one-time setup is required:

```cmd
docker build -t ltg .
```

## FAQs

### Q: How can I synchronize updates from the template to my repository?

1. Initialize your git repository as usual
2. Add this repository as upstream: `git remote add upstream https://github.com/latextemplates/{template}.git`
3. Merge the branch `upstream/main` into your `main` branch: `git merge upstream/main`.

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

Execute following command:

```bash
latexindent -l -s -sl -w main-english.tex
```

### Q: I want to obey the one-sentence-per-line rule. How can I do that?

Execute following command:

```bash
latexindent -m -l -s -sl -w main-english.tex
```

### Q: Can I also write in German?

Yes. You can regenerate the template and choose "German" as language.

### Q: `ngerman-x-latest` is reported missing

Install the package `dehyph-exptl`.

### Q: I get ``! I can't find file `clmr28t10+20'.``

You seem to use `latexmk` locally.
Please move `_latexmkrc` to `latexmkrc` to get `latexmk` working.
If you don't do this, `latexmk` tries to execute `latex`, which tries to produce a DVI file (and not a PDF file).

## Further information

- Other templates: <https://latextemplates.github.io/>

## License

The license of this work is [0BSD](https://spdx.org/licenses/0BSD.html) which corresponds to "public domain".
Any derived work can freely be relicensed and can omit original copyright and license information.
[biber]: https://www.ctan.org/pkg/biber
[biblatex]: http://tex.stackexchange.com/tags/biblatex/info
[bibtex]: https://www.ctan.org/pkg/bibtex
[booktabs]: https://ctan.org/pkg/booktabs
[cleveref]: https://ctan.org/pkg/cleveref
[csquotes]: https://www.ctan.org/pkg/csquotes
[hypcap]: https://www.ctan.org/pkg/hypcap
[hyperref]: https://ctan.org/pkg/hyperref
[latexindent]: https://ctan.org/pkg/latexindent
[latexmk]: http://tex.stackexchange.com/tags/latexmk/info
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
[pygments]: http://pygments.org/
[TeXstudio]: http://texstudio.sourceforge.net/

<!-- disable markdown-lint rules contradicting our writing of FAQs -->
<!-- markdownlint-disable-file MD001 MD013 MD026 -->
