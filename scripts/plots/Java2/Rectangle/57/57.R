library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_57 <- read_tsv("57_rawdata.tsv", comment = "#")

rawdata_57 <- rename(rawdata_57, trial = Trial)
rawdata_57 <- rename(rawdata_57, x = 'L POR X [px]')
rawdata_57 <- rename(rawdata_57, y = 'L POR Y [px]')

rawdata_57 <- rawdata_57 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 57

rectangle57 <- subset(rawdata_57, Time >= 3025830901 & Time <= 3064319752)

rectangle57$time <- seq.int(nrow(rectangle57))*4
rectangle57 = rectangle57[,-c(1)]
write_tsv(rectangle57,"D:/Mario/Escritorio/Fijaciones/rectangle57.tsv")

ggplot(rectangle57, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle57_fixations <- subset(detect.fixations(rectangle57))

diagnostic.plot(rectangle57, rectangle57_fixations)

diagnostic.plot(rectangle57, rectangle57_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle57 <- calculate.summary(rectangle57_fixations)
round(stats_rectangle57, digits=2)

#Hacer vehicle en 57

vehicle57 <- subset(rawdata_57, Time >= 3105837240 & Time <= 3179359133)

vehicle57$time <- seq.int(nrow(vehicle57))*4
vehicle57 = vehicle57[,-c(1)]
write_tsv(vehicle57,"D:/Mario/Escritorio/Fijaciones/vehicle57.tsv")

ggplot(vehicle57, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle57_fixations <- subset(detect.fixations(vehicle57))

diagnostic.plot(vehicle57, vehicle57_fixations)

diagnostic.plot(vehicle57, vehicle57_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle57 <- calculate.summary(vehicle57_fixations)
round(stats_vehicle57, digits=2)

















