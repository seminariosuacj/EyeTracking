library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_87 <- read_tsv("87_rawdata.tsv", comment = "#")

rawdata_87 <- rename(rawdata_87, trial = Trial)
rawdata_87 <- rename(rawdata_87, x = 'L POR X [px]')
rawdata_87 <- rename(rawdata_87, y = 'L POR Y [px]')

rawdata_87 <- rawdata_87 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 87

rectangle87 <- subset(rawdata_87, Time >= 7123376901 & Time <= 7183913418)

rectangle87$time <- seq.int(nrow(rectangle87))*4
rectangle87 = rectangle87[,-c(1)]
write_tsv(rectangle87,"D:/Mario/Escritorio/Fijaciones/rectangle87.tsv")

ggplot(rectangle87, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle87_fixations <- subset(detect.fixations(rectangle87))

diagnostic.plot(rectangle87, rectangle87_fixations)

diagnostic.plot(rectangle87, rectangle87_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle87 <- calculate.summary(rectangle87_fixations)
round(stats_rectangle87, digits=2)

#Hacer vehicle en 87

vehicle87 <- subset(rawdata_87, Time >= 7249746579 & Time <= 7312729159)

vehicle87$time <- seq.int(nrow(vehicle87))*4
vehicle87 = vehicle87[,-c(1)]
write_tsv(vehicle87,"D:/Mario/Escritorio/Fijaciones/vehicle87.tsv")

ggplot(vehicle87, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle87_fixations <- subset(detect.fixations(vehicle87))

diagnostic.plot(vehicle87, vehicle87_fixations)

diagnostic.plot(vehicle87, vehicle87_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle87 <- calculate.summary(vehicle87_fixations)
round(stats_vehicle87, digits=2)




