viewer = xpdf
editor = emacs

# Main file name and literature list
MASTER_TEX = ausarbeitung.tex
LITERATURE = bibliography/bibliography.bib

latex = pdflatex
bibtex = bibtex

SRC = $(shell basename $(MASTER_TEX) .tex)
TEX_FILES = $(wildcard preambel/*.tex content/*.tex)
GFX_FILES = $(wildcard graphics/*)

PDF = $(SRC).pdf

date=$(shell date +%Y%m%d%H%M)

# was wird gemacht, falls nur make aufgerufen wird
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
	@rm -f $(SRC).4ct $(SRC).4tc $(SRC).aux $(SRC).bbl $(SRC).blg $(SRC).brf $(SRC).code $(SRC).dvi $(SRC).err $(SRC).glo $(SRC).gls $(SRC).hp \
	$(SRC).idv $(SRC).lo? $(SRC).log $(SRC).lot $(SRC).out $(SRC).tmp $(SRC).toc $(SRC).tpt $(SRC).lbl $(SRC).idx \
	$(SRC).ilg $(SRC).ind $(SRC).ps $(SRC).xref $(SRC).code $(SRC).html $(SRC).css $(SRC).lg

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
	cp $(PDF) "/tmp/Ausarbeitung - Stand $(date).pdf"

standps: ps
	psnup -2 $(SRC).ps > "/tmp/Ausarbeitung - Stand $(date).ps"

	
# fetchstys
	
rcs.sty:
	wget ftp://dante.ctan.org/tex-archive/macros/latex/contrib/rcs/rcs.sty

tabulary.ins:
	wget ftp://dante.ctan.org/tex-archive/macros/latex/contrib/tabulary/tabulary.ins
	wget ftp://dante.ctan.org/tex-archive/macros/latex/contrib/tabulary/tabulary.dtx

microtype.ins:
	wget ftp://dante.ctan.org/tex-archive/macros/latex/contrib/microtype/microtype.ins
	wget ftp://dante.ctan.org/tex-archive/macros/latex/contrib/microtype/microtype.dtx

lmodern.sty:
	wget -r -l1 -nd ftp://dante.ctan.org/tex-archive/fonts/lm/tex/latex/lm/

algorithm.sty:
	wget ftp://dante.ctan.org/tex-archive/macros/latex/contrib/algorithms/algorithm.sty
	wget ftp://dante.ctan.org/tex-archive/macros/latex/contrib/algorithms/algorithmic.sty

%.sty: %.ins
	tex $? 
	rm -f $*.ins $*.dtx $*.log

fetchstys: algorithm.sty lmodern.sty microtype.sty tabulary.sty
