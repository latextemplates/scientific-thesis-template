viewer = evince
editor = gedit

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

##
# Einige nicht standart Styles die noch unbedingt installiert werden müssen.
rcs.sty:
	wget ftp://dante.ctan.org/tex-archive/macros/latex/contrib/rcs/rcs.sty

todonotes.sty:
	wget ftp://dante.de/tex-archive/macros/latex/contrib/todonotes/todonotes.sty
	wget ftp://dante.de/tex-archive/macros/latex/contrib/todonotes/todonotes.ins
	wget ftp://dante.de/tex-archive/macros/latex/contrib/todonotes/todonotes.dtx

tabulary.ins:
	wget ftp://dante.ctan.org/tex-archive/macros/latex/contrib/tabulary/tabulary.dtx
	wget ftp://dante.ctan.org/tex-archive/macros/latex/contrib/tabulary/tabulary.ins

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
#
##

# Die Dokumentationen aller verwendeten Packages. Weitere Dokus von Hand einfügen.
# Geht bestimmt auch hübscher.
dokumentationen:
	mkdir Dokus
	cd ./Dokus
	wget -N ftp://dante.ctan.org/tex-archive/macros/latex/contrib/rcs/rcs-conf.pdf
	wget -N ftp://dante.ctan.org/tex-archive/macros/latex/contrib/rcs/rcs-user.pdf
	wget -N ftp://dante.ctan.org/tex-archive/macros/latex/contrib/todonotes/todonotes.pdf
	wget -N ftp://dante.ctan.org/tex-archive/macros/latex/contrib/algorithms/algorithms.pdf
	wget -N ftp://dante.ctan.org/tex-archive/macros/latex/contrib/tabulary/tabulary.pdf
	wget -N ftp://dante.ctan.org/tex-archive/macros/latex/contrib/microtype/microtype.pdf
	wget -N ftp://dante.ctan.org/tex-archive/macros/latex/contrib/xcolor/xcolor.pdf
	wget -N ftp://dante.ctan.org/tex-archive/macros/latex/contrib/xcolor/xcolor2.pdf
	wget -N ftp://dante.ctan.org/tex-archive/macros/latex/contrib/paralist/paralist.pdf
	wget -N ftp://dante.ctan.org/tex-archive/macros/latex/contrib/svninfo/svninfo.pdf
	wget -N ftp://dante.ctan.org/tex-archive/macros/latex/contrib/fncychap/fncychap.pdf
	wget -N ftp://dante.ctan.org/tex-archive/macros/latex/contrib/listings/listings.pdf
	wget -N ftp://dante.ctan.org/tex-archive/macros/latex/contrib/fancyvrb/fancyvrb.pdf
	wget -N ftp://dante.ctan.org/tex-archive/macros/latex/contrib/caption/caption.pdf
	wget -N ftp://dante.ctan.org/tex-archive/macros/latex/contrib/floatrow/floatrow.pdf
	wget -N ftp://dante.ctan.org/tex-archive/macros/latex/contrib/subfig/subfig.pdf
	wget -N ftp://tug.ctan.org/tex-archive/macros/latex/contrib/yafoot/yafoot-man.pdf
	wget -N ftp://dante.ctan.org/tex-archive/macros/latex/contrib/hyperref/*.pdf

# Einmal initial alle Dokumentationen ziehen mit "dokumentation.pdf"
# tabulary.sty algorithm.sty lmodern.sty microtype.sty todonotes.sty dokumentation.pdf
fetchstys: tabulary.sty algorithm.sty lmodern.sty microtype.sty todonotes.sty

