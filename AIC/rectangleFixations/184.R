library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_184 <- read_tsv("184_rawdata.tsv", comment = "#")

rawdata_184 <- rename(rawdata_184, trial = Trial)
rawdata_184 <- rename(rawdata_184, x = 'L POR X [px]')
rawdata_184 <- rename(rawdata_184, y = 'L POR Y [px]')

rawdata_184 <- rawdata_184 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 184

rectangle184 <- subset(rawdata_184, Time >= 815618919 & Time <= 881550548)

rectangle184$time <- seq.int(nrow(rectangle184))*4
rectangle184 = rectangle184[,-c(1)]

ggplot(rectangle184, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle184_fixations_save <- subset(detect.fixations(rectangle184), event=="fixation")

rectangle184_fixations_save$participant <- 184

#vamos a guardarlo
write_tsv(rectangle184_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/184.tsv")







