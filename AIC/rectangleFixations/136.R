library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_136 <- read_tsv("136_rawdata.tsv", comment = "#")

rawdata_136 <- rename(rawdata_136, trial = Trial)
rawdata_136 <- rename(rawdata_136, x = 'L POR X [px]')
rawdata_136 <- rename(rawdata_136, y = 'L POR Y [px]')

rawdata_136 <- rawdata_136 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 136

rectangle136 <- subset(rawdata_136, Time >= 6533653249 & Time <= 6608947181)

rectangle136$time <- seq.int(nrow(rectangle136))*4
rectangle136 = rectangle136[,-c(1)]

ggplot(rectangle136, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle136_fixations_save <- subset(detect.fixations(rectangle136), event=="fixation")

rectangle136_fixations_save$participant <- 136

#vamos a guardarlo
write_tsv(rectangle136_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/136.tsv")





























