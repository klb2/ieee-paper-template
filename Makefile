TEXFILE = main

.PHONY: pdf
pdf:
	latexmk -pdf ${TEXFILE}.tex

.PHONY: full
full: clean pdf
	makeglossaries "${TEXFILE}"
	pdflatex "${TEXFILE}.tex"

.PHONY: clean
clean:
	latexmk -C
	rm -f ${TEXFILE}.acn
	rm -f ${TEXFILE}.acr
	rm -f ${TEXFILE}.alg
	rm -f ${TEXFILE}.auxlock
	rm -f ${TEXFILE}.bbl
	rm -f ${TEXFILE}.run.xml
	rm -f ${TEXFILE}.synctex.gz
	rm -f ${TEXFILE}.xdy
