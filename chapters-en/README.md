# Chapters

One file per chapter, included by the main file in the order of their numbers.
The numbers go in steps of 10, so a new chapter fits in between, e.g., `25 - my chapter.tex`.
Add it to the main file with `\subfileinclude{chapters-en/25 - my chapter}`.

## Compiling a single chapter

Each chapter compiles on its own, which is much faster than the whole thesis while writing it.
In this directory, run `latexmk "10 - introduction"` (the `.latexmkrc` here takes the settings of the main directory); the result is `10-introduction.pdf`.
The chapter file starts with `\documentclass[../main-english]{subfiles}`: the [subfiles](https://ctan.org/pkg/subfiles) package loads the preamble of that main file.
References to other chapters show as `??` and the bibliography is not printed; the full document has them.
