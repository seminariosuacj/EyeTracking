library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_106 <- read_tsv("106_rawdata.tsv", comment = "#")

rawdata_106 <- rename(rawdata_106, trial = Trial)
rawdata_106 <- rename(rawdata_106, x = 'L POR X [px]')
rawdata_106 <- rename(rawdata_106, y = 'L POR Y [px]')

rawdata_106 <- rawdata_106 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 106

vehicle106 <- subset(rawdata_106, Time >= 21889575578 & Time <= 21965422163)

vehicle106$time <- seq.int(nrow(vehicle106))*4
vehicle106 = vehicle106[,-c(1)]
write_tsv(vehicle106,"D:/Mario/Escritorio/Fijaciones/vehicle106.tsv")

ggplot(vehicle106, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle106_fixations <- subset(detect.fixations(vehicle106))

diagnostic.plot(vehicle106, vehicle106_fixations)

diagnostic.plot(vehicle106, vehicle106_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle106 <- calculate.summary(vehicle106_fixations)
round(stats_vehicle106, digits=2)

#Hacer rectangle en 106

rectangle106 <- subset(rawdata_106, Time >= 21995855935 & Time <= 22021410047)

rectangle106$time <- seq.int(nrow(rectangle106))*4
rectangle106 = rectangle106[,-c(1)]
write_tsv(rectangle106,"D:/Mario/Escritorio/Fijaciones/rectangle106.tsv")

ggplot(rectangle106, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle106_fixations <- subset(detect.fixations(rectangle106))

diagnostic.plot(rectangle106, rectangle106_fixations)

diagnostic.plot(rectangle106, rectangle106_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle106 <- calculate.summary(rectangle106_fixations)
round(stats_rectangle106, digits=2)





















