library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_182 <- read_tsv("182_rawdata.tsv", comment = "#")

rawdata_182 <- rename(rawdata_182, trial = Trial)
rawdata_182 <- rename(rawdata_182, x = 'L POR X [px]')
rawdata_182 <- rename(rawdata_182, y = 'L POR Y [px]')

rawdata_182 <- rawdata_182 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 182

rectangle182 <- subset(rawdata_182, Time >= 1006423479 & Time <= 1068091188)

rectangle182$time <- seq.int(nrow(rectangle182))*4
rectangle182 = rectangle182[,-c(1)]

ggplot(rectangle182, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle182_fixations_save <- subset(detect.fixations(rectangle182), event=="fixation")

rectangle182_fixations_save$participant <- 182

#vamos a guardarlo
write_tsv(rectangle182_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/182.tsv")





