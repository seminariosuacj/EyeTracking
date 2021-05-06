library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_4 <- read_tsv("4_rawdata.tsv", comment = "#")

rawdata_4 <- rename(rawdata_4, trial = Trial)
rawdata_4 <- rename(rawdata_4, x = 'L POR X [px]')
rawdata_4 <- rename(rawdata_4, y = 'L POR Y [px]')

rawdata_4 <- rawdata_4 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 4

rectangle4 <- subset(rawdata_4, Time >= 278785840 & Time <= 330438185)

rectangle4$time <- seq.int(nrow(rectangle4))*4
rectangle4 = rectangle4[,-c(1)]

ggplot(rectangle4, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle4_fixations_save <- subset(detect.fixations(rectangle4), event=="fixation")

rectangle4_fixations_save$participant <- 4

#vamos a guardarlo
write_tsv(rectangle4_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/4.tsv")




