library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_22 <- read_tsv("22_rawdata.tsv", comment = "#")

rawdata_22 <- rename(rawdata_22, trial = Trial)
rawdata_22 <- rename(rawdata_22, x = 'L POR X [px]')
rawdata_22 <- rename(rawdata_22, y = 'L POR Y [px]')

rawdata_22 <- rawdata_22 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 22

rectangle22 <- subset(rawdata_22, Time >= 1623018657 & Time <= 1719469620)

rectangle22$time <- seq.int(nrow(rectangle22))*4
rectangle22 = rectangle22[,-c(1)]
write_tsv(rectangle22,"D:/Mario/Escritorio/Fijaciones/rectangle22.tsv")

ggplot(rectangle22, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle22_fixations <- subset(detect.fixations(rectangle22))

diagnostic.plot(rectangle22, rectangle22_fixations)

diagnostic.plot(rectangle22, rectangle22_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle22 <- calculate.summary(rectangle22_fixations)
round(stats_rectangle22, digits=2)

#Hacer vehicle en 22

vehicle22 <- subset(rawdata_22, Time >= 1743839870 & Time <= 1800334760)

vehicle22$time <- seq.int(nrow(vehicle22))*4
vehicle22 = vehicle22[,-c(1)]
write_tsv(vehicle22,"D:/Mario/Escritorio/Fijaciones/vehicle22.tsv")

ggplot(vehicle22, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle22_fixations <- subset(detect.fixations(vehicle22))

diagnostic.plot(vehicle22, vehicle22_fixations)

diagnostic.plot(vehicle22, vehicle22_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle22 <- calculate.summary(vehicle22_fixations)
round(stats_vehicle22, digits=2)








