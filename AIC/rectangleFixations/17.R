library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_17 <- read_tsv("17_rawdata.tsv", comment = "#")

rawdata_17 <- rename(rawdata_17, trial = Trial)
rawdata_17 <- rename(rawdata_17, x = 'L POR X [px]')
rawdata_17 <- rename(rawdata_17, y = 'L POR Y [px]')

rawdata_17 <- rawdata_17 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 17

rectangle17 <- subset(rawdata_17, Time >= 330565819 & Time <= 388988697)

rectangle17$time <- seq.int(nrow(rectangle17))*4
rectangle17 = rectangle17[,-c(1)]

ggplot(rectangle17, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle17_fixations_save <- subset(detect.fixations(rectangle17), event=="fixation")

rectangle17_fixations_save$participant <- 17

#vamos a guardarlo
write_tsv(rectangle17_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/17.tsv")





