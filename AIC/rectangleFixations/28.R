library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_28 <- read_tsv("28_rawdata.tsv", comment = "#")

rawdata_28 <- rename(rawdata_28, trial = Trial)
rawdata_28 <- rename(rawdata_28, x = 'L POR X [px]')
rawdata_28 <- rename(rawdata_28, y = 'L POR Y [px]')

rawdata_28 <- rawdata_28 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 28

rectangle28 <- subset(rawdata_28, Time >= 30300103804 & Time <= 30362941274)

rectangle28$time <- seq.int(nrow(rectangle28))*4
rectangle28 = rectangle28[,-c(1)]

ggplot(rectangle28, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle28_fixations_save <- subset(detect.fixations(rectangle28), event=="fixation")

rectangle28_fixations_save$participant <- 28

#vamos a guardarlo
write_tsv(rectangle28_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/28.tsv")









