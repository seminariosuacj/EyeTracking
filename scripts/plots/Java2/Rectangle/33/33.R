library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_33 <- read_tsv("33_rawdata.tsv", comment = "#")

rawdata_33 <- rename(rawdata_33, trial = Trial)
rawdata_33 <- rename(rawdata_33, x = 'L POR X [px]')
rawdata_33 <- rename(rawdata_33, y = 'L POR Y [px]')

rawdata_33 <- rawdata_33 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 33

vehicle33 <- subset(rawdata_33, Time >= 13023270401 & Time <= 13081734681)

vehicle33$time <- seq.int(nrow(vehicle33))*4
vehicle33 = vehicle33[,-c(1)]
write_tsv(vehicle33,"D:/Mario/Escritorio/Fijaciones/vehicle33.tsv")

ggplot(vehicle33, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle33_fixations <- subset(detect.fixations(vehicle33))

diagnostic.plot(vehicle33, vehicle33_fixations)

diagnostic.plot(vehicle33, vehicle33_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle33 <- calculate.summary(vehicle33_fixations)
round(stats_vehicle33, digits=2)

#Hacer rectangle en 33

rectangle33 <- subset(rawdata_33, Time >= 13102136801 & Time <= 13142998070)

rectangle33$time <- seq.int(nrow(rectangle33))*4
rectangle33 = rectangle33[,-c(1)]
write_tsv(rectangle33,"D:/Mario/Escritorio/Fijaciones/rectangle33.tsv")

ggplot(rectangle33, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle33_fixations <- subset(detect.fixations(rectangle33))

diagnostic.plot(rectangle33, rectangle33_fixations)

diagnostic.plot(rectangle33, rectangle33_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle33 <- calculate.summary(rectangle33_fixations)
round(stats_rectangle33, digits=2)










