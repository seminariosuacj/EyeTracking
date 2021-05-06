library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_37 <- read_tsv("37_rawdata.tsv", comment = "#")

rawdata_37 <- rename(rawdata_37, trial = Trial)
rawdata_37 <- rename(rawdata_37, x = 'L POR X [px]')
rawdata_37 <- rename(rawdata_37, y = 'L POR Y [px]')

rawdata_37 <- rawdata_37 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 37

rectangle37 <- subset(rawdata_37, Time >= 430733716 & Time <= 474530052)

rectangle37$time <- seq.int(nrow(rectangle37))*4
rectangle37 = rectangle37[,-c(1)]
write_tsv(rectangle37,"D:/Mario/Escritorio/Fijaciones/rectangle37.tsv")

ggplot(rectangle37, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle37_fixations <- subset(detect.fixations(rectangle37))

diagnostic.plot(rectangle37, rectangle37_fixations)

diagnostic.plot(rectangle37, rectangle37_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle37 <- calculate.summary(rectangle37_fixations)
round(stats_rectangle37, digits=2)

#Hacer vehicle en 37

vehicle37 <- subset(rawdata_37, Time >= 519958228 & Time <= 608899310)

vehicle37$time <- seq.int(nrow(vehicle37))*4
vehicle37 = vehicle37[,-c(1)]
write_tsv(vehicle37,"D:/Mario/Escritorio/Fijaciones/vehicle37.tsv")

ggplot(vehicle37, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle37_fixations <- subset(detect.fixations(vehicle37))

diagnostic.plot(vehicle37, vehicle37_fixations)

diagnostic.plot(vehicle37, vehicle37_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle37 <- calculate.summary(vehicle37_fixations)
round(stats_vehicle37, digits=2)
