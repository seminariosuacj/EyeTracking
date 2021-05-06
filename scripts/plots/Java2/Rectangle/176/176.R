library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_176 <- read_tsv("176_rawdata.tsv", comment = "#")

rawdata_176 <- rename(rawdata_176, trial = Trial)
rawdata_176 <- rename(rawdata_176, x = 'L POR X [px]')
rawdata_176 <- rename(rawdata_176, y = 'L POR Y [px]')

rawdata_176 <- rawdata_176 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 176

rectangle176 <- subset(rawdata_176, Time >= 2791109110 & Time <= 2900785765)

rectangle176$time <- seq.int(nrow(rectangle176))*4
rectangle176 = rectangle176[,-c(1)]
write_tsv(rectangle176,"D:/Mario/Escritorio/Fijaciones/rectangle176.tsv")

ggplot(rectangle176, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle176_fixations <- subset(detect.fixations(rectangle176))

diagnostic.plot(rectangle176, rectangle176_fixations)

diagnostic.plot(rectangle176, rectangle176_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle176 <- calculate.summary(rectangle176_fixations)
round(stats_rectangle176, digits=2)

#Hacer vehicle en 176

vehicle176 <- subset(rawdata_176, Time >= 2944314750 & Time <= 3026101171)

vehicle176$time <- seq.int(nrow(vehicle176))*4
vehicle176 = vehicle176[,-c(1)]
write_tsv(vehicle176,"D:/Mario/Escritorio/Fijaciones/vehicle176.tsv")

ggplot(vehicle176, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle176_fixations <- subset(detect.fixations(vehicle176))

diagnostic.plot(vehicle176, vehicle176_fixations)

diagnostic.plot(vehicle176, vehicle176_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle176 <- calculate.summary(vehicle176_fixations)
round(stats_vehicle176, digits=2)






























