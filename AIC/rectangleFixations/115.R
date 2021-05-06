library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_115 <- read_tsv("115_rawdata.tsv", comment = "#")

rawdata_115 <- rename(rawdata_115, trial = Trial)
rawdata_115 <- rename(rawdata_115, x = 'L POR X [px]')
rawdata_115 <- rename(rawdata_115, y = 'L POR Y [px]')

rawdata_115 <- rawdata_115 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 115

rectangle115 <- subset(rawdata_115, Time >= 290385730 & Time <= 324321960)

rectangle115$time <- seq.int(nrow(rectangle115))*4
rectangle115 = rectangle115[,-c(1)]

ggplot(rectangle115, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle115_fixations_save <- subset(detect.fixations(rectangle115), event=="fixation")

rectangle115_fixations_save$participant <- 115

#vamos a guardarlo
write_tsv(rectangle115_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/115.tsv")






















