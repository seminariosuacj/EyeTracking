library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_67 <- read_tsv("67_rawdata.tsv", comment = "#")

rawdata_67 <- rename(rawdata_67, trial = Trial)
rawdata_67 <- rename(rawdata_67, x = 'L POR X [px]')
rawdata_67 <- rename(rawdata_67, y = 'L POR Y [px]')

rawdata_67 <- rawdata_67 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 67

rectangle67 <- subset(rawdata_67, Time >= 2102242349 & Time <= 2182776804)

rectangle67$time <- seq.int(nrow(rectangle67))*4
rectangle67 = rectangle67[,-c(1)]
write_tsv(rectangle67,"D:/Mario/Escritorio/Fijaciones/rectangle67.tsv")

ggplot(rectangle67, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle67_fixations <- subset(detect.fixations(rectangle67))

diagnostic.plot(rectangle67, rectangle67_fixations)

diagnostic.plot(rectangle67, rectangle67_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle67 <- calculate.summary(rectangle67_fixations)
round(stats_rectangle67, digits=2)

#Hacer vehicle en 67

vehicle67 <- subset(rawdata_67, Time >= 2207540309 & Time <= 2272027983)

vehicle67$time <- seq.int(nrow(vehicle67))*4
vehicle67 = vehicle67[,-c(1)]
write_tsv(vehicle67,"D:/Mario/Escritorio/Fijaciones/vehicle67.tsv")

ggplot(vehicle67, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle67_fixations <- subset(detect.fixations(vehicle67))

diagnostic.plot(vehicle67, vehicle67_fixations)

diagnostic.plot(vehicle67, vehicle67_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle67 <- calculate.summary(vehicle67_fixations)
round(stats_vehicle67, digits=2)





















