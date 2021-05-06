library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_116 <- read_tsv("116_rawdata.tsv", comment = "#")

rawdata_116 <- rename(rawdata_116, trial = Trial)
rawdata_116 <- rename(rawdata_116, x = 'L POR X [px]')
rawdata_116 <- rename(rawdata_116, y = 'L POR Y [px]')

rawdata_116 <- rawdata_116 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 116

rectangle116 <- subset(rawdata_116, Time >= 2674957043 & Time <= 2704521519)

rectangle116$time <- seq.int(nrow(rectangle116))*4
rectangle116 = rectangle116[,-c(1)]

ggplot(rectangle116, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle116_fixations_save <- subset(detect.fixations(rectangle116), event=="fixation")

rectangle116_fixations_save$participant <- 116

#vamos a guardarlo
write_tsv(rectangle116_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/116.tsv")

























