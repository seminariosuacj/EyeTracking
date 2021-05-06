library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_13 <- read_tsv("13_rawdata.tsv", comment = "#")

rawdata_13 <- rename(rawdata_13, trial = Trial)
rawdata_13 <- rename(rawdata_13, x = 'L POR X [px]')
rawdata_13 <- rename(rawdata_13, y = 'L POR Y [px]')

rawdata_13 <- rawdata_13 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 13

rectangle13 <- subset(rawdata_13, Time >= 359485532 & Time <= 421008271)

rectangle13$time <- seq.int(nrow(rectangle13))*4
rectangle13 = rectangle13[,-c(1)]
write_tsv(rectangle13,"D:/Mario/Escritorio/Fijaciones/rectangle13.tsv")

ggplot(rectangle13, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle13_fixations <- subset(detect.fixations(rectangle13))

diagnostic.plot(rectangle13, rectangle13_fixations)

diagnostic.plot(rectangle13, rectangle13_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle13 <- calculate.summary(rectangle13_fixations)
round(stats_rectangle13, digits=2)

#Hacer vehicle en 13

vehicle13 <- subset(rawdata_13, Time >= 438594825 & Time <= 573527391)

vehicle13$time <- seq.int(nrow(vehicle13))*4
vehicle13 = vehicle13[,-c(1)]
write_tsv(vehicle13,"D:/Mario/Escritorio/Fijaciones/vehicle13.tsv")

ggplot(vehicle13, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle13_fixations <- subset(detect.fixations(vehicle13))

diagnostic.plot(vehicle13, vehicle13_fixations)

diagnostic.plot(vehicle13, vehicle13_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle13 <- calculate.summary(vehicle13_fixations)
round(stats_vehicle13, digits=2)








