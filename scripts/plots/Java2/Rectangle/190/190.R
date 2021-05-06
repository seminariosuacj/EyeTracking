library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_190 <- read_tsv("190_rawdata.tsv", comment = "#")

rawdata_190 <- rename(rawdata_190, trial = Trial)
rawdata_190 <- rename(rawdata_190, x = 'L POR X [px]')
rawdata_190 <- rename(rawdata_190, y = 'L POR Y [px]')

rawdata_190 <- rawdata_190 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 190

vehicle190 <- subset(rawdata_190, Time >= 1690172988 & Time <= 1715627158)

vehicle190$time <- seq.int(nrow(vehicle190))*4
vehicle190 = vehicle190[,-c(1)]
write_tsv(vehicle190,"D:/Mario/Escritorio/Fijaciones/vehicle190.tsv")

ggplot(vehicle190, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle190_fixations <- subset(detect.fixations(vehicle190))

diagnostic.plot(vehicle190, vehicle190_fixations)

diagnostic.plot(vehicle190, vehicle190_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle190 <- calculate.summary(vehicle190_fixations)
round(stats_vehicle190, digits=2)

#Hacer rectangle en 190

rectangle190 <- subset(rawdata_190, Time >= 1741553569 & Time <= 1760908159)

rectangle190$time <- seq.int(nrow(rectangle190))*4
rectangle190 = rectangle190[,-c(1)]
write_tsv(rectangle190,"D:/Mario/Escritorio/Fijaciones/rectangle190.tsv")

ggplot(rectangle190, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle190_fixations <- subset(detect.fixations(rectangle190))

diagnostic.plot(rectangle190, rectangle190_fixations)

diagnostic.plot(rectangle190, rectangle190_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle190 <- calculate.summary(rectangle190_fixations)
round(stats_rectangle190, digits=2)








