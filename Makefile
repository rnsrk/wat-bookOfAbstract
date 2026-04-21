# Lokaler Build: pdfLaTeX + Biber (biblatex)
MAIN = main
PDFLATEX = pdflatex
BIBER = biber
FLAGS = -interaction=nonstopmode -file-line-error

.PHONY: all clean

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex references.bib
	$(PDFLATEX) $(FLAGS) $(MAIN).tex
	$(BIBER) $(MAIN)
	$(PDFLATEX) $(FLAGS) $(MAIN).tex

clean:
	rm -f $(MAIN).{aux,bcf,bbl,blg,log,out,toc,pdf,synctex.gz,fdb_latexmk,fls}
