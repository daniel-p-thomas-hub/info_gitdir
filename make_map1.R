#! /usr/bin/Rscript

# read data
data <- read.csv("data.txt", header = T)

# make and save map
png("map1.png")
tm_shape(counties) + 
      tm_fill('totalcases',
                style = 'quantile',
                palette = 'BuPu',
                title = 'Cases') + 
  tm_borders(alpha = 0.2) +
    tm_credits('Source: The New York Times',
                 position = c('RIGHT', 'TOP')) + 
  tm_layout(main.title = 'Total COVID-19 Cases by County',
              main.title.size = 1.2,
              legend.title.size = .8,
              legend.text.size = .6,
              legend.position = c('LEFT', 'BOTTOM'))
dev.off()
