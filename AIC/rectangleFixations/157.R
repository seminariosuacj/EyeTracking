library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_157 <- read_tsv("157_rawdata.tsv", comment = "#")

rawdata_157 <- rename(rawdata_157, trial = Trial)
rawdata_157 <- rename(rawdata_157, x = 'L POR X [px]')
rawdata_157 <- rename(rawdata_157, y = 'L POR Y [px]')

rawdata_157 <- rawdata_157 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 157

rectangle157 <- subset(rawdata_157, Time >= 3851882354 & Time <= 3951355379)

rectangle157$time <- seq.int(nrow(rectangle157))*4
rectangle157 = rectangle157[,-c(1)]

ggplot(rectangle157, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle157_fixations_save <- subset(detect.fixations(rectangle157), event=="fixation")

rectangle157_fixations_save$participant <- 157

#vamos a guardarlo
write_tsv(rectangle157_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/157.tsv")





