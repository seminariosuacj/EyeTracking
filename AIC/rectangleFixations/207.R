library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_207 <- read_tsv("207_rawdata.tsv", comment = "#")

rawdata_207 <- rename(rawdata_207, trial = Trial)
rawdata_207 <- rename(rawdata_207, x = 'L POR X [px]')
rawdata_207 <- rename(rawdata_207, y = 'L POR Y [px]')

rawdata_207 <- rawdata_207 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 207

rectangle207 <- subset(rawdata_207, Time >= 18206672328 & Time <= 18273198733)

rectangle207$time <- seq.int(nrow(rectangle207))*4
rectangle207 = rectangle207[,-c(1)]

ggplot(rectangle207, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle207_fixations_save <- subset(detect.fixations(rectangle207), event=="fixation")

rectangle207_fixations_save$participant <- 207

#vamos a guardarlo
write_tsv(rectangle207_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/207.tsv")








