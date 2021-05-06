library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_158 <- read_tsv("158_rawdata.tsv", comment = "#")

rawdata_158 <- rename(rawdata_158, trial = Trial)
rawdata_158 <- rename(rawdata_158, x = 'L POR X [px]')
rawdata_158 <- rename(rawdata_158, y = 'L POR Y [px]')

rawdata_158 <- rawdata_158 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 158

rectangle158 <- subset(rawdata_158, Time >= 2095300746 & Time <= 2148910816)

rectangle158$time <- seq.int(nrow(rectangle158))*4
rectangle158 = rectangle158[,-c(1)]

ggplot(rectangle158, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle158_fixations_save <- subset(detect.fixations(rectangle158), event=="fixation")

rectangle158_fixations_save$participant <- 158

#vamos a guardarlo
write_tsv(rectangle158_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/158.tsv")




















