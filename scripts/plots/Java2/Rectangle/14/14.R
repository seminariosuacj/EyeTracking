library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_14 <- read_tsv("14_rawdata.tsv", comment = "#")

rawdata_14 <- rename(rawdata_14, trial = Trial)
rawdata_14 <- rename(rawdata_14, x = 'L POR X [px]')
rawdata_14 <- rename(rawdata_14, y = 'L POR Y [px]')

rawdata_14 <- rawdata_14 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 14

rectangle14 <- subset(rawdata_14, Time >= 2188906918 & Time <= 2223124605)

rectangle14$time <- seq.int(nrow(rectangle14))*4
rectangle14 = rectangle14[,-c(1)]
write_tsv(rectangle14,"D:/Mario/Escritorio/Fijaciones/rectangle14.tsv")

ggplot(rectangle14, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle14_fixations <- subset(detect.fixations(rectangle14))

diagnostic.plot(rectangle14, rectangle14_fixations)

diagnostic.plot(rectangle14, rectangle14_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle14 <- calculate.summary(rectangle14_fixations)
round(stats_rectangle14, digits=2)

#Hacer vehicle en 14

vehicle14 <- subset(rawdata_14, Time >= 2257314121 & Time <= 2315506176)

vehicle14$time <- seq.int(nrow(vehicle14))*4
vehicle14 = vehicle14[,-c(1)]
write_tsv(vehicle14,"D:/Mario/Escritorio/Fijaciones/vehicle14.tsv")

ggplot(vehicle14, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle14_fixations <- subset(detect.fixations(vehicle14))

diagnostic.plot(vehicle14, vehicle14_fixations)

diagnostic.plot(vehicle14, vehicle14_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle14 <- calculate.summary(vehicle14_fixations)
round(stats_vehicle14, digits=2)








