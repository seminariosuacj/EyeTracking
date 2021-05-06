library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_73 <- read_tsv("73_rawdata.tsv", comment = "#")

rawdata_73 <- rename(rawdata_73, trial = Trial)
rawdata_73 <- rename(rawdata_73, x = 'L POR X [px]')
rawdata_73 <- rename(rawdata_73, y = 'L POR Y [px]')

rawdata_73 <- rawdata_73 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 73

vehicle73 <- subset(rawdata_73, Time >= 255071366 & Time <= 357379926)

vehicle73$time <- seq.int(nrow(vehicle73))*4
vehicle73 = vehicle73[,-c(1)]
write_tsv(vehicle73,"D:/Mario/Escritorio/Fijaciones/vehicle73.tsv")

ggplot(vehicle73, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle73_fixations <- subset(detect.fixations(vehicle73))

diagnostic.plot(vehicle73, vehicle73_fixations)

diagnostic.plot(vehicle73, vehicle73_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle73 <- calculate.summary(vehicle73_fixations)
round(stats_vehicle73, digits=2)

#Hacer rectangle en 73

rectangle73 <- subset(rawdata_73, Time >= 381358417 & Time <= 457129070)

rectangle73$time <- seq.int(nrow(rectangle73))*4
rectangle73 = rectangle73[,-c(1)]
write_tsv(rectangle73,"D:/Mario/Escritorio/Fijaciones/rectangle73.tsv")

ggplot(rectangle73, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle73_fixations <- subset(detect.fixations(rectangle73))

diagnostic.plot(rectangle73, rectangle73_fixations)

diagnostic.plot(rectangle73, rectangle73_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle73 <- calculate.summary(rectangle73_fixations)
round(stats_rectangle73, digits=2)























