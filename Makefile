all: resume.tex
	xelatex resume

clean:
	rm -rf *.xml *.aux *.out *.log *.bib *.bcf

cleanall:
	rm -rf *.xml *.aux *.out *.log *.bib *.bcf *.pdf
