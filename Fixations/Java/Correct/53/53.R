library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_53 <- read_tsv("53_rawdata.tsv", comment = "#")

rawdata_53 <- rename(rawdata_53, time = Time)
rawdata_53 <- rename(rawdata_53, trial = Trial)
rawdata_53 <- rename(rawdata_53, x = 'L POR X [px]')
rawdata_53 <- rename(rawdata_53, y = 'L POR Y [px]')

rawdata_53 = rawdata_53[,-c(2)]

rawdata_53 = rawdata_53[,-c(3:20)]

rawdata_53 = rawdata_53[,-c(5:26)]

#Hacer rectangle en 53

rectangle53 <- subset(rawdata_53, time >= 3743384594 & time <= 3802380166)

ggplot(rectangle53, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle53_fixations <- subset(detect.fixations(rectangle53))

diagnostic.plot(rectangle53, rectangle53_fixations)

diagnostic.plot(rectangle53, rectangle53_fixations, start.time=3743384594, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle53 <- calculate.summary(rectangle53_fixations)
round(stats_rectangle53, digits=2)

#Hacer vehicle en 53

vehicle53 <- subset(rawdata_53, time >= 3829298356 & time <= 3886074232)

ggplot(vehicle53, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle53_fixations <- subset(detect.fixations(vehicle53))

diagnostic.plot(vehicle53, vehicle53_fixations)

diagnostic.plot(vehicle53, vehicle53_fixations, start.time=3829298356, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle53 <- calculate.summary(vehicle53_fixations)
round(stats_vehicle53, digits=2)
