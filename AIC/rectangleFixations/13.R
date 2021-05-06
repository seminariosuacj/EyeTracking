library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_13 <- read_tsv("13_rawdata.tsv", comment = "#")

rawdata_13 <- rename(rawdata_13, trial = Trial)
rawdata_13 <- rename(rawdata_13, x = 'L POR X [px]')
rawdata_13 <- rename(rawdata_13, y = 'L POR Y [px]')

rawdata_13 <- rawdata_13 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 13

rectangle13 <- subset(rawdata_13, Time >= 359485532 & Time <= 421008271)

rectangle13$time <- seq.int(nrow(rectangle13))*4
rectangle13 = rectangle13[,-c(1)]

ggplot(rectangle13, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle13_fixations_save <- subset(detect.fixations(rectangle13), event=="fixation")

rectangle13_fixations_save$participant <- 13

#vamos a guardarlo
write_tsv(rectangle13_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/13.tsv")






