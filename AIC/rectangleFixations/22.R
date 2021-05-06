library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_22 <- read_tsv("22_rawdata.tsv", comment = "#")

rawdata_22 <- rename(rawdata_22, trial = Trial)
rawdata_22 <- rename(rawdata_22, x = 'L POR X [px]')
rawdata_22 <- rename(rawdata_22, y = 'L POR Y [px]')

rawdata_22 <- rawdata_22 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 22

rectangle22 <- subset(rawdata_22, Time >= 1623018657 & Time <= 1719469620)

rectangle22$time <- seq.int(nrow(rectangle22))*4
rectangle22 = rectangle22[,-c(1)]

ggplot(rectangle22, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle22_fixations_save <- subset(detect.fixations(rectangle22), event=="fixation")

rectangle22_fixations_save$participant <- 22

#vamos a guardarlo
write_tsv(rectangle22_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/22.tsv")






