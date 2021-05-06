library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_38 <- read_tsv("38_rawdata.tsv", comment = "#")

rawdata_38 <- rename(rawdata_38, trial = Trial)
rawdata_38 <- rename(rawdata_38, x = 'L POR X [px]')
rawdata_38 <- rename(rawdata_38, y = 'L POR Y [px]')

rawdata_38 <- rawdata_38 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 38

rectangle38 <- subset(rawdata_38, Time >= 322871177 & Time <= 383606969)

rectangle38$time <- seq.int(nrow(rectangle38))*4
rectangle38 = rectangle38[,-c(1)]

ggplot(rectangle38, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle38_fixations_save <- subset(detect.fixations(rectangle38), event=="fixation")

rectangle38_fixations_save$participant <- 38

#vamos a guardarlo
write_tsv(rectangle38_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/38.tsv")

