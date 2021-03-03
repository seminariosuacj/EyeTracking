library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_175 <- read_tsv("175_rawdata.tsv", comment = "#")

rawdata_175 <- rename(rawdata_175, time = Time)
rawdata_175 <- rename(rawdata_175, trial = Trial)
rawdata_175 <- rename(rawdata_175, x = 'L POR X [px]')
rawdata_175 <- rename(rawdata_175, y = 'L POR Y [px]')

rawdata_175 = rawdata_175[,-c(2)]

rawdata_175 = rawdata_175[,-c(3:20)]

rawdata_175 = rawdata_175[,-c(5:26)]


#Hacer rectangle en 175

rectangle175 <- subset(rawdata_175, time >= 3081071160 & time <= 3109501238)

ggplot(rectangle175, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle175_fixations <- subset(detect.fixations(rectangle175))

diagnostic.plot(rectangle175, rectangle175_fixations)

diagnostic.plot(rectangle175, rectangle175_fixations, start.time=3081071160, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle175 <- calculate.summary(rectangle175_fixations)
round(stats_rectangle175, digits=2)


#Hacer vehicle en 175

vehicle175 <- subset(rawdata_175, time >= 3131219642 & time <= 3177914956)

ggplot(vehicle175, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle175_fixations <- subset(detect.fixations(vehicle175))

diagnostic.plot(vehicle175, vehicle175_fixations)

diagnostic.plot(vehicle175, vehicle175_fixations, start.time=3131219642, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle175 <- calculate.summary(vehicle175_fixations)
round(stats_vehicle175, digits=2)









