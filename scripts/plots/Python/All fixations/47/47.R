library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_47 <- read_tsv("47_rawdata.tsv", comment = "#")

rawdata_47 <- rename(rawdata_47, time = Time)
rawdata_47 <- rename(rawdata_47, trial = Trial)
rawdata_47 <- rename(rawdata_47, x = 'L POR X [px]')
rawdata_47 <- rename(rawdata_47, y = 'L POR Y [px]')

rawdata_47 = rawdata_47[,-c(2)]

rawdata_47 = rawdata_47[,-c(3:20)]

rawdata_47 = rawdata_47[,-c(5:26)]

#Hacer vehicle en 47

vehicle47 <- subset(rawdata_47, time >= 2410026109 & time <= 2463340944)

ggplot(vehicle47, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle47_fixations <- subset(detect.fixations(vehicle47))

diagnostic.plot(vehicle47, vehicle47_fixations)

diagnostic.plot(vehicle47, vehicle47_fixations, start.time=2410026109, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle47 <- calculate.summary(vehicle47_fixations)
round(stats_vehicle47, digits=2)

#Hacer rectangle en 47

rectangle47 <- subset(rawdata_47, time >= 2492774882 & time <= 2522443324)

ggplot(rectangle47, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle47_fixations <- subset(detect.fixations(rectangle47))

diagnostic.plot(rectangle47, rectangle47_fixations)

diagnostic.plot(rectangle47, rectangle47_fixations, start.time=2492774882, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle47 <- calculate.summary(rectangle47_fixations)
round(stats_rectangle47, digits=2)

