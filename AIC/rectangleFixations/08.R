library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_8 <- read_tsv("8_rawdata.tsv", comment = "#")

rawdata_8 <- rename(rawdata_8, trial = Trial)
rawdata_8 <- rename(rawdata_8, x = 'L POR X [px]')
rawdata_8 <- rename(rawdata_8, y = 'L POR Y [px]')

rawdata_8 <- rawdata_8 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 8

rectangle8 <- subset(rawdata_8, Time >= 4894846654 & Time <= 4956914181)

rectangle8$time <- seq.int(nrow(rectangle8))*4
rectangle8 = rectangle8[,-c(1)]

ggplot(rectangle8, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle8_fixations_save <- subset(detect.fixations(rectangle8), event=="fixation")

rectangle8_fixations_save$participant <- 8

#vamos a guardarlo
write_tsv(rectangle8_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/8.tsv")




