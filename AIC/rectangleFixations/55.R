library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_55 <- read_tsv("55_rawdata.tsv", comment = "#")

rawdata_55 <- rename(rawdata_55, trial = Trial)
rawdata_55 <- rename(rawdata_55, x = 'L POR X [px]')
rawdata_55 <- rename(rawdata_55, y = 'L POR Y [px]')

rawdata_55 <- rawdata_55 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 55

rectangle55 <- subset(rawdata_55, Time >= 1896978569 & Time <= 1992563926)

rectangle55$time <- seq.int(nrow(rectangle55))*4
rectangle55 = rectangle55[,-c(1)]

ggplot(rectangle55, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle55_fixations_save <- subset(detect.fixations(rectangle55), event=="fixation")

rectangle55_fixations_save$participant <- 55

#vamos a guardarlo
write_tsv(rectangle55_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/55.tsv")



