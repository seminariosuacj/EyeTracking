library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_35 <- read_tsv("35_rawdata.tsv", comment = "#")

rawdata_35 <- rename(rawdata_35, trial = Trial)
rawdata_35 <- rename(rawdata_35, x = 'L POR X [px]')
rawdata_35 <- rename(rawdata_35, y = 'L POR Y [px]')

rawdata_35 <- rawdata_35 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 35

rectangle35 <- subset(rawdata_35, Time >= 16895981804 & Time <= 16941818762)

rectangle35$time <- seq.int(nrow(rectangle35))*4
rectangle35 = rectangle35[,-c(1)]

ggplot(rectangle35, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle35_fixations_save <- subset(detect.fixations(rectangle35), event=="fixation")

rectangle35_fixations_save$participant <- 35

#vamos a guardarlo
write_tsv(rectangle35_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/35.tsv")




