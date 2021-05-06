library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_179 <- read_tsv("179_rawdata.tsv", comment = "#")

rawdata_179 <- rename(rawdata_179, trial = Trial)
rawdata_179 <- rename(rawdata_179, x = 'L POR X [px]')
rawdata_179 <- rename(rawdata_179, y = 'L POR Y [px]')

rawdata_179 <- rawdata_179 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 179

rectangle179 <- subset(rawdata_179, Time >= 524551124 & Time <= 635713695)

rectangle179$time <- seq.int(nrow(rectangle179))*4
rectangle179 = rectangle179[,-c(1)]

ggplot(rectangle179, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle179_fixations_save <- subset(detect.fixations(rectangle179), event=="fixation")

rectangle179_fixations_save$participant <- 179

#vamos a guardarlo
write_tsv(rectangle179_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/179.tsv")





