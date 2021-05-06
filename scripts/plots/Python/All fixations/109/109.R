library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_109 <- read_tsv("109_rawdata.tsv", comment = "#")

rawdata_109 <- rename(rawdata_109, time = Time)
rawdata_109 <- rename(rawdata_109, trial = Trial)
rawdata_109 <- rename(rawdata_109, x = 'L POR X [px]')
rawdata_109 <- rename(rawdata_109, y = 'L POR Y [px]')

rawdata_109 = rawdata_109[,-c(2)]

rawdata_109 = rawdata_109[,-c(3:20)]

rawdata_109 = rawdata_109[,-c(5:26)]

#Hacer vehicle en 109

vehicle109 <- subset(rawdata_109, time >= 7349114536 & time <= 7383480087)

ggplot(vehicle109, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle109_fixations <- subset(detect.fixations(vehicle109))

diagnostic.plot(vehicle109, vehicle109_fixations)

diagnostic.plot(vehicle109, vehicle109_fixations, start.time=7349114536, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle109 <- calculate.summary(vehicle109_fixations)
round(stats_vehicle109, digits=2)


#Hacer rectangle en 109

rectangle109 <- subset(rawdata_109, time >= 7412310049 & time <= 7448071581)

ggplot(rectangle109, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle109_fixations <- subset(detect.fixations(rectangle109))

diagnostic.plot(rectangle109, rectangle109_fixations)

diagnostic.plot(rectangle109, rectangle109_fixations, start.time=7412310049, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle109 <- calculate.summary(rectangle109_fixations)
round(stats_rectangle109, digits=2)






