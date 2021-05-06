library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_152 <- read_tsv("152_rawdata.tsv", comment = "#")

rawdata_152 <- rename(rawdata_152, trial = Trial)
rawdata_152 <- rename(rawdata_152, x = 'L POR X [px]')
rawdata_152 <- rename(rawdata_152, y = 'L POR Y [px]')

rawdata_152 <- rawdata_152 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 152

vehicle152 <- subset(rawdata_152, Time >= 411147615 & Time <= 465425547)

vehicle152$time <- seq.int(nrow(vehicle152))*4
vehicle152 = vehicle152[,-c(1)]
write_tsv(vehicle152,"D:/Mario/Escritorio/Fijaciones/vehicle152.tsv")

ggplot(vehicle152, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle152_fixations <- subset(detect.fixations(vehicle152))

diagnostic.plot(vehicle152, vehicle152_fixations)

diagnostic.plot(vehicle152, vehicle152_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle152 <- calculate.summary(vehicle152_fixations)
round(stats_vehicle152, digits=2)

#Hacer rectangle en 152

rectangle152 <- subset(rawdata_152, Time >= 485380143 & Time <= 515244278)

rectangle152$time <- seq.int(nrow(rectangle152))*4
rectangle152 = rectangle152[,-c(1)]
write_tsv(rectangle152,"D:/Mario/Escritorio/Fijaciones/rectangle152.tsv")

ggplot(rectangle152, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle152_fixations <- subset(detect.fixations(rectangle152))

diagnostic.plot(rectangle152, rectangle152_fixations)

diagnostic.plot(rectangle152, rectangle152_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle152 <- calculate.summary(rectangle152_fixations)
round(stats_rectangle152, digits=2)



















