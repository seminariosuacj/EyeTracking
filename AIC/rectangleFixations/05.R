library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_5 <- read_tsv("5_rawdata.tsv", comment = "#")

rawdata_5 <- rename(rawdata_5, trial = Trial)
rawdata_5 <- rename(rawdata_5, x = 'L POR X [px]')
rawdata_5 <- rename(rawdata_5, y = 'L POR Y [px]')

rawdata_5 <- rawdata_5 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 5

rectangle5 <- subset(rawdata_5, Time >= 10903541999 & Time <= 10951082611)

rectangle5$time <- seq.int(nrow(rectangle5))*4
rectangle5 = rectangle5[,-c(1)]

ggplot(rectangle5, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle5_fixations_save <- subset(detect.fixations(rectangle5), event=="fixation")

rectangle5_fixations_save$participant <- 5

#vamos a guardarlo
write_tsv(rectangle5_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/5.tsv")


