library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_171 <- read_tsv("171_rawdata.tsv", comment = "#")

rawdata_171 <- rename(rawdata_171, trial = Trial)
rawdata_171 <- rename(rawdata_171, x = 'L POR X [px]')
rawdata_171 <- rename(rawdata_171, y = 'L POR Y [px]')

rawdata_171 <- rawdata_171 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 171

vehicle171 <- subset(rawdata_171, Time >= 133289237 & Time <= 209827869)

vehicle171$time <- seq.int(nrow(vehicle171))*4
vehicle171 = vehicle171[,-c(1)]
write_tsv(vehicle171,"D:/Mario/Escritorio/Fijaciones/vehicle171.tsv")

ggplot(vehicle171, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle171_fixations <- subset(detect.fixations(vehicle171))

diagnostic.plot(vehicle171, vehicle171_fixations)

diagnostic.plot(vehicle171, vehicle171_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle171 <- calculate.summary(vehicle171_fixations)
round(stats_vehicle171, digits=2)

#Hacer rectangle en 171

rectangle171 <- subset(rawdata_171, Time >= 243037652 & Time <= 280003088)

rectangle171$time <- seq.int(nrow(rectangle171))*4
rectangle171 = rectangle171[,-c(1)]
write_tsv(rectangle171,"D:/Mario/Escritorio/Fijaciones/rectangle171.tsv")

ggplot(rectangle171, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle171_fixations <- subset(detect.fixations(rectangle171))

diagnostic.plot(rectangle171, rectangle171_fixations)

diagnostic.plot(rectangle171, rectangle171_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle171 <- calculate.summary(rectangle171_fixations)
round(stats_rectangle171, digits=2)




























