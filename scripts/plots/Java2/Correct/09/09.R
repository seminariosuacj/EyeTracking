library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_9 <- read_tsv("9_rawdata.tsv", comment = "#")

rawdata_9 <- rename(rawdata_9, trial = Trial)
rawdata_9 <- rename(rawdata_9, x = 'L POR X [px]')
rawdata_9 <- rename(rawdata_9, y = 'L POR Y [px]')

rawdata_9 <- rawdata_9 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 9

rectangle9 <- subset(rawdata_9, Time >= 444054244 & Time <= 485723907)

rectangle9$time <- seq.int(nrow(rectangle9))*4
rectangle9 = rectangle9[,-c(1)]
write_tsv(rectangle9,"D:/Mario/Escritorio/Fijaciones/rectangle9.tsv")

ggplot(rectangle9, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle9_fixations <- subset(detect.fixations(rectangle9))

diagnostic.plot(rectangle9, rectangle9_fixations)

diagnostic.plot(rectangle9, rectangle9_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle9 <- calculate.summary(rectangle9_fixations)
round(stats_rectangle9, digits=2)

#Hacer vehicle en 9

vehicle9 <- subset(rawdata_9, Time >= 516841463 & Time <= 586399121)

vehicle9$time <- seq.int(nrow(vehicle9))*4
vehicle9 = vehicle9[,-c(1)]
write_tsv(vehicle9,"D:/Mario/Escritorio/Fijaciones/vehicle9.tsv")

ggplot(vehicle9, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle9_fixations <- subset(detect.fixations(vehicle9))

diagnostic.plot(vehicle9, vehicle9_fixations)

diagnostic.plot(vehicle9, vehicle9_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle9 <- calculate.summary(vehicle9_fixations)
round(stats_vehicle9, digits=2)
