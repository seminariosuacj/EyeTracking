library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_178 <- read_tsv("178_rawdata.tsv", comment = "#")

rawdata_178 <- rename(rawdata_178, trial = Trial)
rawdata_178 <- rename(rawdata_178, x = 'L POR X [px]')
rawdata_178 <- rename(rawdata_178, y = 'L POR Y [px]')

rawdata_178 <- rawdata_178 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 178

rectangle178 <- subset(rawdata_178, Time >= 10022938163 & Time <= 10072994846)

rectangle178$time <- seq.int(nrow(rectangle178))*4
rectangle178 = rectangle178[,-c(1)]
write_tsv(rectangle178,"D:/Mario/Escritorio/Fijaciones/rectangle178.tsv")

ggplot(rectangle178, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle178_fixations <- subset(detect.fixations(rectangle178))

diagnostic.plot(rectangle178, rectangle178_fixations)

diagnostic.plot(rectangle178, rectangle178_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle178 <- calculate.summary(rectangle178_fixations)
round(stats_rectangle178, digits=2)

#Hacer vehicle en 178

vehicle178 <- subset(rawdata_178, Time >= 10092073482 & Time <= 10132078746)

vehicle178$time <- seq.int(nrow(vehicle178))*4
vehicle178 = vehicle178[,-c(1)]
write_tsv(vehicle178,"D:/Mario/Escritorio/Fijaciones/vehicle178.tsv")

ggplot(vehicle178, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle178_fixations <- subset(detect.fixations(vehicle178))

diagnostic.plot(vehicle178, vehicle178_fixations)

diagnostic.plot(vehicle178, vehicle178_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle178 <- calculate.summary(vehicle178_fixations)
round(stats_vehicle178, digits=2)






























