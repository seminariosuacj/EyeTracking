library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_177 <- read_tsv("177_rawdata.tsv", comment = "#")

rawdata_177 <- rename(rawdata_177, trial = Trial)
rawdata_177 <- rename(rawdata_177, x = 'L POR X [px]')
rawdata_177 <- rename(rawdata_177, y = 'L POR Y [px]')

rawdata_177 <- rawdata_177 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 177

rectangle177 <- subset(rawdata_177, Time >= 1155345148 & Time <= 1220446625)

rectangle177$time <- seq.int(nrow(rectangle177))*4
rectangle177 = rectangle177[,-c(1)]
write_tsv(rectangle177,"D:/Mario/Escritorio/Fijaciones/rectangle177.tsv")

ggplot(rectangle177, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle177_fixations <- subset(detect.fixations(rectangle177))

diagnostic.plot(rectangle177, rectangle177_fixations)

diagnostic.plot(rectangle177, rectangle177_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle177 <- calculate.summary(rectangle177_fixations)
round(stats_rectangle177, digits=2)

#Hacer vehicle en 177

vehicle177 <- subset(rawdata_177, Time >= 1244368055 & Time <= 1328745023)

vehicle177$time <- seq.int(nrow(vehicle177))*4
vehicle177 = vehicle177[,-c(1)]
write_tsv(vehicle177,"D:/Mario/Escritorio/Fijaciones/vehicle177.tsv")

ggplot(vehicle177, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle177_fixations <- subset(detect.fixations(vehicle177))

diagnostic.plot(vehicle177, vehicle177_fixations)

diagnostic.plot(vehicle177, vehicle177_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle177 <- calculate.summary(vehicle177_fixations)
round(stats_vehicle177, digits=2)






























