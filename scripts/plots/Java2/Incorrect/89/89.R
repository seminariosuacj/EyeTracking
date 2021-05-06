library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_89 <- read_tsv("89_rawdata.tsv", comment = "#")

rawdata_89 <- rename(rawdata_89, trial = Trial)
rawdata_89 <- rename(rawdata_89, x = 'L POR X [px]')
rawdata_89 <- rename(rawdata_89, y = 'L POR Y [px]')

rawdata_89 <- rawdata_89 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 89

vehicle89 <- subset(rawdata_89, Time >= 1009356355 & Time <= 1110625585)

vehicle89$time <- seq.int(nrow(vehicle89))*4
vehicle89 = vehicle89[,-c(1)]
write_tsv(vehicle89,"D:/Mario/Escritorio/Fijaciones/vehicle89.tsv")

ggplot(vehicle89, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle89_fixations <- subset(detect.fixations(vehicle89))

diagnostic.plot(vehicle89, vehicle89_fixations)

diagnostic.plot(vehicle89, vehicle89_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle89 <- calculate.summary(vehicle89_fixations)
round(stats_vehicle89, digits=2)


#Hacer rectangle en 89

rectangle89 <- subset(rawdata_89, Time >= 1148884690 & Time <= 1214728260)

rectangle89$time <- seq.int(nrow(rectangle89))*4
rectangle89 = rectangle89[,-c(1)]
write_tsv(rectangle89,"D:/Mario/Escritorio/Fijaciones/rectangle89.tsv")

ggplot(rectangle89, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle89_fixations <- subset(detect.fixations(rectangle89))

diagnostic.plot(rectangle89, rectangle89_fixations)

diagnostic.plot(rectangle89, rectangle89_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle89 <- calculate.summary(rectangle89_fixations)
round(stats_rectangle89, digits=2)

