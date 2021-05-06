library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_25 <- read_tsv("25_rawdata.tsv", comment = "#")

rawdata_25 <- rename(rawdata_25, trial = Trial)
rawdata_25 <- rename(rawdata_25, x = 'L POR X [px]')
rawdata_25 <- rename(rawdata_25, y = 'L POR Y [px]')

rawdata_25 <- rawdata_25 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 25

rectangle25 <- subset(rawdata_25, Time >= 8318533408 & Time <= 8397626414)

rectangle25$time <- seq.int(nrow(rectangle25))*4
rectangle25 = rectangle25[,-c(1)]
write_tsv(rectangle25,"D:/Mario/Escritorio/Fijaciones/rectangle25.tsv")

ggplot(rectangle25, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle25_fixations <- subset(detect.fixations(rectangle25))

diagnostic.plot(rectangle25, rectangle25_fixations)

diagnostic.plot(rectangle25, rectangle25_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle25 <- calculate.summary(rectangle25_fixations)
round(stats_rectangle25, digits=2)

#Hacer vehicle en 25

vehicle25 <- subset(rawdata_25, Time >= 8423032618 & Time <= 8506247161)

vehicle25$time <- seq.int(nrow(vehicle25))*4
vehicle25 = vehicle25[,-c(1)]
write_tsv(vehicle25,"D:/Mario/Escritorio/Fijaciones/vehicle25.tsv")

ggplot(vehicle25, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle25_fixations <- subset(detect.fixations(vehicle25))

diagnostic.plot(vehicle25, vehicle25_fixations)

diagnostic.plot(vehicle25, vehicle25_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle25 <- calculate.summary(vehicle25_fixations)
round(stats_vehicle25, digits=2)








