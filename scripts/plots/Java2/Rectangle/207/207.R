library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_207 <- read_tsv("207_rawdata.tsv", comment = "#")

rawdata_207 <- rename(rawdata_207, trial = Trial)
rawdata_207 <- rename(rawdata_207, x = 'L POR X [px]')
rawdata_207 <- rename(rawdata_207, y = 'L POR Y [px]')

rawdata_207 <- rawdata_207 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 207

vehicle207 <- subset(rawdata_207, Time >= 18078818905 & Time <= 18158352033)

vehicle207$time <- seq.int(nrow(vehicle207))*4
vehicle207 = vehicle207[,-c(1)]
write_tsv(vehicle207,"D:/Mario/Escritorio/Fijaciones/vehicle207.tsv")

ggplot(vehicle207, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle207_fixations <- subset(detect.fixations(vehicle207))

diagnostic.plot(vehicle207, vehicle207_fixations)

diagnostic.plot(vehicle207, vehicle207_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle207 <- calculate.summary(vehicle207_fixations)
round(stats_vehicle207, digits=2)

#Hacer rectangle en 207

rectangle207 <- subset(rawdata_207, Time >= 18206672328 & Time <= 18273198733)

rectangle207$time <- seq.int(nrow(rectangle207))*4
rectangle207 = rectangle207[,-c(1)]
write_tsv(rectangle207,"D:/Mario/Escritorio/Fijaciones/rectangle207.tsv")

ggplot(rectangle207, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle207_fixations <- subset(detect.fixations(rectangle207))

diagnostic.plot(rectangle207, rectangle207_fixations)

diagnostic.plot(rectangle207, rectangle207_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle207 <- calculate.summary(rectangle207_fixations)
round(stats_rectangle207, digits=2)








