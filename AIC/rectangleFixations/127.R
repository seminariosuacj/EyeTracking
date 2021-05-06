library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_127 <- read_tsv("127_rawdata.tsv", comment = "#")

rawdata_127 <- rename(rawdata_127, trial = Trial)
rawdata_127 <- rename(rawdata_127, x = 'L POR X [px]')
rawdata_127 <- rename(rawdata_127, y = 'L POR Y [px]')

rawdata_127 <- rawdata_127 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 127

rectangle127 <- subset(rawdata_127, Time >= 10291033017 & Time <= 10333294117)

rectangle127$time <- seq.int(nrow(rectangle127))*4
rectangle127 = rectangle127[,-c(1)]

ggplot(rectangle127, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle127_fixations_save <- subset(detect.fixations(rectangle127), event=="fixation")

rectangle127_fixations_save$participant <- 127

#vamos a guardarlo
write_tsv(rectangle127_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/127.tsv")






























