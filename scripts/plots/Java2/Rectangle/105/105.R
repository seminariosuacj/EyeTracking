library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_105 <- read_tsv("105_rawdata.tsv", comment = "#")

rawdata_105 <- rename(rawdata_105, trial = Trial)
rawdata_105 <- rename(rawdata_105, x = 'L POR X [px]')
rawdata_105 <- rename(rawdata_105, y = 'L POR Y [px]')

rawdata_105 <- rawdata_105 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 105

rectangle105 <- subset(rawdata_105, Time >= 500566221 & Time <= 535721867)

rectangle105$time <- seq.int(nrow(rectangle105))*4
rectangle105 = rectangle105[,-c(1)]
write_tsv(rectangle105,"D:/Mario/Escritorio/Fijaciones/rectangle105.tsv")

ggplot(rectangle105, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle105_fixations <- subset(detect.fixations(rectangle105))

diagnostic.plot(rectangle105, rectangle105_fixations)

diagnostic.plot(rectangle105, rectangle105_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle105 <- calculate.summary(rectangle105_fixations)
round(stats_rectangle105, digits=2)


#Hacer vehicle en 105

vehicle105 <- subset(rawdata_105, Time >= 569606966 & Time <= 608611380)

vehicle105$time <- seq.int(nrow(vehicle105))*4
vehicle105 = vehicle105[,-c(1)]
write_tsv(vehicle105,"D:/Mario/Escritorio/Fijaciones/vehicle105.tsv")

ggplot(vehicle105, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle105_fixations <- subset(detect.fixations(vehicle105))

diagnostic.plot(vehicle105, vehicle105_fixations)

diagnostic.plot(vehicle105, vehicle105_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle105 <- calculate.summary(vehicle105_fixations)
round(stats_vehicle105, digits=2)


















