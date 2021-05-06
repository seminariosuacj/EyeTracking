library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_141 <- read_tsv("141_rawdata.tsv", comment = "#")

rawdata_141 <- rename(rawdata_141, trial = Trial)
rawdata_141 <- rename(rawdata_141, x = 'L POR X [px]')
rawdata_141 <- rename(rawdata_141, y = 'L POR Y [px]')

rawdata_141 <- rawdata_141 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 141

vehicle141 <- subset(rawdata_141, Time >= 11544047263 & Time <= 11600666740)

vehicle141$time <- seq.int(nrow(vehicle141))*4
vehicle141 = vehicle141[,-c(1)]
write_tsv(vehicle141,"D:/Mario/Escritorio/Fijaciones/vehicle141.tsv")

ggplot(vehicle141, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle141_fixations <- subset(detect.fixations(vehicle141))

diagnostic.plot(vehicle141, vehicle141_fixations)

diagnostic.plot(vehicle141, vehicle141_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle141 <- calculate.summary(vehicle141_fixations)
round(stats_vehicle141, digits=2)


#Hacer rectangle en 141

rectangle141 <- subset(rawdata_141, Time >= 11632288413 & Time <= 11695819792)

rectangle141$time <- seq.int(nrow(rectangle141))*4
rectangle141 = rectangle141[,-c(1)]
write_tsv(rectangle141,"D:/Mario/Escritorio/Fijaciones/rectangle141.tsv")

ggplot(rectangle141, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle141_fixations <- subset(detect.fixations(rectangle141))

diagnostic.plot(rectangle141, rectangle141_fixations)

diagnostic.plot(rectangle141, rectangle141_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle141 <- calculate.summary(rectangle141_fixations)
round(stats_rectangle141, digits=2)





































