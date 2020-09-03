# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

### Added

### Changed

### Fixed

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

[Unreleased]: https://github.com/latextemplates/scientific-thesis-template/compare/3.0.0...HEAD
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
