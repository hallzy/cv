all: resume.tex resume-no-phone.tex
	xelatex resume
	xelatex resume-no-phone

clean:
	rm -rf *.xml *.aux *.out *.log *.bib *.bcf

cleanall:
	rm -rf *.xml *.aux *.out *.log *.bib *.bcf *.pdf
