library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_83 <- read_tsv("83_rawdata.tsv", comment = "#")

rawdata_83 <- rename(rawdata_83, trial = Trial)
rawdata_83 <- rename(rawdata_83, x = 'L POR X [px]')
rawdata_83 <- rename(rawdata_83, y = 'L POR Y [px]')

rawdata_83 <- rawdata_83 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 83

vehicle83 <- subset(rawdata_83, Time >= 310397778 & Time <= 377527922)

vehicle83$time <- seq.int(nrow(vehicle83))*4
vehicle83 = vehicle83[,-c(1)]
write_tsv(vehicle83,"D:/Mario/Escritorio/Fijaciones/vehicle83.tsv")

ggplot(vehicle83, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle83_fixations <- subset(detect.fixations(vehicle83))

diagnostic.plot(vehicle83, vehicle83_fixations)

diagnostic.plot(vehicle83, vehicle83_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle83 <- calculate.summary(vehicle83_fixations)
round(stats_vehicle83, digits=2)

#Hacer rectangle en 83

rectangle83 <- subset(rawdata_83, Time >= 421284538 & Time <= 509828729)

rectangle83$time <- seq.int(nrow(rectangle83))*4
rectangle83 = rectangle83[,-c(1)]
write_tsv(rectangle83,"D:/Mario/Escritorio/Fijaciones/rectangle83.tsv")

ggplot(rectangle83, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle83_fixations <- subset(detect.fixations(rectangle83))

diagnostic.plot(rectangle83, rectangle83_fixations)

diagnostic.plot(rectangle83, rectangle83_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle83 <- calculate.summary(rectangle83_fixations)
round(stats_rectangle83, digits=2)


