library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_73 <- read_tsv("73_rawdata.tsv", comment = "#")

rawdata_73 <- rename(rawdata_73, trial = Trial)
rawdata_73 <- rename(rawdata_73, x = 'L POR X [px]')
rawdata_73 <- rename(rawdata_73, y = 'L POR Y [px]')

rawdata_73 <- rawdata_73 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 73

rectangle73 <- subset(rawdata_73, Time >= 381358417 & Time <= 457129070)

rectangle73$time <- seq.int(nrow(rectangle73))*4
rectangle73 = rectangle73[,-c(1)]

ggplot(rectangle73, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle73_fixations_save <- subset(detect.fixations(rectangle73), event=="fixation")

rectangle73_fixations_save$participant <- 73

#vamos a guardarlo
write_tsv(rectangle73_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/73.tsv")























