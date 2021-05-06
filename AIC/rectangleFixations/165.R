library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_165 <- read_tsv("165_rawdata.tsv", comment = "#")

rawdata_165 <- rename(rawdata_165, trial = Trial)
rawdata_165 <- rename(rawdata_165, x = 'L POR X [px]')
rawdata_165 <- rename(rawdata_165, y = 'L POR Y [px]')

rawdata_165 <- rawdata_165 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 165

rectangle165 <- subset(rawdata_165, Time >= 820406301 & Time <= 919093830)

rectangle165$time <- seq.int(nrow(rectangle165))*4
rectangle165 = rectangle165[,-c(1)]

ggplot(rectangle165, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle165_fixations_save <- subset(detect.fixations(rectangle165), event=="fixation")

rectangle165_fixations_save$participant <- 165

#vamos a guardarlo
write_tsv(rectangle165_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/165.tsv")


















