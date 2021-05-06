library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_69 <- read_tsv("69_rawdata.tsv", comment = "#")

rawdata_69 <- rename(rawdata_69, trial = Trial)
rawdata_69 <- rename(rawdata_69, x = 'L POR X [px]')
rawdata_69 <- rename(rawdata_69, y = 'L POR Y [px]')

rawdata_69 <- rawdata_69 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 69

rectangle69 <- subset(rawdata_69, Time >= 1228879765 & Time <= 1289929044)

rectangle69$time <- seq.int(nrow(rectangle69))*4
rectangle69 = rectangle69[,-c(1)]
write_tsv(rectangle69,"D:/Mario/Escritorio/Fijaciones/rectangle69.tsv")

ggplot(rectangle69, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle69_fixations <- subset(detect.fixations(rectangle69))

diagnostic.plot(rectangle69, rectangle69_fixations)

diagnostic.plot(rectangle69, rectangle69_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle69 <- calculate.summary(rectangle69_fixations)
round(stats_rectangle69, digits=2)

#Hacer vehicle en 69

vehicle69 <- subset(rawdata_69, Time >= 1362827060 & Time <= 1441141436)

vehicle69$time <- seq.int(nrow(vehicle69))*4
vehicle69 = vehicle69[,-c(1)]
write_tsv(vehicle69,"D:/Mario/Escritorio/Fijaciones/vehicle69.tsv")

ggplot(vehicle69, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle69_fixations <- subset(detect.fixations(vehicle69))

diagnostic.plot(vehicle69, vehicle69_fixations)

diagnostic.plot(vehicle69, vehicle69_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle69 <- calculate.summary(vehicle69_fixations)
round(stats_vehicle69, digits=2)
