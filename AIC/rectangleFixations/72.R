library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_72 <- read_tsv("72_rawdata.tsv", comment = "#")

rawdata_72 <- rename(rawdata_72, trial = Trial)
rawdata_72 <- rename(rawdata_72, x = 'L POR X [px]')
rawdata_72 <- rename(rawdata_72, y = 'L POR Y [px]')

rawdata_72 <- rawdata_72 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 72

rectangle72 <- subset(rawdata_72, Time >= 937169894 & Time <= 990222301)

rectangle72$time <- seq.int(nrow(rectangle72))*4
rectangle72 = rectangle72[,-c(1)]

ggplot(rectangle72, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle72_fixations_save <- subset(detect.fixations(rectangle72), event=="fixation")

rectangle72_fixations_save$participant <- 72

#vamos a guardarlo
write_tsv(rectangle72_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/72.tsv")






















