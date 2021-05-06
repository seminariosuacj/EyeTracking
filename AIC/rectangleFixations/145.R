library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_145 <- read_tsv("145_rawdata.tsv", comment = "#")

rawdata_145 <- rename(rawdata_145, trial = Trial)
rawdata_145 <- rename(rawdata_145, x = 'L POR X [px]')
rawdata_145 <- rename(rawdata_145, y = 'L POR Y [px]')

rawdata_145 <- rawdata_145 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 145

rectangle145 <- subset(rawdata_145, Time >= 31607109653 & Time <= 31684462872)

rectangle145$time <- seq.int(nrow(rectangle145))*4
rectangle145 = rectangle145[,-c(1)]

ggplot(rectangle145, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle145_fixations_save <- subset(detect.fixations(rectangle145), event=="fixation")

rectangle145_fixations_save$participant <- 145

#vamos a guardarlo
write_tsv(rectangle145_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/145.tsv")





































