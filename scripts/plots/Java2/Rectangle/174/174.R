library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_174 <- read_tsv("174_rawdata.tsv", comment = "#")

rawdata_174 <- rename(rawdata_174, trial = Trial)
rawdata_174 <- rename(rawdata_174, x = 'L POR X [px]')
rawdata_174 <- rename(rawdata_174, y = 'L POR Y [px]')

rawdata_174 <- rawdata_174 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 174

rectangle174 <- subset(rawdata_174, Time >= 811497495 & Time <= 967225797)

rectangle174$time <- seq.int(nrow(rectangle174))*4
rectangle174 = rectangle174[,-c(1)]
write_tsv(rectangle174,"D:/Mario/Escritorio/Fijaciones/rectangle174.tsv")

ggplot(rectangle174, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle174_fixations <- subset(detect.fixations(rectangle174))

diagnostic.plot(rectangle174, rectangle174_fixations)

diagnostic.plot(rectangle174, rectangle174_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle174 <- calculate.summary(rectangle174_fixations)
round(stats_rectangle174, digits=2)

#Hacer vehicle en 174

vehicle174 <- subset(rawdata_174, Time >= 995811721 & Time <= 1145610119)

vehicle174$time <- seq.int(nrow(vehicle174))*4
vehicle174 = vehicle174[,-c(1)]
write_tsv(vehicle174,"D:/Mario/Escritorio/Fijaciones/vehicle174.tsv")

ggplot(vehicle174, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle174_fixations <- subset(detect.fixations(vehicle174))

diagnostic.plot(vehicle174, vehicle174_fixations)

diagnostic.plot(vehicle174, vehicle174_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle174 <- calculate.summary(vehicle174_fixations)
round(stats_vehicle174, digits=2)






























