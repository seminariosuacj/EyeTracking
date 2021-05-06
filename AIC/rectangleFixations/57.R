library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_57 <- read_tsv("57_rawdata.tsv", comment = "#")

rawdata_57 <- rename(rawdata_57, trial = Trial)
rawdata_57 <- rename(rawdata_57, x = 'L POR X [px]')
rawdata_57 <- rename(rawdata_57, y = 'L POR Y [px]')

rawdata_57 <- rawdata_57 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 57

rectangle57 <- subset(rawdata_57, Time >= 3025830901 & Time <= 3064319752)

rectangle57$time <- seq.int(nrow(rectangle57))*4
rectangle57 = rectangle57[,-c(1)]

ggplot(rectangle57, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle57_fixations_save <- subset(detect.fixations(rectangle57), event=="fixation")

rectangle57_fixations_save$participant <- 57

#vamos a guardarlo
write_tsv(rectangle57_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/57.tsv")
















