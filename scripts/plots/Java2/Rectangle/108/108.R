library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_108 <- read_tsv("108_rawdata.tsv", comment = "#")

rawdata_108 <- rename(rawdata_108, trial = Trial)
rawdata_108 <- rename(rawdata_108, x = 'L POR X [px]')
rawdata_108 <- rename(rawdata_108, y = 'L POR Y [px]')

rawdata_108 <- rawdata_108 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 108

vehicle108 <- subset(rawdata_108, Time >= 824113654 & Time <= 857407535)

vehicle108$time <- seq.int(nrow(vehicle108))*4
vehicle108 = vehicle108[,-c(1)]
write_tsv(vehicle108,"D:/Mario/Escritorio/Fijaciones/vehicle108.tsv")

ggplot(vehicle108, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle108_fixations <- subset(detect.fixations(vehicle108))

diagnostic.plot(vehicle108, vehicle108_fixations)

diagnostic.plot(vehicle108, vehicle108_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle108 <- calculate.summary(vehicle108_fixations)
round(stats_vehicle108, digits=2)

#Hacer rectangle en 108

rectangle108 <- subset(rawdata_108, Time >= 865298941 & Time <= 906816022)

rectangle108$time <- seq.int(nrow(rectangle108))*4
rectangle108 = rectangle108[,-c(1)]
write_tsv(rectangle108,"D:/Mario/Escritorio/Fijaciones/rectangle108.tsv")

ggplot(rectangle108, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle108_fixations <- subset(detect.fixations(rectangle108))

diagnostic.plot(rectangle108, rectangle108_fixations)

diagnostic.plot(rectangle108, rectangle108_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle108 <- calculate.summary(rectangle108_fixations)
round(stats_rectangle108, digits=2)





















