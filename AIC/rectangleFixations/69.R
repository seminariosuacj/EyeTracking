library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_69 <- read_tsv("69_rawdata.tsv", comment = "#")

rawdata_69 <- rename(rawdata_69, trial = Trial)
rawdata_69 <- rename(rawdata_69, x = 'L POR X [px]')
rawdata_69 <- rename(rawdata_69, y = 'L POR Y [px]')

rawdata_69 <- rawdata_69 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 69

rectangle69 <- subset(rawdata_69, Time >= 1228879765 & Time <= 1289929044)

rectangle69$time <- seq.int(nrow(rectangle69))*4
rectangle69 = rectangle69[,-c(1)]

ggplot(rectangle69, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle69_fixations_save <- subset(detect.fixations(rectangle69), event=="fixation")

rectangle69_fixations_save$participant <- 69

#vamos a guardarlo
write_tsv(rectangle69_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/69.tsv")





