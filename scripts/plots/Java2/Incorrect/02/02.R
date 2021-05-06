library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_2 <- read_tsv("2_rawdata.tsv", comment = "#")

rawdata_2 <- rename(rawdata_2, trial = Trial)
rawdata_2 <- rename(rawdata_2, x = 'L POR X [px]')
rawdata_2 <- rename(rawdata_2, y = 'L POR Y [px]')

rawdata_2 <- rawdata_2 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 2

rectangle2 <- subset(rawdata_2, Time >= 15537688106 & Time <= 15582532864)

rectangle2$time <- seq.int(nrow(rectangle2))*4
rectangle2 = rectangle2[,-c(1)]
write_tsv(rectangle2,"D:/Mario/Escritorio/Fijaciones/rectangle2.tsv")

ggplot(rectangle2, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle2_fixations <- subset(detect.fixations(rectangle2))

diagnostic.plot(rectangle2, rectangle2_fixations)

diagnostic.plot(rectangle2, rectangle2_fixations, start.time=4, duration=1000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle2 <- calculate.summary(rectangle2_fixations)
round(stats_rectangle2, digits=2)

#Hacer vehicle en 2

vehicle2 <- subset(rawdata_2, Time >= 15617102638 & Time <= 15671067015)

vehicle2$time <- seq.int(nrow(vehicle2))*4
vehicle2 = vehicle2[,-c(1)]
write_tsv(vehicle2,"D:/Mario/Escritorio/Fijaciones/vehicle2.tsv")

ggplot(vehicle2, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle2_fixations <- subset(detect.fixations(vehicle2))

diagnostic.plot(vehicle2, vehicle2_fixations)

diagnostic.plot(vehicle2, vehicle2_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle2 <- calculate.summary(vehicle2_fixations)
round(stats_vehicle2, digits=2)
