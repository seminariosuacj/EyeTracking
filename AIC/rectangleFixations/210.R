library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_210 <- read_tsv("210_rawdata.tsv", comment = "#")

rawdata_210 <- rename(rawdata_210, trial = Trial)
rawdata_210 <- rename(rawdata_210, x = 'L POR X [px]')
rawdata_210 <- rename(rawdata_210, y = 'L POR Y [px]')

rawdata_210 <- rawdata_210 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 210

rectangle210 <- subset(rawdata_210, Time >= 837270555 & Time <= 865336801)

rectangle210$time <- seq.int(nrow(rectangle210))*4
rectangle210 = rectangle210[,-c(1)]

ggplot(rectangle210, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle210_fixations_save <- subset(detect.fixations(rectangle210), event=="fixation")

rectangle210_fixations_save$participant <- 210

#vamos a guardarlo
write_tsv(rectangle210_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/210.tsv")
