library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_42 <- read_tsv("42_rawdata.tsv", comment = "#")

rawdata_42 <- rename(rawdata_42, trial = Trial)
rawdata_42 <- rename(rawdata_42, x = 'L POR X [px]')
rawdata_42 <- rename(rawdata_42, y = 'L POR Y [px]')

rawdata_42 <- rawdata_42 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 42

vehicle42 <- subset(rawdata_42, Time >= 437101376 & Time <= 471411048)

vehicle42$time <- seq.int(nrow(vehicle42))*4
vehicle42 = vehicle42[,-c(1)]
write_tsv(vehicle42,"D:/Mario/Escritorio/Fijaciones/vehicle42.tsv")

ggplot(vehicle42, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle42_fixations <- subset(detect.fixations(vehicle42))

diagnostic.plot(vehicle42, vehicle42_fixations)

diagnostic.plot(vehicle42, vehicle42_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle42 <- calculate.summary(vehicle42_fixations)
round(stats_vehicle42, digits=2)

#Hacer rectangle en 42

rectangle42 <- subset(rawdata_42, Time >= 483690108 & Time <= 498393449)

rectangle42$time <- seq.int(nrow(rectangle42))*4
rectangle42 = rectangle42[,-c(1)]
write_tsv(rectangle42,"D:/Mario/Escritorio/Fijaciones/rectangle42.tsv")

ggplot(rectangle42, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle42_fixations <- subset(detect.fixations(rectangle42))

diagnostic.plot(rectangle42, rectangle42_fixations)

diagnostic.plot(rectangle42, rectangle42_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle42 <- calculate.summary(rectangle42_fixations)
round(stats_rectangle42, digits=2)














