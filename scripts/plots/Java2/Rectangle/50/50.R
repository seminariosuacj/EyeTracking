library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_50 <- read_tsv("50_rawdata.tsv", comment = "#")

rawdata_50 <- rename(rawdata_50, trial = Trial)
rawdata_50 <- rename(rawdata_50, x = 'L POR X [px]')
rawdata_50 <- rename(rawdata_50, y = 'L POR Y [px]')

rawdata_50 <- rawdata_50 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 50

vehicle50 <- subset(rawdata_50, Time >= 5096829931 & Time <= 5252744600)

vehicle50$time <- seq.int(nrow(vehicle50))*4
vehicle50 = vehicle50[,-c(1)]
write_tsv(vehicle50,"D:/Mario/Escritorio/Fijaciones/vehicle50.tsv")

ggplot(vehicle50, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle50_fixations <- subset(detect.fixations(vehicle50))

diagnostic.plot(vehicle50, vehicle50_fixations)

diagnostic.plot(vehicle50, vehicle50_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle50 <- calculate.summary(vehicle50_fixations)
round(stats_vehicle50, digits=2)

#Hacer rectangle en 50

rectangle50 <- subset(rawdata_50, Time >= 5291493575 & Time <= 5356104451)

rectangle50$time <- seq.int(nrow(rectangle50))*4
rectangle50 = rectangle50[,-c(1)]
write_tsv(rectangle50,"D:/Mario/Escritorio/Fijaciones/rectangle50.tsv")

ggplot(rectangle50, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle50_fixations <- subset(detect.fixations(rectangle50))

diagnostic.plot(rectangle50, rectangle50_fixations)

diagnostic.plot(rectangle50, rectangle50_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle50 <- calculate.summary(rectangle50_fixations)
round(stats_rectangle50, digits=2)














