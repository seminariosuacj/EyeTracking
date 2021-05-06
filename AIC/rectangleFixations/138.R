library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_138 <- read_tsv("138_rawdata.tsv", comment = "#")

rawdata_138 <- rename(rawdata_138, trial = Trial)
rawdata_138 <- rename(rawdata_138, x = 'L POR X [px]')
rawdata_138 <- rename(rawdata_138, y = 'L POR Y [px]')

rawdata_138 <- rawdata_138 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 138

rectangle138 <- subset(rawdata_138, Time >= 2107340167 & Time <= 2141077686)

rectangle138$time <- seq.int(nrow(rectangle138))*4
rectangle138 = rectangle138[,-c(1)]

ggplot(rectangle138, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle138_fixations_save <- subset(detect.fixations(rectangle138), event=="fixation")

rectangle138_fixations_save$participant <- 138

#vamos a guardarlo
write_tsv(rectangle138_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/138.tsv")


































