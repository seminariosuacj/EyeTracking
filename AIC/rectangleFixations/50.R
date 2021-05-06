library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_50 <- read_tsv("50_rawdata.tsv", comment = "#")

rawdata_50 <- rename(rawdata_50, trial = Trial)
rawdata_50 <- rename(rawdata_50, x = 'L POR X [px]')
rawdata_50 <- rename(rawdata_50, y = 'L POR Y [px]')

rawdata_50 <- rawdata_50 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 50

rectangle50 <- subset(rawdata_50, Time >= 5291493575 & Time <= 5356104451)

rectangle50$time <- seq.int(nrow(rectangle50))*4
rectangle50 = rectangle50[,-c(1)]

ggplot(rectangle50, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle50_fixations_save <- subset(detect.fixations(rectangle50), event=="fixation")

rectangle50_fixations_save$participant <- 50

#vamos a guardarlo
write_tsv(rectangle50_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/50.tsv")














