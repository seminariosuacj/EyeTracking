library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_205 <- read_tsv("205_rawdata.tsv", comment = "#")

rawdata_205 <- rename(rawdata_205, time = Time)
rawdata_205 <- rename(rawdata_205, trial = Trial)
rawdata_205 <- rename(rawdata_205, x = 'L POR X [px]')
rawdata_205 <- rename(rawdata_205, y = 'L POR Y [px]')

rawdata_205 = rawdata_205[,-c(2)]

rawdata_205 = rawdata_205[,-c(3:20)]

rawdata_205 = rawdata_205[,-c(5:26)]

#Hacer rectangle en 205

rectangle205 <- subset(rawdata_205, time >= 626352667 & time <= 685519921)

ggplot(rectangle205, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle205_fixations <- subset(detect.fixations(rectangle205))

diagnostic.plot(rectangle205, rectangle205_fixations)

diagnostic.plot(rectangle205, rectangle205_fixations, start.time=626352667, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle205 <- calculate.summary(rectangle205_fixations)
round(stats_rectangle205, digits=2)


#Hacer vehicle en 205

vehicle205 <- subset(rawdata_205, time >= 724740889 & time <= 787920073)

ggplot(vehicle205, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle205_fixations <- subset(detect.fixations(vehicle205))

diagnostic.plot(vehicle205, vehicle205_fixations)

diagnostic.plot(vehicle205, vehicle205_fixations, start.time=724740889, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle205 <- calculate.summary(vehicle205_fixations)
round(stats_vehicle205, digits=2)



