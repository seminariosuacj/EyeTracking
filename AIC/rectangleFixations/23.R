library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_23 <- read_tsv("23_rawdata.tsv", comment = "#")

rawdata_23 <- rename(rawdata_23, trial = Trial)
rawdata_23 <- rename(rawdata_23, x = 'L POR X [px]')
rawdata_23 <- rename(rawdata_23, y = 'L POR Y [px]')

rawdata_23 <- rawdata_23 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 23

rectangle23 <- subset(rawdata_23, Time >= 32985755058 & Time <= 33027404248)

rectangle23$time <- seq.int(nrow(rectangle23))*4
rectangle23 = rectangle23[,-c(1)]

ggplot(rectangle23, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle23_fixations_save <- subset(detect.fixations(rectangle23), event=="fixation")

rectangle23_fixations_save$participant <- 23

#vamos a guardarlo
write_tsv(rectangle23_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/23.tsv")









