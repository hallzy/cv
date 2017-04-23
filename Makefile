all: resume.tex resume_non_technical.tex
	xelatex resume
	xelatex resume_non_technical

clean:
	rm -rf *.xml *.aux *.out *.log *.bib *.bcf

cleanall:
	rm -rf *.xml *.aux *.out *.log *.bib *.bcf *.pdf
