library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_77 <- read_tsv("77_rawdata.tsv", comment = "#")

rawdata_77 <- rename(rawdata_77, trial = Trial)
rawdata_77 <- rename(rawdata_77, x = 'L POR X [px]')
rawdata_77 <- rename(rawdata_77, y = 'L POR Y [px]')

rawdata_77 <- rawdata_77 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 77

vehicle77 <- subset(rawdata_77, Time >= 14632178918 & Time <= 14719896797)

vehicle77$time <- seq.int(nrow(vehicle77))*4
vehicle77 = vehicle77[,-c(1)]
write_tsv(vehicle77,"D:/Mario/Escritorio/Fijaciones/vehicle77.tsv")

ggplot(vehicle77, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle77_fixations <- subset(detect.fixations(vehicle77))

diagnostic.plot(vehicle77, vehicle77_fixations)

diagnostic.plot(vehicle77, vehicle77_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle77 <- calculate.summary(vehicle77_fixations)
round(stats_vehicle77, digits=2)

#Hacer rectangle en 77

rectangle77 <- subset(rawdata_77, Time >= 14760127095 & Time <= 14880863209)

rectangle77$time <- seq.int(nrow(rectangle77))*4
rectangle77 = rectangle77[,-c(1)]
write_tsv(rectangle77,"D:/Mario/Escritorio/Fijaciones/rectangle77.tsv")

ggplot(rectangle77, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle77_fixations <- subset(detect.fixations(rectangle77))

diagnostic.plot(rectangle77, rectangle77_fixations)

diagnostic.plot(rectangle77, rectangle77_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle77 <- calculate.summary(rectangle77_fixations)
round(stats_rectangle77, digits=2)























