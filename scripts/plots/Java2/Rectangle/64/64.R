library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_64 <- read_tsv("64_rawdata.tsv", comment = "#")

rawdata_64 <- rename(rawdata_64, trial = Trial)
rawdata_64 <- rename(rawdata_64, x = 'L POR X [px]')
rawdata_64 <- rename(rawdata_64, y = 'L POR Y [px]')

rawdata_64 <- rawdata_64 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 64

vehicle64 <- subset(rawdata_64, Time >= 789791113 & Time <= 955596228)

vehicle64$time <- seq.int(nrow(vehicle64))*4
vehicle64 = vehicle64[,-c(1)]
write_tsv(vehicle64,"D:/Mario/Escritorio/Fijaciones/vehicle64.tsv")

ggplot(vehicle64, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle64_fixations <- subset(detect.fixations(vehicle64))

diagnostic.plot(vehicle64, vehicle64_fixations)

diagnostic.plot(vehicle64, vehicle64_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle64 <- calculate.summary(vehicle64_fixations)
round(stats_vehicle64, digits=2)

#Hacer rectangle en 64

rectangle64 <- subset(rawdata_64, Time >= 992681532 & Time <= 1094719391)

rectangle64$time <- seq.int(nrow(rectangle64))*4
rectangle64 = rectangle64[,-c(1)]
write_tsv(rectangle64,"D:/Mario/Escritorio/Fijaciones/rectangle64.tsv")

ggplot(rectangle64, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle64_fixations <- subset(detect.fixations(rectangle64))

diagnostic.plot(rectangle64, rectangle64_fixations)

diagnostic.plot(rectangle64, rectangle64_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle64 <- calculate.summary(rectangle64_fixations)
round(stats_rectangle64, digits=2)



















