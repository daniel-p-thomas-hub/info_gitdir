#! /usr/bin/Rscript

setwd("/project")

if (!requireNamespace("BiocManager"))
  install.packages("BiocManager")
BiocManager::install()

library(BiocManager)

# read data
chimpgenes <- read.table("PanTro6genes.txt", comment = "", header = T)

# examine data
dim(chimpgenes)
summary(chimpgenes)

# clean data
chimpgenes <- na.omit(chimpgenes)

# make new variable
length <- chimpgenes$txEnd - chimpgenes$txStart

# make and save plot
png("plots/plot1.png")
hist(log(length), 50, main = "Chimpanzee", xlab = "log base pairs")
dev.off()
