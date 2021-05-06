library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_36 <- read_tsv("36_rawdata.tsv", comment = "#")

rawdata_36 <- rename(rawdata_36, trial = Trial)
rawdata_36 <- rename(rawdata_36, x = 'L POR X [px]')
rawdata_36 <- rename(rawdata_36, y = 'L POR Y [px]')

rawdata_36 <- rawdata_36 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 36

rectangle36 <- subset(rawdata_36, Time >= 6681894908 & Time <= 6708080627)

rectangle36$time <- seq.int(nrow(rectangle36))*4
rectangle36 = rectangle36[,-c(1)]

write_tsv(rectangle36,"D:/Mario/Escritorio/Fijaciones/rectangle36.tsv")

ggplot(rectangle36, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle36_fixations <- subset(detect.fixations(rectangle36))

diagnostic.plot(rectangle36, rectangle36_fixations)

diagnostic.plot(rectangle36, rectangle36_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle36 <- calculate.summary(rectangle36_fixations)
round(stats_rectangle36, digits=2)

#Hacer vehicle en 36

vehicle36 <- subset(rawdata_36, Time >= 6722687440 & Time <= 6763059989)

vehicle36$time <- seq.int(nrow(vehicle36))*4
vehicle36 = vehicle36[,-c(1)]

write_tsv(vehicle36,"D:/Mario/Escritorio/Fijaciones/vehicle36.tsv")

ggplot(vehicle36, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle36_fixations <- subset(detect.fixations(vehicle36))

diagnostic.plot(vehicle36, vehicle36_fixations)

diagnostic.plot(vehicle36, vehicle36_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle36 <- calculate.summary(vehicle36_fixations)
round(stats_vehicle36, digits=2)
