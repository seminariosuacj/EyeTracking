library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_48 <- read_tsv("48_rawdata.tsv", comment = "#")

rawdata_48 <- rename(rawdata_48, trial = Trial)
rawdata_48 <- rename(rawdata_48, x = 'L POR X [px]')
rawdata_48 <- rename(rawdata_48, y = 'L POR Y [px]')

rawdata_48 <- rawdata_48 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 48

vehicle48 <- subset(rawdata_48, Time >= 371544165 & Time <= 421092493)

vehicle48$time <- seq.int(nrow(vehicle48))*4
vehicle48 = vehicle48[,-c(1)]
write_tsv(vehicle48,"D:/Mario/Escritorio/Fijaciones/vehicle48.tsv")

ggplot(vehicle48, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle48_fixations <- subset(detect.fixations(vehicle48))

diagnostic.plot(vehicle48, vehicle48_fixations)

diagnostic.plot(vehicle48, vehicle48_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle48 <- calculate.summary(vehicle48_fixations)
round(stats_vehicle48, digits=2)

#Hacer rectangle en 48

rectangle48 <- subset(rawdata_48, Time >= 440199928 & Time <= 479709209)

rectangle48$time <- seq.int(nrow(rectangle48))*4
rectangle48 = rectangle48[,-c(1)]
write_tsv(rectangle48,"D:/Mario/Escritorio/Fijaciones/rectangle48.tsv")

ggplot(rectangle48, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle48_fixations <- subset(detect.fixations(rectangle48))

diagnostic.plot(rectangle48, rectangle48_fixations)

diagnostic.plot(rectangle48, rectangle48_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle48 <- calculate.summary(rectangle48_fixations)
round(stats_rectangle48, digits=2)














