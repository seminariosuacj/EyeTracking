library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_52 <- read_tsv("52_rawdata.tsv", comment = "#")

rawdata_52 <- rename(rawdata_52, time = Time)
rawdata_52 <- rename(rawdata_52, trial = Trial)
rawdata_52 <- rename(rawdata_52, x = 'L POR X [px]')
rawdata_52 <- rename(rawdata_52, y = 'L POR Y [px]')

rawdata_52 = rawdata_52[,-c(2)]

rawdata_52 = rawdata_52[,-c(3:20)]

rawdata_52 = rawdata_52[,-c(5:26)]

#Hacer vehicle en 52

vehicle52 <- subset(rawdata_52, time >= 665546949 & time <= 721279098)

ggplot(vehicle52, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle52_fixations <- subset(detect.fixations(vehicle52))

diagnostic.plot(vehicle52, vehicle52_fixations)

diagnostic.plot(vehicle52, vehicle52_fixations, start.time=665546949, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle52 <- calculate.summary(vehicle52_fixations)
round(stats_vehicle52, digits=2)

#Hacer rectangle en 52

rectangle52 <- subset(rawdata_52, time >= 796169003 & time <= 885767802)

ggplot(rectangle52, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle52_fixations <- subset(detect.fixations(rectangle52))

diagnostic.plot(rectangle52, rectangle52_fixations)

diagnostic.plot(rectangle52, rectangle52_fixations, start.time=796169003, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle52 <- calculate.summary(rectangle52_fixations)
round(stats_rectangle52, digits=2)

