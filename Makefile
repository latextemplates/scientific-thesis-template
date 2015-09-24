viewer = evince
editor = gedit

# Main file name and literature list
MASTER_TEX = ausarbeitung.tex
LITERATURE = bibliography.bib

latex = pdflatex -shell-escape
bibtex = biber

SRC = $(shell basename $(MASTER_TEX) .tex)
TEX_FILES = $(wildcard preambel/*.tex content/*.tex)
GFX_FILES = $(wildcard graphics/*)

PDF = $(SRC).pdf
AUX = $(SRC).aux

date=$(shell date +%Y%m%d%H%M)

# was wird gemacht, falls nur make aufgerufen wird
#hier sollte noch der aspell check rein für jedes file einzeln über for schleife
all: $(PDF)
.PHONY: $(PDF)

$(PDF): $(TEX_FILES) $(GFX_FILES) $(SRC).bbl
	$(latex) $(MASTER_TEX)
	@if grep -q "LaTeX Warning: There were undefined references." $(SRC).log; then \
		if grep -q "LaTeX Warning: Citation" $(SRC).log; then \
			$(bibtex) $(SRC); \
		fi; \
		$(latex) $(MASTER_TEX); \
	fi
	@while grep -q "LaTeX Warning: Label(s) may have changed" $(SRC).log; do \
		$(latex) $(MASTER_TEX); \
	done

$(SRC).bbl: $(LITERATURE)
	@if test ! -f $(SRC).aux; then \
		$(latex) $(MASTER_TEX); \
	fi
	$(bibtex) $(SRC)

clean: 
	@rm -f $(SRC).4ct $(SRC).4tc $(SRC).alg $(SRC).aux $(SRC).bbl $(SRC).blg $(SRC).brf $(SRC).code $(SRC).dvi $(SRC).err $(SRC).glo $(SRC).gls $(SRC).hp \
	$(SRC).idv $(SRC).lo? $(SRC).log $(SRC).lot $(SRC).out $(SRC).tmp $(SRC).toc $(SRC).tpt $(SRC).lbl $(SRC).idx \
	$(SRC).ilg $(SRC).ind $(SRC).ps $(SRC).xref $(SRC).code $(SRC).html $(SRC).css $(SRC).lg $(SRC).thm \
	$(SRC).synctex.gz $(SRC).fls $(SRC).fdb_latexmk $(SRC).bcf $(SRC).run.xml

# Endversion - mit eingebauter Seitenvorschau
# mehrere Durchlaeufe, da bei longtable einige runs mehr vonnoeten sind...
final: $(PDF)
	$(latex) $(MASTER_TEX)
	$(latex) $(MASTER_TEX)
	$(latex) $(MASTER_TEX)
	$(latex) $(MASTER_TEX)
	thumbpdf $(PDF)
	$(latex) $(MASTER_TEX)

mrproper: clean
	rm -f *~

ps: $(PDF)
	pdftops $(PDF)

pdf: $(PDF)

view: pdf
	$(viewer) $(PDF)&

edit:
	$(viewer) $(PDF)&
	$(editor) *.tex&

6: ps
	psnup -6 $(SRC).ps > 6.ps

stand: $(PDF)
	cp $(PDF) "Ausarbeitung - Stand $(date).pdf"

standps: ps
	psnup -2 $(SRC).ps > "Ausarbeitung - Stand $(date).ps"

##
# Das ganze am Besten vor der final und als eigene Version ala make spellcheck
# aspell line: aspell -t -l de_DE -d german -c --per-conf= "Dateiname" *.tex -T utf-8 --encoding=utf-8
# Schreiben der LaTeX-Befehle in eine config Dateiname. Sieht so aus
# add-tex-command begin PO // PO := prüfe []{} ;; po := ignoriere []{}
# Leerzeichen ungleich Tabs !!!
# Config File nicht vergessen
aspell:
	for tex in $(TEX_FILES);	\
		do	\
			aspell -t -l de_DE -d german -T utf-8 -c $$tex --encoding=utf-8;	\
		done
#
##

html: clean pdf
	rm $(AUX)
	htlatex $(SRC)
