library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_112 <- read_tsv("112_rawdata.tsv", comment = "#")

rawdata_112 <- rename(rawdata_112, trial = Trial)
rawdata_112 <- rename(rawdata_112, x = 'L POR X [px]')
rawdata_112 <- rename(rawdata_112, y = 'L POR Y [px]')

rawdata_112 <- rawdata_112 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 112

rectangle112 <- subset(rawdata_112, Time >= 432422617 & Time <= 479076812)

rectangle112$time <- seq.int(nrow(rectangle112))*4
rectangle112 = rectangle112[,-c(1)]
write_tsv(rectangle112,"D:/Mario/Escritorio/Fijaciones/rectangle112.tsv")

ggplot(rectangle112, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle112_fixations <- subset(detect.fixations(rectangle112))

diagnostic.plot(rectangle112, rectangle112_fixations)

diagnostic.plot(rectangle112, rectangle112_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle112 <- calculate.summary(rectangle112_fixations)
round(stats_rectangle112, digits=2)

#Hacer vehicle en 112

vehicle112 <- subset(rawdata_112, Time >= 508394419 & Time <= 571123502)

vehicle112$time <- seq.int(nrow(vehicle112))*4
vehicle112 = vehicle112[,-c(1)]
write_tsv(vehicle112,"D:/Mario/Escritorio/Fijaciones/vehicle112.tsv")

ggplot(vehicle112, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle112_fixations <- subset(detect.fixations(vehicle112))

diagnostic.plot(vehicle112, vehicle112_fixations)

diagnostic.plot(vehicle112, vehicle112_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle112 <- calculate.summary(vehicle112_fixations)
round(stats_vehicle112, digits=2)























