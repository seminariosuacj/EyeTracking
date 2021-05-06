library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_37 <- read_tsv("37_rawdata.tsv", comment = "#")

rawdata_37 <- rename(rawdata_37, trial = Trial)
rawdata_37 <- rename(rawdata_37, x = 'L POR X [px]')
rawdata_37 <- rename(rawdata_37, y = 'L POR Y [px]')

rawdata_37 <- rawdata_37 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 37

rectangle37 <- subset(rawdata_37, Time >= 430733716 & Time <= 474530052)

rectangle37$time <- seq.int(nrow(rectangle37))*4
rectangle37 = rectangle37[,-c(1)]

ggplot(rectangle37, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle37_fixations_save <- subset(detect.fixations(rectangle37), event=="fixation")

rectangle37_fixations_save$participant <- 37

#vamos a guardarlo
write_tsv(rectangle37_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/37.tsv")


