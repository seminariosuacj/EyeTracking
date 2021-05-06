library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_38 <- read_tsv("38_rawdata.tsv", comment = "#")

rawdata_38 <- rename(rawdata_38, trial = Trial)
rawdata_38 <- rename(rawdata_38, x = 'L POR X [px]')
rawdata_38 <- rename(rawdata_38, y = 'L POR Y [px]')

rawdata_38 <- rawdata_38 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 38

rectangle38 <- subset(rawdata_38, Time >= 322871177 & Time <= 383606969)

rectangle38$time <- seq.int(nrow(rectangle38))*4
rectangle38 = rectangle38[,-c(1)]
write_tsv(rectangle38,"D:/Mario/Escritorio/Fijaciones/rectangle38.tsv")

ggplot(rectangle38, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle38_fixations <- subset(detect.fixations(rectangle38))

diagnostic.plot(rectangle38, rectangle38_fixations)

diagnostic.plot(rectangle38, rectangle38_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle38 <- calculate.summary(rectangle38_fixations)
round(stats_rectangle38, digits=2)

#Hacer vehicle en 38

vehicle38 <- subset(rawdata_38, Time >= 419024338 & Time <= 452777876)

vehicle38$time <- seq.int(nrow(vehicle38))*4
vehicle38 = vehicle38[,-c(1)]
write_tsv(vehicle38,"D:/Mario/Escritorio/Fijaciones/vehicle38.tsv")

ggplot(vehicle38, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle38_fixations <- subset(detect.fixations(vehicle38))

diagnostic.plot(vehicle38, vehicle38_fixations)

diagnostic.plot(vehicle38, vehicle38_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle38 <- calculate.summary(vehicle38_fixations)
round(stats_vehicle38, digits=2)
