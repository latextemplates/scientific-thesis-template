sources = main.tex

.PHONY: clean reformat split-sentences indent

compile: $(sources)
	latexmk $(sources)

format:
	latexindent -l -s -sl -w $(sources)

indent:
	latexindent -y="indentPreamble:1,defaultIndent:'  '" -m -w $(sources)

split-sentences:
	latexindent -m -l -s -sl -w $(sources)

clean:
	latexmk -c
