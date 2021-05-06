library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_187 <- read_tsv("187_rawdata.tsv", comment = "#")

rawdata_187 <- rename(rawdata_187, trial = Trial)
rawdata_187 <- rename(rawdata_187, x = 'L POR X [px]')
rawdata_187 <- rename(rawdata_187, y = 'L POR Y [px]')

rawdata_187 <- rawdata_187 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 187

rectangle187 <- subset(rawdata_187, Time >= 9703348381 & Time <= 9734978036)

rectangle187$time <- seq.int(nrow(rectangle187))*4
rectangle187 = rectangle187[,-c(1)]

ggplot(rectangle187, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle187_fixations_save <- subset(detect.fixations(rectangle187), event=="fixation")

rectangle187_fixations_save$participant <- 187

#vamos a guardarlo
write_tsv(rectangle187_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/187.tsv")






