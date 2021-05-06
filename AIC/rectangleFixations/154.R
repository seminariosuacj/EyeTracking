library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_154 <- read_tsv("154_rawdata.tsv", comment = "#")

rawdata_154 <- rename(rawdata_154, trial = Trial)
rawdata_154 <- rename(rawdata_154, x = 'L POR X [px]')
rawdata_154 <- rename(rawdata_154, y = 'L POR Y [px]')

rawdata_154 <- rawdata_154 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 154

rectangle154 <- subset(rawdata_154, Time >= 2994557170 & Time <= 3075387196)

rectangle154$time <- seq.int(nrow(rectangle154))*4
rectangle154 = rectangle154[,-c(1)]

ggplot(rectangle154, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle154_fixations_save <- subset(detect.fixations(rectangle154), event=="fixation")

rectangle154_fixations_save$participant <- 154

#vamos a guardarlo
write_tsv(rectangle154_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/154.tsv")


















