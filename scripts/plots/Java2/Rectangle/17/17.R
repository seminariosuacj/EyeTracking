library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_17 <- read_tsv("17_rawdata.tsv", comment = "#")

rawdata_17 <- rename(rawdata_17, trial = Trial)
rawdata_17 <- rename(rawdata_17, x = 'L POR X [px]')
rawdata_17 <- rename(rawdata_17, y = 'L POR Y [px]')

rawdata_17 <- rawdata_17 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 17

rectangle17 <- subset(rawdata_17, Time >= 330565819 & Time <= 388988697)

rectangle17$time <- seq.int(nrow(rectangle17))*4
rectangle17 = rectangle17[,-c(1)]
write_tsv(rectangle17,"D:/Mario/Escritorio/Fijaciones/rectangle17.tsv")

ggplot(rectangle17, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle17_fixations <- subset(detect.fixations(rectangle17))

diagnostic.plot(rectangle17, rectangle17_fixations)

diagnostic.plot(rectangle17, rectangle17_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle17 <- calculate.summary(rectangle17_fixations)
round(stats_rectangle17, digits=2)

#Hacer vehicle en 17

vehicle17 <- subset(rawdata_17, Time >= 423340436 & Time <= 519197841)

vehicle17$time <- seq.int(nrow(vehicle17))*4
vehicle17 = vehicle17[,-c(1)]
write_tsv(vehicle17,"D:/Mario/Escritorio/Fijaciones/vehicle17.tsv")

ggplot(vehicle17, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle17_fixations <- subset(detect.fixations(vehicle17))

diagnostic.plot(vehicle17, vehicle17_fixations)

diagnostic.plot(vehicle17, vehicle17_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle17 <- calculate.summary(vehicle17_fixations)
round(stats_vehicle17, digits=2)








