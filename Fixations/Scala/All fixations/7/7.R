library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_7 <- read_tsv("7_rawdata.tsv", comment = "#")

rawdata_7 <- rename(rawdata_7, time = Time)
rawdata_7 <- rename(rawdata_7, trial = Trial)
rawdata_7 <- rename(rawdata_7, x = 'L POR X [px]')
rawdata_7 <- rename(rawdata_7, y = 'L POR Y [px]')

rawdata_7 = rawdata_7[,-c(2)]

rawdata_7 = rawdata_7[,-c(3:20)]

rawdata_7 = rawdata_7[,-c(5:26)]

#Hacer vehicle en 7

vehicle7 <- subset(rawdata_7, time >= 1302403774 & time <= 1415015876)

ggplot(vehicle7, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle7_fixations <- subset(detect.fixations(vehicle7))

diagnostic.plot(vehicle7, vehicle7_fixations)

diagnostic.plot(vehicle7, vehicle7_fixations, start.time=1302403774, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle7 <- calculate.summary(vehicle7_fixations)
round(stats_vehicle7, digits=2)

#Hacer rectangle en 7

rectangle7 <- subset(rawdata_7, time >= 1488918623 & time <= 1582415898)

ggplot(rectangle7, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle7_fixations <- subset(detect.fixations(rectangle7))

diagnostic.plot(rectangle7, rectangle7_fixations)

diagnostic.plot(rectangle7, rectangle7_fixations, start.time=1488918623, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle7 <- calculate.summary(rectangle7_fixations)
round(stats_rectangle7, digits=2)

