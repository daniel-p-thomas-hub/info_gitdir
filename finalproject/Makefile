## report: Generate final analysis report.
# rule for making report
report.html:	R/report.Rmd plots/plot1.png 
	cd R; Rscript -e "rmarkdown::render('report.Rmd', output_file = '../report.html')"

## plot1.png: Produce the plot png file.
# rule for making the plot
plots/plot1.png: R/make_plot1.R
	Rscript R/make_plot1.R

## help: Echo some helpful information about the Makefile.
# rule for making help
.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<

## build: Build the docker image.
# rule for building docker image
.PHONY: build
build: Makefile
	docker build -t finproj .