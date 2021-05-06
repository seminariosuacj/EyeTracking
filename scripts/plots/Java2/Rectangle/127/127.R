library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_127 <- read_tsv("127_rawdata.tsv", comment = "#")

rawdata_127 <- rename(rawdata_127, trial = Trial)
rawdata_127 <- rename(rawdata_127, x = 'L POR X [px]')
rawdata_127 <- rename(rawdata_127, y = 'L POR Y [px]')

rawdata_127 <- rawdata_127 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 127

rectangle127 <- subset(rawdata_127, Time >= 10291033017 & Time <= 10333294117)

rectangle127$time <- seq.int(nrow(rectangle127))*4
rectangle127 = rectangle127[,-c(1)]
write_tsv(rectangle127,"D:/Mario/Escritorio/Fijaciones/rectangle127.tsv")

ggplot(rectangle127, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle127_fixations <- subset(detect.fixations(rectangle127))

diagnostic.plot(rectangle127, rectangle127_fixations)

diagnostic.plot(rectangle127, rectangle127_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle127 <- calculate.summary(rectangle127_fixations)
round(stats_rectangle127, digits=2)


#Hacer vehicle en 127

vehicle127 <- subset(rawdata_127, Time >= 10356808207 & Time <= 10398325658)

vehicle127$time <- seq.int(nrow(vehicle127))*4
vehicle127 = vehicle127[,-c(1)]
write_tsv(vehicle127,"D:/Mario/Escritorio/Fijaciones/vehicle127.tsv")

ggplot(vehicle127, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle127_fixations <- subset(detect.fixations(vehicle127))

diagnostic.plot(vehicle127, vehicle127_fixations)

diagnostic.plot(vehicle127, vehicle127_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle127 <- calculate.summary(vehicle127_fixations)
round(stats_vehicle127, digits=2)




























