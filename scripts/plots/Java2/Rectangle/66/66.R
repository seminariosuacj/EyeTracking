library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_66 <- read_tsv("66_rawdata.tsv", comment = "#")

rawdata_66 <- rename(rawdata_66, trial = Trial)
rawdata_66 <- rename(rawdata_66, x = 'L POR X [px]')
rawdata_66 <- rename(rawdata_66, y = 'L POR Y [px]')

rawdata_66 <- rawdata_66 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 66

vehicle66 <- subset(rawdata_66, Time >= 2623609261 & Time <= 2657198976)

vehicle66$time <- seq.int(nrow(vehicle66))*4
vehicle66 = vehicle66[,-c(1)]
write_tsv(vehicle66,"D:/Mario/Escritorio/Fijaciones/vehicle66.tsv")

ggplot(vehicle66, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle66_fixations <- subset(detect.fixations(vehicle66))

diagnostic.plot(vehicle66, vehicle66_fixations)

diagnostic.plot(vehicle66, vehicle66_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle66 <- calculate.summary(vehicle66_fixations)
round(stats_vehicle66, digits=2)

#Hacer rectangle en 66

rectangle66 <- subset(rawdata_66, Time >= 2686152968 & Time <= 2737288862)

rectangle66$time <- seq.int(nrow(rectangle66))*4
rectangle66 = rectangle66[,-c(1)]
write_tsv(rectangle66,"D:/Mario/Escritorio/Fijaciones/rectangle66.tsv")

ggplot(rectangle66, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle66_fixations <- subset(detect.fixations(rectangle66))

diagnostic.plot(rectangle66, rectangle66_fixations)

diagnostic.plot(rectangle66, rectangle66_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle66 <- calculate.summary(rectangle66_fixations)
round(stats_rectangle66, digits=2)



















