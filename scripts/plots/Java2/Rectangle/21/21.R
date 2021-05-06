library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_21 <- read_tsv("21_rawdata.tsv", comment = "#")

rawdata_21 <- rename(rawdata_21, trial = Trial)
rawdata_21 <- rename(rawdata_21, x = 'L POR X [px]')
rawdata_21 <- rename(rawdata_21, y = 'L POR Y [px]')

rawdata_21 <- rawdata_21 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 21

rectangle21 <- subset(rawdata_21, Time >= 13354559694 & Time <= 13414071571)

rectangle21$time <- seq.int(nrow(rectangle21))*4
rectangle21 = rectangle21[,-c(1)]
write_tsv(rectangle21,"D:/Mario/Escritorio/Fijaciones/rectangle21.tsv")

ggplot(rectangle21, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle21_fixations <- subset(detect.fixations(rectangle21))

diagnostic.plot(rectangle21, rectangle21_fixations)

diagnostic.plot(rectangle21, rectangle21_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle21 <- calculate.summary(rectangle21_fixations)
round(stats_rectangle21, digits=2)

#Hacer vehicle en 21

vehicle21 <- subset(rawdata_21, Time >= 13439421875 & Time <= 13541250838)

vehicle21$time <- seq.int(nrow(vehicle21))*4
vehicle21 = vehicle21[,-c(1)]
write_tsv(vehicle21,"D:/Mario/Escritorio/Fijaciones/vehicle21.tsv")

ggplot(vehicle21, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle21_fixations <- subset(detect.fixations(vehicle21))

diagnostic.plot(vehicle21, vehicle21_fixations)

diagnostic.plot(vehicle21, vehicle21_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle21 <- calculate.summary(vehicle21_fixations)
round(stats_vehicle21, digits=2)








