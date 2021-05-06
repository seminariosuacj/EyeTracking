library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_212 <- read_tsv("212_rawdata.tsv", comment = "#")

rawdata_212 <- rename(rawdata_212, trial = Trial)
rawdata_212 <- rename(rawdata_212, x = 'L POR X [px]')
rawdata_212 <- rename(rawdata_212, y = 'L POR Y [px]')

rawdata_212 <- rawdata_212 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 212

rectangle212 <- subset(rawdata_212, Time >= 418559098 & Time <= 478732105)

rectangle212$time <- seq.int(nrow(rectangle212))*4
rectangle212 = rectangle212[,-c(1)]
write_tsv(rectangle212,"D:/Mario/Escritorio/Fijaciones/rectangle212.tsv")

ggplot(rectangle212, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle212_fixations <- subset(detect.fixations(rectangle212))

diagnostic.plot(rectangle212, rectangle212_fixations)

diagnostic.plot(rectangle212, rectangle212_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle212 <- calculate.summary(rectangle212_fixations)
round(stats_rectangle212, digits=2)

#Hacer vehicle en 212

vehicle212 <- subset(rawdata_212, Time >= 524077901 & Time <= 590202490)

vehicle212$time <- seq.int(nrow(vehicle212))*4
vehicle212 = vehicle212[,-c(1)]
write_tsv(vehicle212,"D:/Mario/Escritorio/Fijaciones/vehicle212.tsv")

ggplot(vehicle212, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle212_fixations <- subset(detect.fixations(vehicle212))

diagnostic.plot(vehicle212, vehicle212_fixations)

diagnostic.plot(vehicle212, vehicle212_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle212 <- calculate.summary(vehicle212_fixations)
round(stats_vehicle212, digits=2)













