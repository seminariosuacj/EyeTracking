library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_82 <- read_tsv("82_rawdata.tsv", comment = "#")

rawdata_82 <- rename(rawdata_82, trial = Trial)
rawdata_82 <- rename(rawdata_82, x = 'L POR X [px]')
rawdata_82 <- rename(rawdata_82, y = 'L POR Y [px]')

rawdata_82 <- rawdata_82 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 82

vehicle82 <- subset(rawdata_82, Time >= 1005958331 & Time <= 1071621729)

vehicle82$time <- seq.int(nrow(vehicle82))*4
vehicle82 = vehicle82[,-c(1)]
write_tsv(vehicle82,"D:/Mario/Escritorio/Fijaciones/vehicle82.tsv")

ggplot(vehicle82, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle82_fixations <- subset(detect.fixations(vehicle82))

diagnostic.plot(vehicle82, vehicle82_fixations)

diagnostic.plot(vehicle82, vehicle82_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle82 <- calculate.summary(vehicle82_fixations)
round(stats_vehicle82, digits=2)

#Hacer rectangle en 82

rectangle82 <- subset(rawdata_82, Time >= 1092516239 & Time <= 1135737235)

rectangle82$time <- seq.int(nrow(rectangle82))*4
rectangle82 = rectangle82[,-c(1)]
write_tsv(rectangle82,"D:/Mario/Escritorio/Fijaciones/rectangle82.tsv")

ggplot(rectangle82, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle82_fixations <- subset(detect.fixations(rectangle82))

diagnostic.plot(rectangle82, rectangle82_fixations)

diagnostic.plot(rectangle82, rectangle82_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle82 <- calculate.summary(rectangle82_fixations)
round(stats_rectangle82, digits=2)























