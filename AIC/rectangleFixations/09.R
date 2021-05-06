library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_9 <- read_tsv("9_rawdata.tsv", comment = "#")

rawdata_9 <- rename(rawdata_9, trial = Trial)
rawdata_9 <- rename(rawdata_9, x = 'L POR X [px]')
rawdata_9 <- rename(rawdata_9, y = 'L POR Y [px]')

rawdata_9 <- rawdata_9 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 9

rectangle9 <- subset(rawdata_9, Time >= 444054244 & Time <= 485723907)

rectangle9$time <- seq.int(nrow(rectangle9))*4
rectangle9 = rectangle9[,-c(1)]

ggplot(rectangle9, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle9_fixations_save <- subset(detect.fixations(rectangle9), event=="fixation")

rectangle9_fixations_save$participant <- 9

#vamos a guardarlo
write_tsv(rectangle9_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/9.tsv")





