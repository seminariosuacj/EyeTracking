library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_5 <- read_tsv("5_rawdata.tsv", comment = "#")

rawdata_5 <- rename(rawdata_5, trial = Trial)
rawdata_5 <- rename(rawdata_5, x = 'L POR X [px]')
rawdata_5 <- rename(rawdata_5, y = 'L POR Y [px]')

rawdata_5 <- rawdata_5 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 5

rectangle5 <- subset(rawdata_5, Time >= 10903541999 & Time <= 10951082611)

rectangle5$time <- seq.int(nrow(rectangle5))*4
rectangle5 = rectangle5[,-c(1)]
write_tsv(rectangle5,"D:/Mario/Escritorio/Fijaciones/rectangle5.tsv")

ggplot(rectangle5, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle5_fixations <- subset(detect.fixations(rectangle5))

diagnostic.plot(rectangle5, rectangle5_fixations)

diagnostic.plot(rectangle5, rectangle5_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle5 <- calculate.summary(rectangle5_fixations)
round(stats_rectangle5, digits=2)

#Hacer vehicle en 5

vehicle5 <- subset(rawdata_5, Time >= 10984887975 & Time <= 11026951629)

vehicle5$time <- seq.int(nrow(vehicle5))*4
vehicle5 = vehicle5[,-c(1)]
write_tsv(vehicle5,"D:/Mario/Escritorio/Fijaciones/vehicle5.tsv")

ggplot(vehicle5, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle5_fixations <- subset(detect.fixations(vehicle5))

diagnostic.plot(vehicle5, vehicle5_fixations)

diagnostic.plot(vehicle5, vehicle5_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle5 <- calculate.summary(vehicle5_fixations)
round(stats_vehicle5, digits=2)




