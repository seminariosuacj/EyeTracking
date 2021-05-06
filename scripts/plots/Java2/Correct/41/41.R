library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_41 <- read_tsv("41_rawdata.tsv", comment = "#")

rawdata_41 <- rename(rawdata_41, trial = Trial)
rawdata_41 <- rename(rawdata_41, x = 'L POR X [px]')
rawdata_41 <- rename(rawdata_41, y = 'L POR Y [px]')

rawdata_41 <- rawdata_41 %>%
  select('Time','trial','x','y','L Validity')

#Hacer en rectangle
rectangle41 <- subset(rawdata_41, Time >= 10754033281 & Time <= 10844769846)

rectangle41$time <- seq.int(nrow(rectangle41))*4
rectangle41 = rectangle41[,-c(1)]
write_tsv(rectangle41,"D:/Mario/Escritorio/Fijaciones/rectangle41.tsv")

ggplot(rectangle41, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle41_fixations <- subset(detect.fixations(rectangle41))

diagnostic.plot(rectangle41, rectangle41_fixations)

diagnostic.plot(rectangle41, rectangle41_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle41 <- calculate.summary(rectangle41_fixations)
round(stats_rectangle41, digits=2)

#Hacer vehicle en 41

vehicle41 <- subset(rawdata_41, Time >= 10897662191 & Time <= 10974335204)

vehicle41$time <- seq.int(nrow(vehicle41))*4
vehicle41 = vehicle41[,-c(1)]
write_tsv(vehicle41,"D:/Mario/Escritorio/Fijaciones/vehicle41.tsv")

ggplot(vehicle41, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle41_fixations <- subset(detect.fixations(vehicle41))

diagnostic.plot(vehicle41, vehicle41_fixations)

diagnostic.plot(vehicle41, vehicle41_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle41 <- calculate.summary(vehicle41_fixations)
round(stats_vehicle41, digits=2)
