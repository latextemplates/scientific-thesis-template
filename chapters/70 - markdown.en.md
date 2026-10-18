# Writing in Markdown {#sec:markdown-file}

This chapter is written in plain Markdown, not in \LaTeX{}.
Its source is a Markdown file in the `chapters` directory.
The main file includes it with the `markdownInput` command of the [markdown package](https://ctan.org/pkg/markdown), and \LaTeX{} takes care of the typesetting.
This needs \hologo{LuaLaTeX}.

## Text

Text can be *emphasized* or **bold**, and `code` is set in a monospaced font.
A citation looks like this [@mwe], and here is a footnote.^[This is an inline footnote.]

> A quote is a paragraph starting with a greater-than sign.

## Lists

- first point
- second point
  - sub-point

1) firstly
2) secondly

## Tables and references

| Right | Left | Centered |
|------:|:-----|:--------:|
|    12 | 12   |    12    |
|   123 | 123  |   123    |

: A table written in Markdown {#tbl:markdown-chapter}

<#tbl:markdown-chapter> shows a table with caption.
Headings and tables get an identifier in curly braces, which is referenced in angle brackets.
For instance, <#sec:latexhints> presents hints on writing \LaTeX{}.
