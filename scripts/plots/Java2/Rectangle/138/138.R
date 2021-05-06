library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_138 <- read_tsv("138_rawdata.tsv", comment = "#")

rawdata_138 <- rename(rawdata_138, trial = Trial)
rawdata_138 <- rename(rawdata_138, x = 'L POR X [px]')
rawdata_138 <- rename(rawdata_138, y = 'L POR Y [px]')

rawdata_138 <- rawdata_138 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 138

rectangle138 <- subset(rawdata_138, Time >= 2107340167 & Time <= 2141077686)

rectangle138$time <- seq.int(nrow(rectangle138))*4
rectangle138 = rectangle138[,-c(1)]
write_tsv(rectangle138,"D:/Mario/Escritorio/Fijaciones/rectangle138.tsv")

ggplot(rectangle138, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle138_fixations <- subset(detect.fixations(rectangle138))

diagnostic.plot(rectangle138, rectangle138_fixations)

diagnostic.plot(rectangle138, rectangle138_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle138 <- calculate.summary(rectangle138_fixations)
round(stats_rectangle138, digits=2)


#Hacer vehicle en 138

vehicle138 <- subset(rawdata_138, Time >= 2179938556 & Time <= 2218324119)

vehicle138$time <- seq.int(nrow(vehicle138))*4
vehicle138 = vehicle138[,-c(1)]
write_tsv(vehicle138,"D:/Mario/Escritorio/Fijaciones/vehicle138.tsv")

ggplot(vehicle138, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle138_fixations <- subset(detect.fixations(vehicle138))

diagnostic.plot(vehicle138, vehicle138_fixations)

diagnostic.plot(vehicle138, vehicle138_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle138 <- calculate.summary(vehicle138_fixations)
round(stats_vehicle138, digits=2)


































