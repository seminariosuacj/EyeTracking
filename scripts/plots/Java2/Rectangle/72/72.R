library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_72 <- read_tsv("72_rawdata.tsv", comment = "#")

rawdata_72 <- rename(rawdata_72, trial = Trial)
rawdata_72 <- rename(rawdata_72, x = 'L POR X [px]')
rawdata_72 <- rename(rawdata_72, y = 'L POR Y [px]')

rawdata_72 <- rawdata_72 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 72

vehicle72 <- subset(rawdata_72, Time >= 818497984 & Time <= 917599119)

vehicle72$time <- seq.int(nrow(vehicle72))*4
vehicle72 = vehicle72[,-c(1)]
write_tsv(vehicle72,"D:/Mario/Escritorio/Fijaciones/vehicle72.tsv")

ggplot(vehicle72, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle72_fixations <- subset(detect.fixations(vehicle72))

diagnostic.plot(vehicle72, vehicle72_fixations)

diagnostic.plot(vehicle72, vehicle72_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle72 <- calculate.summary(vehicle72_fixations)
round(stats_vehicle72, digits=2)

#Hacer rectangle en 72

rectangle72 <- subset(rawdata_72, Time >= 937169894 & Time <= 990222301)

rectangle72$time <- seq.int(nrow(rectangle72))*4
rectangle72 = rectangle72[,-c(1)]
write_tsv(rectangle72,"D:/Mario/Escritorio/Fijaciones/rectangle72.tsv")

ggplot(rectangle72, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle72_fixations <- subset(detect.fixations(rectangle72))

diagnostic.plot(rectangle72, rectangle72_fixations)

diagnostic.plot(rectangle72, rectangle72_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle72 <- calculate.summary(rectangle72_fixations)
round(stats_rectangle72, digits=2)























