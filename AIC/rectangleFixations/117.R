library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_117 <- read_tsv("117_rawdata.tsv", comment = "#")

rawdata_117 <- rename(rawdata_117, trial = Trial)
rawdata_117 <- rename(rawdata_117, x = 'L POR X [px]')
rawdata_117 <- rename(rawdata_117, y = 'L POR Y [px]')

rawdata_117 <- rawdata_117 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 117

rectangle117 <- subset(rawdata_117, Time >= 1490283072 & Time <= 1580295849)

rectangle117$time <- seq.int(nrow(rectangle117))*4
rectangle117 = rectangle117[,-c(1)]

ggplot(rectangle117, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle117_fixations_save <- subset(detect.fixations(rectangle117), event=="fixation")

rectangle117_fixations_save$participant <- 117

#vamos a guardarlo
write_tsv(rectangle117_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/117.tsv")


