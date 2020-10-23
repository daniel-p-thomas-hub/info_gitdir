#! /usr/bin/Rscript

# read data
data <- read.csv("us-counties.csv")

# examine data
dim(data)
summary(data)

# clean data
data <- data %>%
      filter(is.na(fips) == F) 

  options(tigris_use_cache = T)
  us <- counties(cb = TRUE, resolution = '5m',
                 class = 'sf',
                 year = 2019) %>%
    st_transform(5070)

us <- us %>%
      filter(!(STATEFP %in% c('02', '15', '66', '60', '78', '72', '69')))

  data$fips <- as.character(data$fips)

counties <- us %>%
      left_join(data, by = c('GEOID' = 'fips')) %>%
        group_by(county) %>%
          summarise(totalcases = sum(cases))

# save data
write.table(data, "data.txt", quote = F, row.names = F)
