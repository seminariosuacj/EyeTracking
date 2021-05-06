library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_164 <- read_tsv("164_rawdata.tsv", comment = "#")

rawdata_164 <- rename(rawdata_164, trial = Trial)
rawdata_164 <- rename(rawdata_164, x = 'L POR X [px]')
rawdata_164 <- rename(rawdata_164, y = 'L POR Y [px]')

rawdata_164 <- rawdata_164 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 164

rectangle164 <- subset(rawdata_164, Time >= 3205824365 & Time <= 3282197565)

rectangle164$time <- seq.int(nrow(rectangle164))*4
rectangle164 = rectangle164[,-c(1)]

ggplot(rectangle164, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle164_fixations_save <- subset(detect.fixations(rectangle164), event=="fixation")

rectangle164_fixations_save$participant <- 164

#vamos a guardarlo
write_tsv(rectangle164_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/164.tsv")























