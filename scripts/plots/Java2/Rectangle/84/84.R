library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_84 <- read_tsv("84_rawdata.tsv", comment = "#")

rawdata_84 <- rename(rawdata_84, trial = Trial)
rawdata_84 <- rename(rawdata_84, x = 'L POR X [px]')
rawdata_84 <- rename(rawdata_84, y = 'L POR Y [px]')

rawdata_84 <- rawdata_84 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 84

vehicle84 <- subset(rawdata_84, Time >= 10255541547 & Time <= 10312321398)

vehicle84$time <- seq.int(nrow(vehicle84))*4
vehicle84 = vehicle84[,-c(1)]
write_tsv(vehicle84,"D:/Mario/Escritorio/Fijaciones/vehicle84.tsv")

ggplot(vehicle84, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle84_fixations <- subset(detect.fixations(vehicle84))

diagnostic.plot(vehicle84, vehicle84_fixations)

diagnostic.plot(vehicle84, vehicle84_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle84 <- calculate.summary(vehicle84_fixations)
round(stats_vehicle84, digits=2)

#Hacer rectangle en 84

rectangle84 <- subset(rawdata_84, Time >= 10355910055 & Time <= 10444363921)

rectangle84$time <- seq.int(nrow(rectangle84))*4
rectangle84 = rectangle84[,-c(1)]
write_tsv(rectangle84,"D:/Mario/Escritorio/Fijaciones/rectangle84.tsv")

ggplot(rectangle84, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle84_fixations <- subset(detect.fixations(rectangle84))

diagnostic.plot(rectangle84, rectangle84_fixations)

diagnostic.plot(rectangle84, rectangle84_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle84 <- calculate.summary(rectangle84_fixations)
round(stats_rectangle84, digits=2)























