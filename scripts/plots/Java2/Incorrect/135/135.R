library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_135 <- read_tsv("135_rawdata.tsv", comment = "#")

rawdata_135 <- rename(rawdata_135, trial = Trial)
rawdata_135 <- rename(rawdata_135, x = 'L POR X [px]')
rawdata_135 <- rename(rawdata_135, y = 'L POR Y [px]')

rawdata_135 <- rawdata_135 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 135

rectangle135 <- subset(rawdata_135, Time >= 3678399573 & Time <= 3743406776)

rectangle135$time <- seq.int(nrow(rectangle135))*4
rectangle135 = rectangle135[,-c(1)]
write_tsv(rectangle135,"D:/Mario/Escritorio/Fijaciones/rectangle135.tsv")

ggplot(rectangle135, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle135_fixations <- subset(detect.fixations(rectangle135))

diagnostic.plot(rectangle135, rectangle135_fixations)

diagnostic.plot(rectangle135, rectangle135_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle135 <- calculate.summary(rectangle135_fixations)
round(stats_rectangle135, digits=2)

#Hacer vehicle en 135

vehicle135 <- subset(rawdata_135, Time >= 3799638767 & Time <= 3930067786)

vehicle135$time <- seq.int(nrow(vehicle135))*4
vehicle135 = vehicle135[,-c(1)]
write_tsv(vehicle135,"D:/Mario/Escritorio/Fijaciones/vehicle135.tsv")

ggplot(vehicle135, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle135_fixations <- subset(detect.fixations(vehicle135))

diagnostic.plot(vehicle135, vehicle135_fixations)

diagnostic.plot(vehicle135, vehicle135_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle135 <- calculate.summary(vehicle135_fixations)
round(stats_vehicle135, digits=2)
