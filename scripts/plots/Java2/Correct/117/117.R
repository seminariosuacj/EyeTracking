library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_117 <- read_tsv("117_rawdata.tsv", comment = "#")

rawdata_117 <- rename(rawdata_117, trial = Trial)
rawdata_117 <- rename(rawdata_117, x = 'L POR X [px]')
rawdata_117 <- rename(rawdata_117, y = 'L POR Y [px]')

rawdata_117 <- rawdata_117 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 117

vehicle117 <- subset(rawdata_117, Time >= 1348874222 & Time <= 1447078185)

vehicle117$time <- seq.int(nrow(vehicle117))*4
vehicle117 = vehicle117[,-c(1)]
write_tsv(vehicle117,"D:/Mario/Escritorio/Fijaciones/vehicle117.tsv")

ggplot(vehicle117, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle117_fixations <- subset(detect.fixations(vehicle117))

diagnostic.plot(vehicle117, vehicle117_fixations)

diagnostic.plot(vehicle117, vehicle117_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle117 <- calculate.summary(vehicle117_fixations)
round(stats_vehicle117, digits=2)

#Hacer rectangle en 117

rectangle117 <- subset(rawdata_117, Time >= 1490283072 & Time <= 1580295849)

rectangle117$time <- seq.int(nrow(rectangle117))*4
rectangle117 = rectangle117[,-c(1)]
write_tsv(rectangle117,"D:/Mario/Escritorio/Fijaciones/rectangle117.tsv")

ggplot(rectangle117, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle117_fixations <- subset(detect.fixations(rectangle117))

diagnostic.plot(rectangle117, rectangle117_fixations)

diagnostic.plot(rectangle117, rectangle117_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle117 <- calculate.summary(rectangle117_fixations)
round(stats_rectangle117, digits=2)
