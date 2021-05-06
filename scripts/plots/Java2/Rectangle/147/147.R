library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_147 <- read_tsv("147_rawdata.tsv", comment = "#")

rawdata_147 <- rename(rawdata_147, trial = Trial)
rawdata_147 <- rename(rawdata_147, x = 'L POR X [px]')
rawdata_147 <- rename(rawdata_147, y = 'L POR Y [px]')

rawdata_147 <- rawdata_147 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 147

rectangle147 <- subset(rawdata_147, Time >= 19284112761 & Time <= 19352395976)

rectangle147$time <- seq.int(nrow(rectangle147))*4
rectangle147 = rectangle147[,-c(1)]
write_tsv(rectangle147,"D:/Mario/Escritorio/Fijaciones/rectangle147.tsv")

ggplot(rectangle147, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle147_fixations <- subset(detect.fixations(rectangle147))

diagnostic.plot(rectangle147, rectangle147_fixations)

diagnostic.plot(rectangle147, rectangle147_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle147 <- calculate.summary(rectangle147_fixations)
round(stats_rectangle147, digits=2)



#Hacer vehicle en 147

vehicle147 <- subset(rawdata_147, Time >= 19385933803 & Time <= 19446453699)

vehicle147$time <- seq.int(nrow(vehicle147))*4
vehicle147 = vehicle147[,-c(1)]
write_tsv(vehicle147,"D:/Mario/Escritorio/Fijaciones/vehicle147.tsv")

ggplot(vehicle147, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle147_fixations <- subset(detect.fixations(vehicle147))

diagnostic.plot(vehicle147, vehicle147_fixations)

diagnostic.plot(vehicle147, vehicle147_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle147 <- calculate.summary(vehicle147_fixations)
round(stats_vehicle147, digits=2)







































