library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_188 <- read_tsv("188_rawdata.tsv", comment = "#")

rawdata_188 <- rename(rawdata_188, time = Time)
rawdata_188 <- rename(rawdata_188, trial = Trial)
rawdata_188 <- rename(rawdata_188, x = 'L POR X [px]')
rawdata_188 <- rename(rawdata_188, y = 'L POR Y [px]')

rawdata_188 = rawdata_188[,-c(2)]

rawdata_188 = rawdata_188[,-c(3:20)]

rawdata_188 = rawdata_188[,-c(5:26)]

#Hacer rectangle en 188

rectangle188 <- subset(rawdata_188, time >= 654635797 & time <= 770883514)

ggplot(rectangle188, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle188_fixations <- subset(detect.fixations(rectangle188))

diagnostic.plot(rectangle188, rectangle188_fixations)

diagnostic.plot(rectangle188, rectangle188_fixations, start.time=654635797, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle188 <- calculate.summary(rectangle188_fixations)
round(stats_rectangle188, digits=2)


#Hacer vehicle en 188

vehicle188 <- subset(rawdata_188, time >= 804889115 & time <= 925036464)

ggplot(vehicle188, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle188_fixations <- subset(detect.fixations(vehicle188))

diagnostic.plot(vehicle188, vehicle188_fixations)

diagnostic.plot(vehicle188, vehicle188_fixations, start.time=804889115, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle188 <- calculate.summary(vehicle188_fixations)
round(stats_vehicle188, digits=2)



