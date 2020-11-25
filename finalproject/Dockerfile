FROM rocker/tidyverse

RUN Rscript -e "install.packages('BiocManager')"

RUN mkdir /project

COPY ./ /project/

RUN chmod +x /project/R/*.R

CMD /usr/bin/bash

