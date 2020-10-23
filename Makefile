## report	: Generate final analysis report.
# rule for making report
report: data.txt report.Rmd map1.png
		Rscript -e "rmarkdown::render('report.Rmd', quiet = TRUE)"

## install	: Install any R packages or software needed for the analysis.
# rule for installing R packages
install: packages.R
	chmod +x packages.R
	Rscript packages.R

## data.txt	: Import and clean the data.
# rule for cleaning data
data.txt: cleandata.R us-counties.csv
		chmod +x cleandata.R && \
		Rscript cleandata.R

## map1.png	: Produce the map png file.
# rule for making the figure
map1.png: make_map1.R data.txt
		chmod +x make_map1.R && \
		Rscript make_map1.R

## help 	: Echo some helpful information about the Makefile.
# rule for making help
.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<
