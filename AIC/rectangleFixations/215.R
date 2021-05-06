library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_215 <- read_tsv("215_rawdata.tsv", comment = "#")

rawdata_215 <- rename(rawdata_215, trial = Trial)
rawdata_215 <- rename(rawdata_215, x = 'L POR X [px]')
rawdata_215 <- rename(rawdata_215, y = 'L POR Y [px]')

rawdata_215 <- rawdata_215 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 215

rectangle215 <- subset(rawdata_215, Time >= 389929454 & Time <= 435242305)

rectangle215$time <- seq.int(nrow(rectangle215))*4
rectangle215 = rectangle215[,-c(1)]

ggplot(rectangle215, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle215_fixations_save <- subset(detect.fixations(rectangle215), event=="fixation")

rectangle215_fixations_save$participant <- 215

#vamos a guardarlo
write_tsv(rectangle215_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/215.tsv")











