library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_97 <- read_tsv("97_rawdata.tsv", comment = "#")

rawdata_97 <- rename(rawdata_97, trial = Trial)
rawdata_97 <- rename(rawdata_97, x = 'L POR X [px]')
rawdata_97 <- rename(rawdata_97, y = 'L POR Y [px]')

rawdata_97 <- rawdata_97 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 97

vehicle97 <- subset(rawdata_97, Time >= 15198240212 & Time <= 15256548203)

vehicle97$time <- seq.int(nrow(vehicle97))*4
vehicle97 = vehicle97[,-c(1)]
write_tsv(vehicle97,"D:/Mario/Escritorio/Fijaciones/vehicle97.tsv")

ggplot(vehicle97, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle97_fixations <- subset(detect.fixations(vehicle97))

diagnostic.plot(vehicle97, vehicle97_fixations)

diagnostic.plot(vehicle97, vehicle97_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle97 <- calculate.summary(vehicle97_fixations)
round(stats_vehicle97, digits=2)

#Hacer rectangle en 97

rectangle97 <- subset(rawdata_97, Time >= 15300157294 & Time <= 15353433641)

rectangle97$time <- seq.int(nrow(rectangle97))*4
rectangle97 = rectangle97[,-c(1)]
write_tsv(rectangle97,"D:/Mario/Escritorio/Fijaciones/rectangle97.tsv")

ggplot(rectangle97, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle97_fixations <- subset(detect.fixations(rectangle97))

diagnostic.plot(rectangle97, rectangle97_fixations)

diagnostic.plot(rectangle97, rectangle97_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle97 <- calculate.summary(rectangle97_fixations)
round(stats_rectangle97, digits=2)
















