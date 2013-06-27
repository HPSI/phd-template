.PHONY: all clean clean-files clean-figs

LATEX = xelatex
LATEX_OPTIONS =
TARGET_EN = thesis.pdf
TARGET_GR = thesis_gr.pdf
TARGET = $(TARGET_GR)
TARGET_BASE = $(basename $(TARGET))
SOURCES_EN = intro.tex
SOURCES_GR = intro_gr.tex
INC = $(SOURCES_GR)

CLEANFILES = $(TARGET_BASE).pdf \
	*.ps *.log *.bak *.bbl *.aux *.blg *.dvi *.toc *.out *.lof *.lot *.loa *.ind *.idx *.ilg

RM = /bin/rm -f
figdir = ./figs
figs = ntua_logo.eps

all: $(TARGET)
clean: clean-files clean-figs

$(TARGET): $(figs) $(TARGET_BASE).bbl $(TARGET_BASE).tex $(INC) cslabthesis.cls bkkalgo.sty
	outfile=`mktemp`; \
	echo 'Rerun' > $$outfile; \
	until ! grep 'Rerun' $$outfile; do \
		$(LATEX) $(LATEX_OPTIONS) $(TARGET_BASE).tex | tee $$outfile; \
	done; \
	$(RM) $$outfile

$(TARGET_BASE).bbl: $(TARGET_BASE).bib
	$(LATEX) $(LATEX_OPTIONS) $(TARGET_BASE).tex && bibtex $(TARGET_BASE); \
	outfile=`mktemp`; \
	echo 'Rerun' > $$outfile; \
	until ! grep 'Rerun' $$outfile; do \
		$(LATEX) $(LATEX_OPTIONS) $(TARGET_BASE).tex | tee $$outfile; \
	done; \
	$(RM) $$outfile

%.eps: %.pdf
	@echo Converting $< to $@ ...; \
	pdftops -eps $<

clean-files:
	$(RM) $(CLEANFILES)

clean-figs:
	$(RM) $(figs)
