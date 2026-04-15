# Local build: pdfLaTeX + BibTeX (same engine as Overleaf default)
MAIN = main
PDFLATEX = pdflatex
FLAGS = -interaction=nonstopmode -file-line-error

.PHONY: all clean

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex references.bib
	$(PDFLATEX) $(FLAGS) $(MAIN).tex
	bibtex $(MAIN)
	$(PDFLATEX) $(FLAGS) $(MAIN).tex
	$(PDFLATEX) $(FLAGS) $(MAIN).tex

clean:
	rm -f $(MAIN).{aux,bbl,blg,log,out,toc,pdf,synctex.gz,fdb_latexmk,fls}
