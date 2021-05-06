library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_3 <- read_tsv("3_rawdata.tsv", comment = "#")

rawdata_3 <- rename(rawdata_3, trial = Trial)
rawdata_3 <- rename(rawdata_3, x = 'L POR X [px]')
rawdata_3 <- rename(rawdata_3, y = 'L POR Y [px]')

rawdata_3 <- rawdata_3 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 3

rectangle3 <- subset(rawdata_3, Time >= 2330805566 & Time <= 2361826836)

rectangle3$time <- seq.int(nrow(rectangle3))*4
rectangle3 = rectangle3[,-c(1)]

ggplot(rectangle3, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle3_fixations_save <- subset(detect.fixations(rectangle3), event=="fixation")

rectangle3_fixations_save$participant <- 3


#vamos a guardarlo
write_tsv(rectangle3_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/3.tsv")










