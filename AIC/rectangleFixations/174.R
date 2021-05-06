library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_174 <- read_tsv("174_rawdata.tsv", comment = "#")

rawdata_174 <- rename(rawdata_174, trial = Trial)
rawdata_174 <- rename(rawdata_174, x = 'L POR X [px]')
rawdata_174 <- rename(rawdata_174, y = 'L POR Y [px]')

rawdata_174 <- rawdata_174 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 174

rectangle174 <- subset(rawdata_174, Time >= 811497495 & Time <= 967225797)

rectangle174$time <- seq.int(nrow(rectangle174))*4
rectangle174 = rectangle174[,-c(1)]

ggplot(rectangle174, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle174_fixations_save <- subset(detect.fixations(rectangle174), event=="fixation")

rectangle174_fixations_save$participant <- 174

#vamos a guardarlo
write_tsv(rectangle174_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/174.tsv")





























