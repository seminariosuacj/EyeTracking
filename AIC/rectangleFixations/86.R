library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_86 <- read_tsv("86_rawdata.tsv", comment = "#")

rawdata_86 <- rename(rawdata_86, trial = Trial)
rawdata_86 <- rename(rawdata_86, x = 'L POR X [px]')
rawdata_86 <- rename(rawdata_86, y = 'L POR Y [px]')

rawdata_86 <- rawdata_86 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 86

rectangle86 <- subset(rawdata_86, Time >= 12263185079 & Time <= 12422467928)

rectangle86$time <- seq.int(nrow(rectangle86))*4
rectangle86 = rectangle86[,-c(1)]

ggplot(rectangle86, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle86_fixations_save <- subset(detect.fixations(rectangle86), event=="fixation")

rectangle86_fixations_save$participant <- 86

#vamos a guardarlo
write_tsv(rectangle86_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/86.tsv")
























