library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_15 <- read_tsv("15_rawdata.tsv", comment = "#")

rawdata_15 <- rename(rawdata_15, trial = Trial)
rawdata_15 <- rename(rawdata_15, x = 'L POR X [px]')
rawdata_15 <- rename(rawdata_15, y = 'L POR Y [px]')

rawdata_15 <- rawdata_15 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 15

rectangle15 <- subset(rawdata_15, Time >= 15493906692 & Time <= 15537834882)

rectangle15$time <- seq.int(nrow(rectangle15))*4
rectangle15 = rectangle15[,-c(1)]

ggplot(rectangle15, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle15_fixations_save <- subset(detect.fixations(rectangle15), event=="fixation")

rectangle15_fixations_save$participant <- 15

#vamos a guardarlo
write_tsv(rectangle15_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/15.tsv")









