library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_60 <- read_tsv("60_rawdata.tsv", comment = "#")

rawdata_60 <- rename(rawdata_60, trial = Trial)
rawdata_60 <- rename(rawdata_60, x = 'L POR X [px]')
rawdata_60 <- rename(rawdata_60, y = 'L POR Y [px]')

rawdata_60 <- rawdata_60 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 60

vehicle60 <- subset(rawdata_60, Time >= 1314867707 & Time <= 1380287409)

vehicle60$time <- seq.int(nrow(vehicle60))*4
vehicle60 = vehicle60[,-c(1)]
write_tsv(vehicle60,"D:/Mario/Escritorio/Fijaciones/vehicle60.tsv")

ggplot(vehicle60, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle60_fixations <- subset(detect.fixations(vehicle60))

diagnostic.plot(vehicle60, vehicle60_fixations)

diagnostic.plot(vehicle60, vehicle60_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle60 <- calculate.summary(vehicle60_fixations)
round(stats_vehicle60, digits=2)

#Hacer rectangle en 60

rectangle60 <- subset(rawdata_60, Time >= 1403509716 & Time <= 1456350213)

rectangle60$time <- seq.int(nrow(rectangle60))*4
rectangle60 = rectangle60[,-c(1)]
write_tsv(rectangle60,"D:/Mario/Escritorio/Fijaciones/rectangle60.tsv")

ggplot(rectangle60, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle60_fixations <- subset(detect.fixations(rectangle60))

diagnostic.plot(rectangle60, rectangle60_fixations)

diagnostic.plot(rectangle60, rectangle60_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle60 <- calculate.summary(rectangle60_fixations)
round(stats_rectangle60, digits=2)



















