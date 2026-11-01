# Kapitel

Eine Datei pro Kapitel, eingebunden von der Hauptdatei in der Reihenfolge ihrer Nummern.
Die Nummern steigen in Zehnerschritten, damit ein neues Kapitel dazwischen passt, z. B. `25 - mein kapitel.tex`.
Es wird in der Hauptdatei mit `\subfileinclude{chapters-de/25 - mein kapitel}` eingebunden.

## Ein einzelnes Kapitel übersetzen

Jedes Kapitel lässt sich für sich übersetzen, was beim Schreiben deutlich schneller geht als die ganze Arbeit.
In diesem Verzeichnis: `latexmk "10 - einleitung"` (die `.latexmkrc` hier übernimmt die Einstellungen des Hauptverzeichnisses); das Ergebnis ist `10-einleitung.pdf`.
Die Kapiteldatei beginnt mit `\documentclass[../main-german]{subfiles}`: Das Paket [subfiles](https://ctan.org/pkg/subfiles) lädt die Präambel dieser Hauptdatei.
Verweise auf andere Kapitel erscheinen als `??`, und das Literaturverzeichnis fehlt; beides gibt es im Gesamtdokument.
