library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_26 <- read_tsv("26_rawdata.tsv", comment = "#")

rawdata_26 <- rename(rawdata_26, trial = Trial)
rawdata_26 <- rename(rawdata_26, x = 'L POR X [px]')
rawdata_26 <- rename(rawdata_26, y = 'L POR Y [px]')

rawdata_26 <- rawdata_26 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 26

rectangle26 <- subset(rawdata_26, Time >= 3136928934 & Time <= 3167733480)

rectangle26$time <- seq.int(nrow(rectangle26))*4
rectangle26 = rectangle26[,-c(1)]

ggplot(rectangle26, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle26_fixations_save <- subset(detect.fixations(rectangle26), event=="fixation")

rectangle26_fixations_save$participant <- 26

#vamos a guardarlo
write_tsv(rectangle26_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/26.tsv")

















