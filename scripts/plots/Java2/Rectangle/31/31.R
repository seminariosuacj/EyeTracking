library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_31 <- read_tsv("31_rawdata.tsv", comment = "#")

rawdata_31 <- rename(rawdata_31, trial = Trial)
rawdata_31 <- rename(rawdata_31, x = 'L POR X [px]')
rawdata_31 <- rename(rawdata_31, y = 'L POR Y [px]')

rawdata_31 <- rawdata_31 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 31

rectangle31 <- subset(rawdata_31, Time >= 4477298209 & Time <= 4528814647)

rectangle31$time <- seq.int(nrow(rectangle31))*4
rectangle31 = rectangle31[,-c(1)]
write_tsv(rectangle31,"D:/Mario/Escritorio/Fijaciones/rectangle31.tsv")

ggplot(rectangle31, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle31_fixations <- subset(detect.fixations(rectangle31))

diagnostic.plot(rectangle31, rectangle31_fixations)

diagnostic.plot(rectangle31, rectangle31_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle31 <- calculate.summary(rectangle31_fixations)
round(stats_rectangle31, digits=2)

#Hacer vehicle en 31

vehicle31 <- subset(rawdata_31, Time >= 4574919465 & Time <= 4626806800)

vehicle31$time <- seq.int(nrow(vehicle31))*4
vehicle31 = vehicle31[,-c(1)]
write_tsv(vehicle31,"D:/Mario/Escritorio/Fijaciones/vehicle31.tsv")

ggplot(vehicle31, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle31_fixations <- subset(detect.fixations(vehicle31))

diagnostic.plot(vehicle31, vehicle31_fixations)

diagnostic.plot(vehicle31, vehicle31_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle31 <- calculate.summary(vehicle31_fixations)
round(stats_vehicle31, digits=2)








