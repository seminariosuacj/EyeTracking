library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_1 <- read_tsv("1_rawdata.tsv", comment = "#")

rawdata_1 <- rename(rawdata_1, trial = Trial)
rawdata_1 <- rename(rawdata_1, x = 'L POR X [px]')
rawdata_1 <- rename(rawdata_1, y = 'L POR Y [px]')

rawdata_1 <- rawdata_1 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 1

vehicle1 <- subset(rawdata_1, Time >= 1020312074 & Time <= 1097995373)

vehicle1$time <- seq.int(nrow(vehicle1))*4
vehicle1 = vehicle1[,-c(1)]

write_tsv(vehicle1,"D:/Mario/Escritorio/Fijaciones/vehicle1.tsv")

ggplot(vehicle1, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle1_fixations <- subset(detect.fixations(vehicle1))

diagnostic.plot(vehicle1, vehicle1_fixations)

diagnostic.plot(vehicle1, vehicle1_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle1 <- calculate.summary(vehicle1_fixations)
round(stats_vehicle1, digits=2)


#Hacer rectangle en 1

rectangle1 <- subset(rawdata_1, Time >= 1145164532 & Time <= 1176966684)

rectangle1$time <- seq.int(nrow(rectangle1))*4
rectangle1 = rectangle1[,-c(1)]

write_tsv(rectangle1,"D:/Mario/Escritorio/Fijaciones/rectangle1.tsv")

ggplot(rectangle1, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle1_fixations <- subset(detect.fixations(rectangle1))

diagnostic.plot(rectangle1, rectangle1_fixations)

diagnostic.plot(rectangle1, rectangle1_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle1 <- calculate.summary(rectangle1_fixations)
round(stats_rectangle1, digits=2)

