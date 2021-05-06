library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_68 <- read_tsv("68_rawdata.tsv", comment = "#")

rawdata_68 <- rename(rawdata_68, trial = Trial)
rawdata_68 <- rename(rawdata_68, x = 'L POR X [px]')
rawdata_68 <- rename(rawdata_68, y = 'L POR Y [px]')

rawdata_68 <- rawdata_68 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 68

rectangle68 <- subset(rawdata_68, Time >= 1080733799 & Time <= 1126006041)

rectangle68$time <- seq.int(nrow(rectangle68))*4
rectangle68 = rectangle68[,-c(1)]
write_tsv(rectangle68,"D:/Mario/Escritorio/Fijaciones/rectangle68.tsv")

ggplot(rectangle68, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle68_fixations <- subset(detect.fixations(rectangle68))

diagnostic.plot(rectangle68, rectangle68_fixations)

diagnostic.plot(rectangle68, rectangle68_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle68 <- calculate.summary(rectangle68_fixations)
round(stats_rectangle68, digits=2)

#Hacer vehicle en 68

vehicle68 <- subset(rawdata_68, Time >= 1161975029 & Time <= 1208867014)

vehicle68$time <- seq.int(nrow(vehicle68))*4
vehicle68 = vehicle68[,-c(1)]
write_tsv(vehicle68,"D:/Mario/Escritorio/Fijaciones/vehicle68.tsv")

ggplot(vehicle68, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle68_fixations <- subset(detect.fixations(vehicle68))

diagnostic.plot(vehicle68, vehicle68_fixations)

diagnostic.plot(vehicle68, vehicle68_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle68 <- calculate.summary(vehicle68_fixations)
round(stats_vehicle68, digits=2)
