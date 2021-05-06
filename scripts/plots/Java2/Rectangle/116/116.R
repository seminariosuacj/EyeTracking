library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_116 <- read_tsv("116_rawdata.tsv", comment = "#")

rawdata_116 <- rename(rawdata_116, trial = Trial)
rawdata_116 <- rename(rawdata_116, x = 'L POR X [px]')
rawdata_116 <- rename(rawdata_116, y = 'L POR Y [px]')

rawdata_116 <- rawdata_116 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 116

vehicle116 <- subset(rawdata_116, Time >= 2608350579 & Time <= 2653735212)

vehicle116$time <- seq.int(nrow(vehicle116))*4
vehicle116 = vehicle116[,-c(1)]
write_tsv(vehicle116,"D:/Mario/Escritorio/Fijaciones/vehicle116.tsv")

ggplot(vehicle116, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle116_fixations <- subset(detect.fixations(vehicle116))

diagnostic.plot(vehicle116, vehicle116_fixations)

diagnostic.plot(vehicle116, vehicle116_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle116 <- calculate.summary(vehicle116_fixations)
round(stats_vehicle116, digits=2)


#Hacer rectangle en 116

rectangle116 <- subset(rawdata_116, Time >= 2674957043 & Time <= 2704521519)

rectangle116$time <- seq.int(nrow(rectangle116))*4
rectangle116 = rectangle116[,-c(1)]
write_tsv(rectangle116,"D:/Mario/Escritorio/Fijaciones/rectangle116.tsv")

ggplot(rectangle116, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle116_fixations <- subset(detect.fixations(rectangle116))

diagnostic.plot(rectangle116, rectangle116_fixations)

diagnostic.plot(rectangle116, rectangle116_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle116 <- calculate.summary(rectangle116_fixations)
round(stats_rectangle116, digits=2)

























