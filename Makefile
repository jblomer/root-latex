MAINFILE = template
EXTRAS = beamer-settings.tex sticky-notes.tex extras.tex
GENPICS = 
PICTURES = $(GENPICS) $(wildcard img/*)
PDFLATEX_OPTS = -halt-on-error -interaction=nonstopmode
PREVIEWER = okular 

.PHONY = open clean

all: $(MAINFILE).pdf

$(MAINFILE).pdf: $(MAINFILE).tex $(EXTRAS) $(PICTURES)
	pdflatex $(PDFLATEX_OPTS) \
	  $(MAINFILE) > $(MAINFILE).pdflatex || \
	  (rm -f $(MAINFILE).pdf && cat $(MAINFILE).pdflatex && false)
	pdflatex $(PDFLATEX_OPTS) $(MAINFILE) > /dev/null

open: $(MAINFILE).pdf
	$(PREVIEWER) $(MAINFILE).pdf &

clean:
	rm -f *.aux \
	  $(GENPICS) \
	  $(MAINFILE).pdf \
	  $(MAINFILE).pdflatex \
	  $(MAINFILE).log \
	  $(MAINFILE).out \
	  $(MAINFILE).nav \
	  $(MAINFILE).tpt \
	  $(MAINFILE).snm \
	  $(MAINFILE).toc \
	  $(MAINFILE).vrb

