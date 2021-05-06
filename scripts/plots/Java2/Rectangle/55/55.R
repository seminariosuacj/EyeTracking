library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_55 <- read_tsv("55_rawdata.tsv", comment = "#")

rawdata_55 <- rename(rawdata_55, trial = Trial)
rawdata_55 <- rename(rawdata_55, x = 'L POR X [px]')
rawdata_55 <- rename(rawdata_55, y = 'L POR Y [px]')

rawdata_55 <- rawdata_55 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 55

rectangle55 <- subset(rawdata_55, Time >= 1896978569 & Time <= 1992563926)

rectangle55$time <- seq.int(nrow(rectangle55))*4
rectangle55 = rectangle55[,-c(1)]
write_tsv(rectangle55,"D:/Mario/Escritorio/Fijaciones/rectangle55.tsv")

ggplot(rectangle55, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle55_fixations <- subset(detect.fixations(rectangle55))

diagnostic.plot(rectangle55, rectangle55_fixations)

diagnostic.plot(rectangle55, rectangle55_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle55 <- calculate.summary(rectangle55_fixations)
round(stats_rectangle55, digits=2)

#Hacer vehicle en 55

vehicle55 <- subset(rawdata_55, Time >= 2012342670 & Time <= 2133322700)

vehicle55$time <- seq.int(nrow(vehicle55))*4
vehicle55 = vehicle55[,-c(1)]
write_tsv(vehicle55,"D:/Mario/Escritorio/Fijaciones/vehicle55.tsv")

ggplot(vehicle55, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle55_fixations <- subset(detect.fixations(vehicle55))

diagnostic.plot(vehicle55, vehicle55_fixations)

diagnostic.plot(vehicle55, vehicle55_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle55 <- calculate.summary(vehicle55_fixations)
round(stats_vehicle55, digits=2)

















