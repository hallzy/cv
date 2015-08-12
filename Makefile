all: resume.tex
	xelatex resume

clean:
	rm -rf resume.run.xml resume.aux resume.out resume.log resume-blx.bib resume.bcf

cleanall:
	rm -rf resume.run.xml resume.aux resume.out resume.pdf resume.log resume-blx.bib resume.bcf
