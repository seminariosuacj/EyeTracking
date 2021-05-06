library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_64 <- read_tsv("64_rawdata.tsv", comment = "#")

rawdata_64 <- rename(rawdata_64, trial = Trial)
rawdata_64 <- rename(rawdata_64, x = 'L POR X [px]')
rawdata_64 <- rename(rawdata_64, y = 'L POR Y [px]')

rawdata_64 <- rawdata_64 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 64

rectangle64 <- subset(rawdata_64, Time >= 992681532 & Time <= 1094719391)

rectangle64$time <- seq.int(nrow(rectangle64))*4
rectangle64 = rectangle64[,-c(1)]

ggplot(rectangle64, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle64_fixations_save <- subset(detect.fixations(rectangle64), event=="fixation")

rectangle64_fixations_save$participant <- 64

#vamos a guardarlo
write_tsv(rectangle64_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/64.tsv")



















