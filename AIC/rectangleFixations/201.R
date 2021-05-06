library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_201 <- read_tsv("201_rawdata.tsv", comment = "#")

rawdata_201 <- rename(rawdata_201, trial = Trial)
rawdata_201 <- rename(rawdata_201, x = 'L POR X [px]')
rawdata_201 <- rename(rawdata_201, y = 'L POR Y [px]')

rawdata_201 <- rawdata_201 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 201

rectangle201 <- subset(rawdata_201, Time >= 882627876 & Time <= 912768203)

rectangle201$time <- seq.int(nrow(rectangle201))*4
rectangle201 = rectangle201[,-c(1)]

ggplot(rectangle201, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle201_fixations_save <- subset(detect.fixations(rectangle201), event=="fixation")

rectangle201_fixations_save$participant <- 201

#vamos a guardarlo
write_tsv(rectangle201_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/201.tsv")




