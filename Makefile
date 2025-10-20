# Executables

## Required for thumbpdf as latexmk does not support thumbpdf by itself
latexcompiler = lualatex

## evince at linux
viewer = 'C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe'

## Editor
editor = gedit

# Files

## Main file name and literature list
MASTER_TEX = main-english.tex
LITERATURE = bibliography.bib

## Derived file names
SRC = $(shell basename $(MASTER_TEX) .tex)
TEX_FILES = $(wildcard *.tex content/*.tex)
GFX_FILES = $(wildcard figures/*)

PDF = $(SRC).pdf
AUX = $(SRC).aux

# Other

date=$(shell date +%Y%m%d%H%M)

# Tasks


## was wird gemacht, falls nur make aufgerufen wird
## hier sollte noch der aspell check rein für jedes file einzeln über for schleife
all: $(PDF)
.PHONY: $(PDF)

compile: $(PDF)

$(PDF): $(MASTER_TEX) $(LITERATURE) $(TEX_FILES) $(GFX_FILES)
	latexmk $(MASTER_TEX)

clean:
	latexmk -C

## Endversion - mit eingebauter Seitenvorschau
## Mehrere Durchlaeufe, da bei longtable einige runs mehr vonnoeten sind...
final: $(PDF)
	thumbpdf $(PDF)
	$(latexcompiler) $(MASTER_TEX)

mrproper: clean
	rm -f *~


# Verschiedene Ausgabformate

pdf: $(PDF)

stand: $(PDF)
	cp $(PDF) "Ausarbeitung - Stand $(date).pdf"

html: clean pdf
	rm $(AUX)
	htlatex $(SRC) "html,word,charset=utf8" " -utf8"


# Tools

view: pdf
	$(viewer) $(PDF)&

edit:
	$(viewer) $(PDF)&
	$(editor) *.tex&


# Support

## Rechtschreibung
##
## Das Ganze am Besten vor der final und als eigene Version ala "make aspell"
##
## .aspell.conf - zu ignorierende LaTeX-Befehle
##   Schreiben der LaTeX-Befehle in eine config Dateiname. Sieht so aus:
##   add-tex-command democommand PO // PO := prüfe []{} ;; po := ignoriere []{}
##
## .aspell.en.pws - persönliches Wörterbuch
aspell:
	for tex in $(TEX_FILES);
		do
			aspell --mode=tex -l en_US --encoding=utf-8 --conf=./.aspell.conf -p ./.aspell.en.pws -c $$tex;
		done

showundef:
	grep undefined $(LOG)


## Reformatierung

format:
	latexindent -l -s -sl -w $(SRC)

indent:
	latexindent -y="indentPreamble:1,defaultIndent:'  '" -m -w $(SRC)

split-sentences:
	latexindent -m -l -s -sl -w $(SRC)
