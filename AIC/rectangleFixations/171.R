library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_171 <- read_tsv("171_rawdata.tsv", comment = "#")

rawdata_171 <- rename(rawdata_171, trial = Trial)
rawdata_171 <- rename(rawdata_171, x = 'L POR X [px]')
rawdata_171 <- rename(rawdata_171, y = 'L POR Y [px]')

rawdata_171 <- rawdata_171 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 171

rectangle171 <- subset(rawdata_171, Time >= 243037652 & Time <= 280003088)

rectangle171$time <- seq.int(nrow(rectangle171))*4
rectangle171 = rectangle171[,-c(1)]

ggplot(rectangle171, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle171_fixations_save <- subset(detect.fixations(rectangle171), event=="fixation")

rectangle171_fixations_save$participant <- 171

#vamos a guardarlo
write_tsv(rectangle171_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/171.tsv")


























