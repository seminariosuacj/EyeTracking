library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_164 <- read_tsv("164_rawdata.tsv", comment = "#")

rawdata_164 <- rename(rawdata_164, trial = Trial)
rawdata_164 <- rename(rawdata_164, x = 'L POR X [px]')
rawdata_164 <- rename(rawdata_164, y = 'L POR Y [px]')

rawdata_164 <- rawdata_164 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 164

vehicle164 <- subset(rawdata_164, Time >= 3106799261 & Time <= 3184269727)

vehicle164$time <- seq.int(nrow(vehicle164))*4
vehicle164 = vehicle164[,-c(1)]
write_tsv(vehicle164,"D:/Mario/Escritorio/Fijaciones/vehicle164.tsv")

ggplot(vehicle164, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle164_fixations <- subset(detect.fixations(vehicle164))

diagnostic.plot(vehicle164, vehicle164_fixations)

diagnostic.plot(vehicle164, vehicle164_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle164 <- calculate.summary(vehicle164_fixations)
round(stats_vehicle164, digits=2)

#Hacer rectangle en 164

rectangle164 <- subset(rawdata_164, Time >= 3205824365 & Time <= 3282197565)

rectangle164$time <- seq.int(nrow(rectangle164))*4
rectangle164 = rectangle164[,-c(1)]
write_tsv(rectangle164,"D:/Mario/Escritorio/Fijaciones/rectangle164.tsv")

ggplot(rectangle164, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle164_fixations <- subset(detect.fixations(rectangle164))

diagnostic.plot(rectangle164, rectangle164_fixations)

diagnostic.plot(rectangle164, rectangle164_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle164 <- calculate.summary(rectangle164_fixations)
round(stats_rectangle164, digits=2)























