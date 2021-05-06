library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_95 <- read_tsv("95_rawdata.tsv", comment = "#")

rawdata_95 <- rename(rawdata_95, trial = Trial)
rawdata_95 <- rename(rawdata_95, x = 'L POR X [px]')
rawdata_95 <- rename(rawdata_95, y = 'L POR Y [px]')

rawdata_95 <- rawdata_95 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 95

rectangle95 <- subset(rawdata_95, Time >= 6820904287 & Time <= 6867263722)

rectangle95$time <- seq.int(nrow(rectangle95))*4
rectangle95 = rectangle95[,-c(1)]

ggplot(rectangle95, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle95_fixations_save <- subset(detect.fixations(rectangle95), event=="fixation")

rectangle95_fixations_save$participant <- 95

#vamos a guardarlo
write_tsv(rectangle95_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/95.tsv")







