# Schreiben in Markdown {#sec:markdown-file}

Dieses Kapitel ist in reinem Markdown geschrieben, nicht in \LaTeX{}.
Die Quelle ist eine Markdown-Datei im Verzeichnis `chapters`.
Die Hauptdatei bindet sie mit dem Befehl `markdownInput` des [markdown-Pakets](https://ctan.org/pkg/markdown) ein, und \LaTeX{} übernimmt den Satz.
Dafür wird \hologo{LuaLaTeX} benötigt.

## Text

Text kann *hervorgehoben* oder **fett** sein, und `Code` wird in einer Schrift mit fester Breite gesetzt.
Ein Literaturverweis sieht so aus [@mwe], und hier ist eine Fußnote.^[Das ist eine Fußnote im Text.]

> Ein Zitat ist ein Absatz, der mit einem Größer-als-Zeichen beginnt.

## Listen

- erster Punkt
- zweiter Punkt
  - Unterpunkt

1) erstens
2) zweitens

## Tabellen und Verweise

| Rechts | Links | Zentriert |
|-------:|:------|:---------:|
|     12 | 12    |    12     |
|    123 | 123   |    123    |

: Eine in Markdown geschriebene Tabelle {#tbl:markdown-chapter}

<#tbl:markdown-chapter> zeigt eine Tabelle mit Beschriftung.
Überschriften und Tabellen erhalten eine Kennung in geschweiften Klammern, auf die in spitzen Klammern verwiesen wird.
Beispielsweise gibt <#sec:latexhints> Hinweise zum Schreiben in \LaTeX{}.
