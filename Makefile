# Executables

## Required for thumbpdf as latexmk does not support thumbpdf by itself
latexcompiler = lualatex

## PDF viewer: Sumatra PDF on Windows (reloads the PDF automatically), the default viewer otherwise
ifeq ($(OS),Windows_NT)
viewer = 'C:/Program Files/SumatraPDF/SumatraPDF.exe'
else ifeq ($(shell uname -s),Darwin)
viewer = open
else
viewer = xdg-open
endif

## The LaTeX tools run in the TeX Live Docker image (see README.md); "make LOCAL=1" uses the local LaTeX distribution
ifeq ($(LOCAL),)
ifeq ($(OS),Windows_NT)
RUN = docker run --rm -v "$(CURDIR):/workdir" -w /workdir registry.gitlab.com/islandoftex/images/texlive:latest
else
RUN = docker run --rm -u $(shell id -u):$(shell id -g) -e HOME=/tmp -v "$(CURDIR):/workdir" -w /workdir registry.gitlab.com/islandoftex/images/texlive:latest
endif
endif

## Editor
editor = gedit

# Files

## Main file name and literature list
MASTER_TEX = main-english.tex
LITERATURE = bibliography.bib

## Derived file names
SRC = $(shell basename $(MASTER_TEX) .tex)
TEX_FILES = $(wildcard *.tex content/*.tex)
## All main files, including variants of MASTER_TEX (e.g., other languages): "make format" indents each of them
MAIN_TEX_FILES = $(wildcard main*.tex)
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
	$(RUN) latexmk $(MASTER_TEX)

clean:
	$(RUN) latexmk -C

## Endversion - mit eingebauter Seitenvorschau
## Mehrere Durchlaeufe, da bei longtable einige runs mehr vonnoeten sind...
final: $(PDF)
	$(RUN) thumbpdf $(PDF)
	$(RUN) $(latexcompiler) $(MASTER_TEX)

mrproper: clean
	rm -f *~


# Verschiedene Ausgabformate

pdf: $(PDF)

stand: $(PDF)
	cp $(PDF) "Ausarbeitung - Stand $(date).pdf"

html: clean pdf
	rm $(AUX)
	$(RUN) htlatex $(SRC) "html,word,charset=utf8" " -utf8"


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

## Spelling, grammar, and style with TeXtidote (https://github.com/sylvainhalle/textidote): writes textidote.html
## Needs Java (contained in the Docker image); the options are in .textidote.
## -Djdk.xml.totalEntitySizeLimit=0: TeXtidote 0.9 fails on Java 24+ otherwise (fixed after 0.9: sylvainhalle/textidote#274)
textidote.jar:
	curl -sSfL -o $@ https://github.com/sylvainhalle/textidote/releases/download/v0.9/textidote.jar

textidote: textidote.jar
	@# TeXtidote exits with the number of findings, which is no failure here
	$(RUN) java -Djdk.xml.totalEntitySizeLimit=0 -jar textidote.jar --output html $(MASTER_TEX) > textidote.html || test -s textidote.html
	@echo "Report: textidote.html"

## Show only the relevant messages of the last LaTeX run
log:
	$(RUN) texlogsieve --no-heartbeat $(SRC).log

showundef:
	grep undefined $(LOG)


## Reformatierung

format:
	for f in $(MAIN_TEX_FILES); do $(RUN) latexindent -l -s -sl -w "$$f" || exit 1; done

indent:
	$(RUN) latexindent -y="indentPreamble:1,defaultIndent:'  '" -m -w $(SRC)

split-sentences:
	$(RUN) latexindent -m -l -s -sl -w $(SRC)
