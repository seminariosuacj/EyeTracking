library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_28 <- read_tsv("28_rawdata.tsv", comment = "#")

rawdata_28 <- rename(rawdata_28, trial = Trial)
rawdata_28 <- rename(rawdata_28, x = 'L POR X [px]')
rawdata_28 <- rename(rawdata_28, y = 'L POR Y [px]')

rawdata_28 <- rawdata_28 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 28

rectangle28 <- subset(rawdata_28, Time >= 30300103804 & Time <= 30362941274)

rectangle28$time <- seq.int(nrow(rectangle28))*4
rectangle28 = rectangle28[,-c(1)]
write_tsv(rectangle28,"D:/Mario/Escritorio/Fijaciones/rectangle28.tsv")

ggplot(rectangle28, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle28_fixations <- subset(detect.fixations(rectangle28))

diagnostic.plot(rectangle28, rectangle28_fixations)

diagnostic.plot(rectangle28, rectangle28_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle28 <- calculate.summary(rectangle28_fixations)
round(stats_rectangle28, digits=2)

#Hacer vehicle en 28

vehicle28 <- subset(rawdata_28, Time >= 30434230418 & Time <= 30466412170)

vehicle28$time <- seq.int(nrow(vehicle28))*4
vehicle28 = vehicle28[,-c(1)]
write_tsv(vehicle28,"D:/Mario/Escritorio/Fijaciones/vehicle28.tsv")

ggplot(vehicle28, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle28_fixations <- subset(detect.fixations(vehicle28))

diagnostic.plot(vehicle28, vehicle28_fixations)

diagnostic.plot(vehicle28, vehicle28_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle28 <- calculate.summary(vehicle28_fixations)
round(stats_vehicle28, digits=2)








