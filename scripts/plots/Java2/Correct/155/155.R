library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_155 <- read_tsv("155_rawdata.tsv", comment = "#")

rawdata_155 <- rename(rawdata_155, trial = Trial)
rawdata_155 <- rename(rawdata_155, x = 'L POR X [px]')
rawdata_155 <- rename(rawdata_155, y = 'L POR Y [px]')

rawdata_155 <- rawdata_155 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 155

vehicle155 <- subset(rawdata_155, Time >= 4328209248 & Time <= 4383025429)

vehicle155$time <- seq.int(nrow(vehicle155))*4
vehicle155 = vehicle155[,-c(1)]
write_tsv(vehicle155,"D:/Mario/Escritorio/Fijaciones/vehicle155.tsv")

ggplot(vehicle155, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle155_fixations <- subset(detect.fixations(vehicle155))

diagnostic.plot(vehicle155, vehicle155_fixations)

diagnostic.plot(vehicle155, vehicle155_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle155 <- calculate.summary(vehicle155_fixations)
round(stats_vehicle155, digits=2)

#Hacer rectangle en 155

rectangle155 <- subset(rawdata_155, Time >= 4408707706 & Time <= 4453188652)

rectangle155$time <- seq.int(nrow(rectangle155))*4
rectangle155 = rectangle155[,-c(1)]
write_tsv(rectangle155,"D:/Mario/Escritorio/Fijaciones/rectangle155.tsv")

ggplot(rectangle155, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle155_fixations <- subset(detect.fixations(rectangle155))

diagnostic.plot(rectangle155, rectangle155_fixations)

diagnostic.plot(rectangle155, rectangle155_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle155 <- calculate.summary(rectangle155_fixations)
round(stats_rectangle155, digits=2)

