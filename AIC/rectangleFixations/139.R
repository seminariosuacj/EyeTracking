library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_139 <- read_tsv("139_rawdata.tsv", comment = "#")

rawdata_139 <- rename(rawdata_139, trial = Trial)
rawdata_139 <- rename(rawdata_139, x = 'L POR X [px]')
rawdata_139 <- rename(rawdata_139, y = 'L POR Y [px]')

rawdata_139 <- rawdata_139 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 139

rectangle139 <- subset(rawdata_139, Time >= 3482748253 & Time <= 3507366261)

rectangle139$time <- seq.int(nrow(rectangle139))*4
rectangle139 = rectangle139[,-c(1)]

ggplot(rectangle139, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle139_fixations_save <- subset(detect.fixations(rectangle139), event=="fixation")

rectangle139_fixations_save$participant <- 139

#vamos a guardarlo
write_tsv(rectangle139_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/139.tsv")

































