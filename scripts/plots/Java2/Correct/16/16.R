library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_16 <- read_tsv("16_rawdata.tsv", comment = "#")

rawdata_16 <- rename(rawdata_16, trial = Trial)
rawdata_16 <- rename(rawdata_16, x = 'L POR X [px]')
rawdata_16 <- rename(rawdata_16, y = 'L POR Y [px]')

rawdata_16 <- rawdata_16 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 16

rectangle16 <- subset(rawdata_16, Time >= 7480479768 & Time <= 7531893948)

rectangle16$time <- seq.int(nrow(rectangle16))*4
rectangle16 = rectangle16[,-c(1)]
write_tsv(rectangle16,"D:/Mario/Escritorio/Fijaciones/rectangle16.tsv")

ggplot(rectangle16, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle16_fixations <- subset(detect.fixations(rectangle16))

diagnostic.plot(rectangle16, rectangle16_fixations)

diagnostic.plot(rectangle16, rectangle16_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle16 <- calculate.summary(rectangle16_fixations)
round(stats_rectangle16, digits=2)

#Hacer vehicle en 16

vehicle16 <- subset(rawdata_16, Time >= 7563743653 & Time <= 7651466449)

vehicle16$time <- seq.int(nrow(vehicle16))*4
vehicle16 = vehicle16[,-c(1)]
write_tsv(vehicle16,"D:/Mario/Escritorio/Fijaciones/vehicle16.tsv")

ggplot(vehicle16, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle16_fixations <- subset(detect.fixations(vehicle16))

diagnostic.plot(vehicle16, vehicle16_fixations)

diagnostic.plot(vehicle16, vehicle16_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle16 <- calculate.summary(vehicle16_fixations)
round(stats_vehicle16, digits=2)
