library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_19 <- read_tsv("19_rawdata.tsv", comment = "#")

rawdata_19 <- rename(rawdata_19, time = Time)
rawdata_19 <- rename(rawdata_19, trial = Trial)
rawdata_19 <- rename(rawdata_19, x = 'L POR X [px]')
rawdata_19 <- rename(rawdata_19, y = 'L POR Y [px]')

rawdata_19 = rawdata_19[,-c(2)]

rawdata_19 = rawdata_19[,-c(3:20)]

rawdata_19 = rawdata_19[,-c(5:26)]

#Hacer rectangle en 19

rectangle19 <- subset(rawdata_19, time >= 2844214412 & time <= 2876619608)

ggplot(rectangle19, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle19_fixations <- subset(detect.fixations(rectangle19))

diagnostic.plot(rectangle19, rectangle19_fixations)

diagnostic.plot(rectangle19, rectangle19_fixations, start.time=2844286405, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle19 <- calculate.summary(rectangle19_fixations)
round(stats_rectangle19, digits=2)

#Hacer vehicle en 19

vehicle19 <- subset(rawdata_19, time >= 2887162904 & time <= 2926079882)

ggplot(vehicle19, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle19_fixations <- subset(detect.fixations(vehicle19))

diagnostic.plot(vehicle19, vehicle19_fixations)

diagnostic.plot(vehicle19, vehicle19_fixations, start.time=2887182923, duration=38896959, interactive=FALSE, ylim=c(0,1000))

stats_vehicle19 <- calculate.summary(vehicle19_fixations)
round(stats_vehicle19, digits=2)
