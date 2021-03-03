library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_161 <- read_tsv("161_rawdata.tsv", comment = "#")

rawdata_161 <- rename(rawdata_161, time = Time)
rawdata_161 <- rename(rawdata_161, trial = Trial)
rawdata_161 <- rename(rawdata_161, x = 'L POR X [px]')
rawdata_161 <- rename(rawdata_161, y = 'L POR Y [px]')

rawdata_161 = rawdata_161[,-c(2)]

rawdata_161 = rawdata_161[,-c(3:20)]

rawdata_161 = rawdata_161[,-c(5:26)]

#Hacer vehicle en 161

vehicle161 <- subset(rawdata_161, time >= 6507468773 & time <= 6553300777)

ggplot(vehicle161, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle161_fixations <- subset(detect.fixations(vehicle161))

diagnostic.plot(vehicle161, vehicle161_fixations)

diagnostic.plot(vehicle161, vehicle161_fixations, start.time=6507468773, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle161 <- calculate.summary(vehicle161_fixations)
round(stats_vehicle161, digits=2)


#Hacer rectangle en 161

rectangle161 <- subset(rawdata_161, time >= 6584521355 & time <= 6601316295)

ggplot(rectangle161, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle161_fixations <- subset(detect.fixations(rectangle161))

diagnostic.plot(rectangle161, rectangle161_fixations)

diagnostic.plot(rectangle161, rectangle161_fixations, start.time=6584521355, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle161 <- calculate.summary(rectangle161_fixations)
round(stats_rectangle161, digits=2)






