library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_58 <- read_tsv("58_rawdata.tsv", comment = "#")

rawdata_58 <- rename(rawdata_58, trial = Trial)
rawdata_58 <- rename(rawdata_58, x = 'L POR X [px]')
rawdata_58 <- rename(rawdata_58, y = 'L POR Y [px]')

rawdata_58 <- rawdata_58 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 58

vehicle58 <- subset(rawdata_58, Time >= 1050774754 & Time <= 1093711021)

vehicle58$time <- seq.int(nrow(vehicle58))*4
vehicle58 = vehicle58[,-c(1)]
write_tsv(vehicle58,"D:/Mario/Escritorio/Fijaciones/vehicle58.tsv")

ggplot(vehicle58, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle58_fixations <- subset(detect.fixations(vehicle58))

diagnostic.plot(vehicle58, vehicle58_fixations)

diagnostic.plot(vehicle58, vehicle58_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle58 <- calculate.summary(vehicle58_fixations)
round(stats_vehicle58, digits=2)

#Hacer rectangle en 58

rectangle58 <- subset(rawdata_58, Time >= 1110317683 & Time <= 1197686248)

rectangle58$time <- seq.int(nrow(rectangle58))*4
rectangle58 = rectangle58[,-c(1)]
write_tsv(rectangle58,"D:/Mario/Escritorio/Fijaciones/rectangle58.tsv")

ggplot(rectangle58, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle58_fixations <- subset(detect.fixations(rectangle58))

diagnostic.plot(rectangle58, rectangle58_fixations)

diagnostic.plot(rectangle58, rectangle58_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle58 <- calculate.summary(rectangle58_fixations)
round(stats_rectangle58, digits=2)



















