library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_48 <- read_tsv("48_rawdata.tsv", comment = "#")

rawdata_48 <- rename(rawdata_48, trial = Trial)
rawdata_48 <- rename(rawdata_48, x = 'L POR X [px]')
rawdata_48 <- rename(rawdata_48, y = 'L POR Y [px]')

rawdata_48 <- rawdata_48 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 48

rectangle48 <- subset(rawdata_48, Time >= 440199928 & Time <= 479709209)

rectangle48$time <- seq.int(nrow(rectangle48))*4
rectangle48 = rectangle48[,-c(1)]

ggplot(rectangle48, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle48_fixations_save <- subset(detect.fixations(rectangle48), event=="fixation")

rectangle48_fixations_save$participant <- 48

#vamos a guardarlo
write_tsv(rectangle48_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/48.tsv")














