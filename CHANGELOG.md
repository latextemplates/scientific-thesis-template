# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/).
From 2025-01-26 onwards, versioning is done using [Calendar Versioning](https://calver.org/).

## [Unreleased]

### Added

- README: "Further information" links common questions of LaTeX beginners (often referenced questions on TeX.SE, Barbara Beeton's "What every LaTeX newbie should know").
- Progress bars below headings show how far each chapter is written: `\progress{60}` below a heading draws a bar filled to 60 %; `\showprogressfalse` hides all bars for the submitted version.
- A commented-out line in the preamble switches to serif headings (classic English book style); sans-serif stays the default.
- [fewerfloatpages](https://ctan.org/pkg/fewerfloatpages) avoids pages that contain only a few floats.
- `.devcontainer/devcontainer.json`: open the repository in VS Code ("Reopen in Container") or in GitHub Codespaces to work inside the TeX Live image, without a local LaTeX installation.

### Changed

- The running header and the page number are typeset in a smaller font.
- `docs/latex-setup.md` recommends Docker for compiling and VS Code for editing (linking to the README); the MiKTeX and Ubuntu hints stay as the traditional setup and TeXstudio is the last alternative.
- `docs/latex-setup.md` no longer mentions Ubuntu 16.04.
- The README and `docs/latex-setup.md` recommend the [JabRef beta version](https://github.com/JabRef/jabref/releases), because the stable version 5.15 is too old.

### Removed

- The switched-off [spelling](https://ctan.org/pkg/spelling) package is no longer loaded.

## [2026-10-19]

### Added

- A chapter written in plain Markdown (`chapters-<lang>/NN - markdown.md`; LuaLaTeX).
- Optional `[PDF]` link to the cited paper from JabRef's `file` field.
- Section "Threats to Validity" in the evaluation chapter of the writing hints.
- Numbered research questions (`\defRQ`, referenced as "RQ1" by `\refRQ`) using [refenums](https://github.com/koppor/refenums) (`refenums.sty`).
- VS Code: [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) recommended, configured by `.markdownlint.yml`.
- VS Code: LTeX+ knows the words of the aspell word lists (`.vscode/ltex.dictionary.<language>.txt`).
- `make dictionaries` merges the word lists of aspell, LTeX+, and TeXtidote.
- CI: after a push that changes a word list, the workflow `Dictionaries` runs `make dictionaries` and commits the merged word lists.
- CI: [typos](https://github.com/crate-ci/typos) checks the spelling, also in comments (configured in `.typos.toml`).

### Changed

- Each chapter is a file in `chapters-en/` or `chapters-de/` (`NN - <name>.tex`, numbered in steps of 10), included by the main file.
- A short README.md in `chapters-en/` and `chapters-de/`.
- The parts of the writing hints (background, problem exposition, …, evaluation) are chapters.
- The caption of the cross-reference example table is above the table.
- Lines in minted listings are labeled with `\label` and referenced with `\zcref` like everything else (`\labelline` and `\refline` removed).
- University of Hamburg (English): the title page shows "Thesis Title" as placeholder.
- Markdown example: "a whole chapter" instead of "a longer part".
- CI: aspell, textlint, and TeXtidote also check the Markdown chapter.
- CI and `make spellcheck`: aspell and TeXtidote run in the [Docker image by DANTE e.V.](https://hub.docker.com/r/danteev/texlive).
- CI: `update-files.yml` no longer passes the ignored `--cleveref=true`.
- README.md: FAQ on adding words (e.g., names of tools) to the spell checkers.
- README.md: how to run the `make` targets in Docker without a local `make`.
- README.md: link to the LaTeX snippets moved to the introduction.
- README.md: "Disabled features" is a subsection of "Benefits".
- README.md and `docs/latex-setup.md`: markdownlint findings fixed.

### Removed

- `stfloats.sty`: MiKTeX ships the package `sttools` again ([miktex-packaging#492](https://github.com/MiKTeX/miktex-packaging/issues/492)).
- `tikz-uml.sty` and `data/data.csv`: no longer used.

### Fixed

- Typos fixed, mostly in comments; German comments in the English files translated.
- English: algorithms are captioned "Algorithm" (instead of "Algorithmus").

## [2026-10-16]

### Added

- The LaTeX hints show UML diagrams without further tools: [MetaUML](https://ctan.org/pkg/metauml) class and component diagrams (LuaLaTeX) and a [pgf-umlsd](https://ctan.org/pkg/pgf-umlsd) sequence diagram.
- README.md: how to generate an own copy with PlantUML or Mermaid.
- [TeXtidote](https://github.com/sylvainhalle/textidote) checks spelling, grammar, and style (configuration `.textidote`, `make spellcheck-textidote`), for English documents in CI.
- VS Code: [JabRef 4 VSCode](https://marketplace.visualstudio.com/items?itemName=jabref.jabref-4-vscode) recommended.

### Changed

- `main-*.tex` use minted; the variants using the listings package are `main-basic-listings-*.tex`.
- README.md: minted FAQs merged and moved up.
- docs/thesis-checklist.md: spell-checking tools named.
- `make spellcheck` runs all spell checkers (`make aspell` is now `make spellcheck-aspell`).
- GitHub workflows: actions pinned to commit SHAs.

### Fixed

- Example texts: spelling and grammar fixed.
- Makefile: `.PHONY` lists all targets; `make spellcheck-aspell` and `make showundef` work.

## [2026-10-15]

### Added

- Variant for the Technische Hochschule Ulm (THU): `main-english-thu.tex`, `main-german-thu.tex`, and the minted variants have a title page with the THU logo ([CC BY-SA 4.0 by Hochschule Ulm](https://commons.wikimedia.org/wiki/File:THU_Logo_Subline_deutsch_RGB.png)) and the declaration signed in Ulm.
- The LaTeX hints show how to color table rows and cells (`\rowcolor`, `\cellcolor`). [scientific-thesis-template#87](https://github.com/latextemplates/scientific-thesis-template/pull/87)
- `make log` shows the relevant messages of the LaTeX log (texlogsieve).

### Changed

- The thesis is laid out single-sided; the header shows the chapter on the left and the section on the right.
- The Universität Hamburg variant uses the logo as vector graphic `figures/uhh-logo.pdf` ([public domain, Wikimedia Commons](https://commons.wikimedia.org/wiki/File:UHH_Universit%C3%A4t_Hamburg_Logo_mit_Schrift_2010_Farbe_CMYK.svg)) instead of `figures/UHH-Logo_2010_Farbe_CMYK.png`.
- The README lists the example PDFs per institution.
- `make format` (and thus CI) indents all main files (`main*.tex`), not only `MASTER_TEX`.
- VS Code: the recommended extension is `james-yu.latex-workshop` (`manhen.latex-workshop-2` was removed from the stores).
- VS Code: the background of the PDF viewer follows the light or dark theme.
- Dependabot groups all GitHub Actions updates into one weekly PR.
- `check.yml` pins all GitHub Actions to commit SHAs.
- README.md: sections reordered.
- README.md: on Overleaf, select TeX Live 2026.
- README.md: passages in another language are an FAQ.
- README.md: links the decision records of the template generator.
- The decision records moved to the [template generator](https://github.com/latextemplates/generator-latex-template/tree/main/docs/decisions).
- README.md: the supported institutions are headings.
- README.md: "Usage with docker" merged into "Docker-based (recommended)".
- Embedding the `.bib` file into the PDF is opt-in.
- `.latexmkrc` replaces `_latexmkrc`; it works on Overleaf, too.
- `make` runs the LaTeX tools in the Docker image (`make LOCAL=1` runs them locally).
- `vscode.settings.json` contains the Docker settings of LaTeX Workshop and does not build on save.
- README.md: compilation hints consolidated in "LaTeX compilation".
- docs/overleaf: no step for `latexmkrc` any more.
- minted compiles without `--shell-escape`.

### Fixed

- The README links the `figures/` directory, and `.dockerignore` excludes the generated `figures/*.pdf_tex` files. [generator-latex-template#586](https://github.com/latextemplates/generator-latex-template/pull/586)
- The list of abbreviations is generated when building with `latexmk`.
- The `.markdown.in` file of the markdown package is ignored by git and removed by `latexmk -c`.
- textlint ignores expl3 function names, Markdown reference IDs, and the name of the markdown package.
- German documents load only `autotype` (not additionally `selnolig`) for correct ligatures.
- `make view` opens the PDF on Linux and macOS.
- German documents configure `autotype` with `ligatures=selective` instead of the outdated `ligbreak`.
- The sans-serif font TeX Gyre Heros is available in bold.
- `kvoptions-patch` is no longer loaded; LaTeX 2026-06-01 aborts loading it.
- `vscode.settings.json`: the recipes run `lualatex` (resp. `pdflatex`) with the right bibliography tool.
- README.md: the examples are labeled "with minted" (they contain no PlantUML).

## [2026-10-14]

### Added

- The LaTeX hints show how to write text in Markdown using the [markdown](https://ctan.org/pkg/markdown) package - easing the start for LaTeX newcomers. The example is shown when compiling with LuaLaTeX; with pdfLaTeX, a hint is shown instead. The package's cache directory (`_markdown_*/`) is ignored by git. Markdown references such as `<#tbl:markdown>` typeset the type name and the number ("Table 1").
- The header of the main file states in which lines `\begin{document}` and the first heading are, so the content is found without scrolling through the long preamble.

### Changed

- The README uses the TeX Live image of the Island of TeX directly (also in the VS Code setting `latex-workshop.docker.image.latex`) - building an own image `ltg` is no longer needed. The commands to compile in the container are copy-and-paste ready for Windows (PowerShell and Command Prompt), Linux, and macOS.
- `docs/latex-setup.md` gives copy-and-paste ready docker commands for Windows (PowerShell and Command Prompt), Linux, and macOS.
- The how-to text references sections via `\Zcref` instead of a hardcoded `Section~\ref`.
- The README's tool hints distinguish a Docker-based setup (recommended) from a traditional installation: the [TeX Live image by the Island of TeX](https://gitlab.com/islandoftex/images/texlive) works the same on Windows, macOS, and Linux and makes `minted` work without a separate Python setup. The "Usage with docker" section and the VS Code hints (LaTeX Workshop can compile in the container) are linked from there.
- `docs/latex-setup.md` is structured the same way: "Docker-based (recommended)" with the Docker installation, the command line, and the TeXstudio commands for all operating systems, and "Traditional" with the former Ubuntu and Windows hints.

## [2026-10-08]

### Added

- The `Check` workflow has a `textlint` job that reports weakening words (e.g., "clearly", "just") in the English `.tex` files as annotations, without failing the build ("only" is allowed). Configure it in `.textlintrc.json`; the README shows how to run it locally.
- [`docs/thesis-checklist.md`](docs/thesis-checklist.md): a checklist to work through before handing in your thesis, linked from the README and the writing hints.
- The README and the writing hints recommend the open-access book [Student Thesis Projects](https://vdf.ch/product/student-thesis-projects-en.html), and the writing hints explain how to write both for readers who read from beginning to end and for readers who open the thesis anywhere.
- Appendix "Use of AI Tools" (German: "Nutzung von KI-Tools") with the example table of the [layout requirements of the CS department](https://www.f05.uni-stuttgart.de/informatik/dokumente/Formulare/Formvorgaben-Abschlussarbeiten_en.pdf), as required by its new declaration. [#191](https://github.com/latextemplates/scientific-thesis-template/issues/191)
- The figure examples show how to include a JPEG photo (`figures/ulm-minster.jpg`, CC0 from Wikimedia Commons).
- The listings example shows a listing spanning multiple pages: use a non-floating listing for long code, because floating listings cannot break across pages. [#96](https://github.com/latextemplates/scientific-thesis-template/issues/96)

### Changed

- Cross-references use [zref-clever](https://ctan.org/pkg/zref-clever) instead of [cleveref](https://ctan.org/pkg/cleveref), because zref-clever works with tagged (accessible) PDFs: write `\zcref{...}` instead of `\cref` and, at the start of a sentence, `\Zcref{...}` (short for `\zcref[S]{...}`) instead of `\Cref`. Page-aware references use `\zvref` ([zref-vario](https://ctan.org/pkg/zref-vario)) instead of `\vref`.
- Updated [scientific-thesis-cover](https://github.com/latextemplates/scientific-thesis-cover) to its latest version: the cover page elements are placed at fixed positions, and the options `course` and `supervisor` are now called `studyprogram` and `advisor` (the old names still work).
- `_latexmkrc` is organized in sections and lists commented-out alternatives for continuous preview (`-pvc`), the job name, and the PDF viewer (e.g., evince). [#141](https://github.com/latextemplates/scientific-thesis-template/issues/141)
- The example texts and the writing hints (abstract guide, chapter-structure hints) avoid words that textlint's `write-good` rule flags (`rarely`, `a few`, `several`, `usually`, `various`, `likely`), so a fresh thesis has no textlint annotations. A sentence-initial `Finally,` is allowed in `.textlintrc.json`, because it marks a sequence rather than weakening a statement.
- The paragraph example links Andrew Stacey's *Document Revision System* by title with the URL in a footnote, and the hyphenation example shows the short `\verb` snippets `\allowbreak{}` and `"=` instead of whole words, so that neither runs out of a narrow column.

### Fixed

- Long code lines without spaces (e.g., `\includegraphics[width=.4\linewidth]{example-image-a}`) in the "Corresponding LaTeX code" boxes of the `listings` variant are wrapped instead of running out of the box.
- Fixed typos in the example and writing-hint texts.
- German theses show the German title page and declaration instead of the English ones.
- The German declaration spells "Hilfsmittel" correctly.
- `latexmk -pv` opens the PDF on Linux and macOS: the SumatraPDF viewer is only configured on Windows.

## [2026-07-30]

### Added

- The README now links the [latex-snippets site](https://latextemplates.github.io/latex-snippets/) near the top, so you can inspect the source snippets this template is assembled from.
- Soft-wrapped lines in code listings now show a gray hook arrow (↪) at the start of each continuation line, so they are distinguishable from real line breaks; the arrow is not copied when you select the code from the PDF.
- The compiled PDF now embeds `bibliography.bib`, so the reference data can be extracted from the PDF (e.g., with JabRef).

## [2026-06-30]

### Added

- Inline acronym typesetting with `\initialism` (and the ready-made `\OMG`, `\BPEL`, `\BPMN`, `\UML`) — a lightweight alternative to the glossary (`\gls`) for acronyms you do not want in the list of abbreviations. It now works (the required `lccaps` package is loaded) and is demonstrated by a new example in the "LaTeX Hints" chapter.

## [2026-06-25]

### Added

- New example sections in the "LaTeX Hints" chapter: Formulas and Equations, Figures with TikZ, Plots with pgfplots, tables spanning multiple pages (`longtable`), and an optional UML diagram example (`tikz-uml` or PlantUML).
- A German "Kurzfassung" section in the English document, for courses of study that require both a German and an English abstract.
- Instructions for using VS Code with the LaTeX Workshop extension.

### Changed

- Use a full example author name on the title page (`Bernhard Diener` instead of the abbreviated `Lars K.`)
- Use a local version of [`scientific-thesis-cover.sty`](https://github.com/latextemplates/scientific-thesis-cover) to enable the current declaration for all TeX versions
- Typesetting improvements: widow/orphan control, top-aligned floats on float-only pages, more table row spacing, and reduced hyphenation for German.

### Removed

- Removed obsolete files left over from the pre-generator structure: `config.tex`, `latexhints-english.tex`, `latexhints-german.tex`, `latexhints-german-plantuml.tex`, `latexhints-minted-german.tex`, and `pre-documentclass.tex`. Their content is generated inline into the `main-*.tex` files.

### Fixed

- Restored grammar and spelling improvements that a regeneration had overwritten.

## [2025-10-25]

### Added

- Added initial support for University of Hamburg

### Changed

- Single line spacing in text

## [2025-10-20]

### Changed

- Now generated using the [latex template generator](https://www.npmjs.com/package/generator-latex-template).
- One `main-*` document for both pdflatex and lualatex.

### Removed

- Removed support for Paderborn

## [2025-01-26]

### Added

- Added initial `Dockerfile` to enable building using Docker.
- Added package [mindflow](https://www.ctan.org/pkg/mindflow), which supports quickly noting down thoughts with a) a proper rendering of LaTeX and b) a proper differentiation from the main text
- Added more LaTeX hints

### Changed

- Switch to pdflatex (to speed up compile time)
- Now generated using the [latex template generator](https://www.npmjs.com/package/generator-latex-template).
- Replaced `\ifluatex` statements by separate `.tex` documents. This makes each `.tex` document smaller and simpler to understand.
- Updated to TeXLive 2021

### Fixed

- Fixed examples in latexhints
- Fixed typo in latexmk action name
- Fixed mention of license in README

### Removed

## [3.0.0] &ndash; 2020-09-03

### Fixed

- Fixed loading of newtxmath.
- Fixed loading of "TeX Gyre Termes" and "TeX Gyre Heros" on MiKTeX.
- Fixed bold and italics
- Fixed font in math environment `\mathrm` to use "TeX Gyre Termes"
- Fixed renaming of `\acronymname` to "Abkürzungsverzeichnis" when using the german template
- Fixed loading of "TeX Gyre Heros" variants on LuaLaTeX
- Fixed the broken PlantUML setup link in the documentation

### Changed

- Simplified styleguide of `config.tex`
- Removed package [dtk-logos](https://ctan.org/tex-archive/usergrps/dante/dtk), because it causes issues with lualatex
- Removed package [amssymb](https://ctan.org/pkg/amsfonts?lang=de) to fix compilation error. [#125](https://github.com/latextemplates/scientific-thesis-template/issues/125)
- Change documentation to tell users to download `master.zip` instead of the latest release.
- Switch from lualatex to pdflatex as default compiler.

### Added

- Added section "related work". [#127](https://github.com/latextemplates/scientific-thesis-template/issues/127)

### Removed

- Removed option `hyperref` at xcolor package. It is not used and caused troubles at some setups.

## [3.0.0-beta.4] – 2019-02-10

### Added

- Added [stfloats](https://ctan.org/pkg/stfloats) package to enable footnotes below floats.
- Added `ngerman` as class option for German documents.
- Added macros `\eg` and `\ie`.
- Added macro `\powerset` to correctly typeset the powerset symbol.
- Added example for [forest package](https://ctan.org/pkg/forest).
- Enable deletion of *.bbl when calling `latexmk -c`

### Changed

- Change kind of loading of `cleveref` package.
- Strings for `cleveref` in German are set explicitly.

### Fixed

- There were English words appearing in German documents. [#100](https://github.com/latextemplates/scientific-thesis-template/pull/100) [#103](https://github.com/latextemplates/scientific-thesis-template/issues/103)
- Links to abbreviations work again. [#102](https://github.com/latextemplates/scientific-thesis-template/issues/102)
- Fix spacing between numbers and text in the TOC. [#78](https://github.com/latextemplates/scientific-thesis-template/issues/78)
- `latexhints-minted-german.tex` compiles with pdflatex again
- Fix "LaTeX Warning: Reference `tab:Results' on page 1 undefined on input line 422."

## [3.0.0-beta.3] – 2018-06-06

## Fixed

- German quotes are correct when using `\qq{...}`.
- `.editorconfig` only for `*.tex`, `*.bib`, `*.yaml` to enable seamless editing of `*.cpp`, `*.java`, etc. Fixes [#25](https://github.com/latextemplates/scientific-thesis-template/issues/90).

### Changed

- Bibliography goes before appendix.

## [3.0.0-beta.2] – 2018-06-04

### Added

- LatexDemo to show the LaTeX source code for equations and enumerations and the result in a box next to it.
- ADR-0004 explaining the usage of lualatex for ligature handling.

### Changed

- Moved documentation contents of `README.md` to `docs/index.md`.
- Refined setup instructions.
- Refined overleaf instructions.
- Refined instructions not to use `\\` to separate paragraphs in LaTeX (but to use a blank line).
- Documentation improvements in `config.tex`.

## [3.0.0-beta.1] – 2018-03-12

### Added

- Magic comment `% !TeX TXS-program:compile = txs:///lualatex/[--shell-escape]` to `main-minted-german.tex`.

### Changed

- Default compiler is `lualatex` (instead of `pdflatex`): `% !TeX program` and `.latexmkrc` adapted accordingly.
- Quotes are now made by `\qq{word}` instead of `\enquote{word}` to easy typing.

## [2.5.0] – 2018-03-07

### Added

- Add package [selnolig](https://ctan.org/pkg/selnolig) to correctly handle [ligatures](https://en.wikipedia.org/wiki/Typographic_ligature).
- Add package [tikz-uml](https://perso.ensta-paristech.fr/~kielbasi/tikzuml/) for generating uml diagrams.
- Add package [longtable](https://www.ctan.org/pkg/longtable) for tables over multiple pages.

### Changed

- Monospaced font is now Inconsolata.
- Reorderded `latexhints-*.tex` to keep topics (figures, tables, code) together.
- Switch from `glyphtounicode` to [cmap](https://ctan.org/pkg/cmap) package.

### Fixed

- Fix encoding in PDF bookmarks (pdf.js).
- Compilation with `lualatex` works again.

## [2.4.0] – 2018-02-28

### Added

- Added hint on `\abs` command to `latexhints-*.tex`.
- Added `\initialism` and direct commands (e.g., `BPEL`) to have nice renderings of names of standards.
  Thereby added [lccaps](https://ctan.org/pkg/lccaps) package.
  They are rendered differently in English and German documents.

### Fixed

- Babel shorthands work in English texts, too.
- No more warning of deprecated `firstinits` (fixed by replacing it by `giveninits`).
- In English hints: no more double section "Weitere Illustrationen".

### Changed

- `maxcitenames` of biblatex is now `2` to abbreviate also three authors when using `\Citet{...}`.

### Removed

- Removed outdated hint on `\textsc` in `latexhints-*.tex`.

## [2.3.0] – 2018-02-04

### Changed

- URLs are typeset in monospaced font again. With the change of the font to Times Roman, it looks good in the monospaced font again.
- Replace 1997 [footnote](https://ctan.org/pkg/footnote) package by [footnotehyper](https://ctan.org/pkg/footnotehyper).
- Switch from manual `\clubpenalty` and `\widowpenalty` commands to [nowidow](https://www.ctan.org/pkg/nowidow) package.
- More English translations in `config.tex`.
- Ligatures are disabled for monospaced font. E.g., \texttt{--} stays `--` and is not converted to an en dash.

### Fixed

- Listings rendered by minted are now also shown in the TOC
- latexindent config: `removeSentenceLineBreaks` set to 0 to avoid collapsing of environments

## [2.2.0] – 2018-01-19

### Added

- Added package [upquote](https://ctan.org/pkg/upquote) to enable backticks in verbatim text.

### Changed

- Change package option `final` to `draft=false` to reduce output from KOMA-Script
- Change font text to Times Roman for both English and German templates. Fixes [#48](https://github.com/latextemplates/scientific-thesis-template/issues/48).

## [2.1.1] – 2018-01-18

### Added

- Lines in listings (made by `lstlistings`) are numbered.
- Initial [latexindent](https://ctan.org/pkg/latexindent) config.

### Fixed

- Fixed numbering of minted listings.

## [2.1.0] – 2018-01-16

### Added

- Added `main-minted-german.tex` to show how [minted](https://github.com/gpoore/minted) can be used.
- Added an explanation (`docs/overleaf.md`) with screenshots of how to start at overleaf.

### Changed

- Switched from [subfig](https://ctan.org/pkg/subfig) to [subcaption](https://ctan.org/pkg/subcaption) package
- Enabled line breaks in long urls (which are not separated by spaces or slashes) in the bibliography.
- Option `hyphens` added to package `url`: URLs can now also be hyphenated at hyphens, even though that might be confusing: Is the "-" part of the address or just a hyphen?.
- Switch from `uni-stuttgart-cs-cover.sty` to [scientific-thesis-cover](https://ctan.org/pkg/scientific-thesis-cover).
- Rename `latex-hints-de.tex` to `latexhints-german.tex` to be consistent with the filename pattern for `main-*.tex`.

## [2.0.1] – 2017-12-19

### Added

- Added homepage at <https://github.com/latextemplates/scientific-thesis-template> containing rendered examples created by CircleCI.
- Added [Markdown Architectural Decision Records](https://adr.github.io/madr/) to `docs/adr` folder.

### Changed

- Microtype is now loaded with `babel=true` option. This should lead to even better micro-typographic results.
- Refined styleguide in `config.tex`.
- Refined `README.md`.

### Fixed

- Fix typo in "Bachelor" in `main-paderborn-*.tex`.

## [2.0.0] – 2017-12-18

### Added

- `main-paderborn-english.tex` and `main-paderborn-german.tex`- start documents for Paderborn University.
- `main-english.tex` – start document for English documents.

### Fixed

- Remove outdated section "Using with your own git repository"

### Changed

- The main file for works is `main-german.tex` for German documents.
- No text content in sub files. Most users do not need the split. Advanced users can split the content by themselves.
- All configuration files put in the root folder.
- Remove "CR classification" from `uni-stuttgart-cs-cover.sty`.
- git tags now without `v` prefix.
- Change license to [CC0](https://creativecommons.org/publicdomain/zero/1.0/) to ensure wide use.

## [1.3.0] – 2017-12-11

### Added

- New course "Medieninformatik" (`medinf`)

### Fixed

- Translate float name of 'Algorithmus' environment in English thesis
- Translate float name of 'algorithm' environment only in German thesis

### Changed

- The repository uses the branch `master` as default branch and not `template` anymore.

## [1.2.0] – 2017-07-28

### Changed

- Fixed non-inline todos
- Use German name for 'list of todos' in German thesis

## [1.1.0] – 2017-07-22

### Changed

- English works also take the same heading style than German works (sans serif)
- made font size default again (now 11pt instead of 12pt) to look better
- margins are set in a way that the page content does not "jump" when reading on screen.

## 1.0.0 – 2017-06-16

### Changed

- Start versioning based on the current version at 1.0.0.
- Add initial [CONTRIBUTING.md](CONTRIBUTING.md).
- `number` for a thesis is now completely optional.

[Unreleased]: https://github.com/latextemplates/scientific-thesis-template/compare/2026-10-19...HEAD
[2026-10-19]: https://github.com/latextemplates/scientific-thesis-template/compare/2026-10-16...2026-10-19
[2026-10-16]: https://github.com/latextemplates/scientific-thesis-template/compare/2026-10-15...2026-10-16
[2026-10-15]: https://github.com/latextemplates/scientific-thesis-template/compare/2026-10-14...2026-10-15
[2026-10-14]: https://github.com/latextemplates/scientific-thesis-template/compare/2026-10-08...2026-10-14
[2026-10-08]: https://github.com/latextemplates/scientific-thesis-template/compare/2026-07-30...2026-10-08
[2026-07-30]: https://github.com/latextemplates/scientific-thesis-template/compare/2026-06-30...2026-07-30
[2026-06-30]: https://github.com/latextemplates/scientific-thesis-template/compare/2026-06-25...2026-06-30
[2026-06-25]: https://github.com/latextemplates/scientific-thesis-template/compare/2025-10-25...2026-06-25
[2025-10-25]: https://github.com/latextemplates/scientific-thesis-template/compare/2025-10-20...2025-10-25
[2025-10-20]: https://github.com/latextemplates/scientific-thesis-template/compare/2025-01-26...2025-10-20
[2025-01-26]: https://github.com/latextemplates/scientific-thesis-template/compare/3.0.0...2025-01-26
[3.0.0]: https://github.com/latextemplates/scientific-thesis-template/compare/3.0.0-beta.4...3.0.0
[3.0.0-beta.4]: https://github.com/latextemplates/scientific-thesis-template/compare/3.0.0-beta.3...3.0.0-beta.4
[3.0.0-beta.3]: https://github.com/latextemplates/scientific-thesis-template/compare/3.0.0-beta.2...3.0.0-beta.3
[3.0.0-beta.2]: https://github.com/latextemplates/scientific-thesis-template/compare/3.0.0-beta.1...3.0.0-beta.2
[3.0.0-beta.1]: https://github.com/latextemplates/scientific-thesis-template/compare/2.5.0...3.0.0-beta.1
[2.5.0]: https://github.com/latextemplates/scientific-thesis-template/compare/2.4.0...2.5.0
[2.4.0]: https://github.com/latextemplates/scientific-thesis-template/compare/2.3.0...2.4.0
[2.3.0]: https://github.com/latextemplates/scientific-thesis-template/compare/2.2.0...2.3.0
[2.2.0]: https://github.com/latextemplates/scientific-thesis-template/compare/2.1.1...2.2.0
[2.1.1]: https://github.com/latextemplates/scientific-thesis-template/compare/2.1.0...2.1.1
[2.1.0]: https://github.com/latextemplates/scientific-thesis-template/compare/2.0.1...2.1.0
[2.0.1]: https://github.com/latextemplates/scientific-thesis-template/compare/2.0.0...2.0.1
[2.0.0]: https://github.com/latextemplates/scientific-thesis-template/compare/v1.2.0...2.0.0
[1.3.0]: https://github.com/latextemplates/scientific-thesis-template/compare/v1.2.0...v1.3.0
[1.2.0]: https://github.com/latextemplates/scientific-thesis-template/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/latextemplates/scientific-thesis-template/compare/v1.0.0...v1.1.0

<!-- markdownlint-disable-file MD024 MD033 -->
