library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_114 <- read_tsv("114_rawdata.tsv", comment = "#")

rawdata_114 <- rename(rawdata_114, trial = Trial)
rawdata_114 <- rename(rawdata_114, x = 'L POR X [px]')
rawdata_114 <- rename(rawdata_114, y = 'L POR Y [px]')

rawdata_114 <- rawdata_114 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 114

rectangle114 <- subset(rawdata_114, Time >= 3033429526 & Time <= 3053120052)

rectangle114$time <- seq.int(nrow(rectangle114))*4
rectangle114 = rectangle114[,-c(1)]
write_tsv(rectangle114,"D:/Mario/Escritorio/Fijaciones/rectangle114.tsv")

ggplot(rectangle114, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle114_fixations <- subset(detect.fixations(rectangle114))

diagnostic.plot(rectangle114, rectangle114_fixations)

diagnostic.plot(rectangle114, rectangle114_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle114 <- calculate.summary(rectangle114_fixations)
round(stats_rectangle114, digits=2)

#Hacer vehicle en 114

vehicle114 <- subset(rawdata_114, Time >= 3088126130 & Time <= 3116279461)

vehicle114$time <- seq.int(nrow(vehicle114))*4
vehicle114 = vehicle114[,-c(1)]
write_tsv(vehicle114,"D:/Mario/Escritorio/Fijaciones/vehicle114.tsv")

ggplot(vehicle114, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle114_fixations <- subset(detect.fixations(vehicle114))

diagnostic.plot(vehicle114, vehicle114_fixations)

diagnostic.plot(vehicle114, vehicle114_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle114 <- calculate.summary(vehicle114_fixations)
round(stats_vehicle114, digits=2)























