library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_56 <- read_tsv("56_rawdata.tsv", comment = "#")

rawdata_56 <- rename(rawdata_56, trial = Trial)
rawdata_56 <- rename(rawdata_56, x = 'L POR X [px]')
rawdata_56 <- rename(rawdata_56, y = 'L POR Y [px]')

rawdata_56 <- rawdata_56 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 56

vehicle56 <- subset(rawdata_56, Time >= 9833715407 & Time <= 9882288116)

vehicle56$time <- seq.int(nrow(vehicle56))*4
vehicle56 = vehicle56[,-c(1)]
write_tsv(vehicle56,"D:/Mario/Escritorio/Fijaciones/vehicle56.tsv")

ggplot(vehicle56, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle56_fixations <- subset(detect.fixations(vehicle56))

diagnostic.plot(vehicle56, vehicle56_fixations)

diagnostic.plot(vehicle56, vehicle56_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle56 <- calculate.summary(vehicle56_fixations)
round(stats_vehicle56, digits=2)

#Hacer en rectangle

rectangle56 <- subset(rawdata_56, Time >= 9900237244 & Time <= 9947140529)

rectangle56$time <- seq.int(nrow(rectangle56))*4
rectangle56 = rectangle56[,-c(1)]
write_tsv(rectangle56,"D:/Mario/Escritorio/Fijaciones/rectangle56.tsv")

ggplot(rectangle56, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle56_fixations <- subset(detect.fixations(rectangle56))

diagnostic.plot(rectangle56, rectangle56_fixations)

diagnostic.plot(rectangle56, rectangle56_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle56 <- calculate.summary(rectangle56_fixations)
round(stats_rectangle56, digits=2)
