library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_91 <- read_tsv("91_rawdata.tsv", comment = "#")

rawdata_91 <- rename(rawdata_91, trial = Trial)
rawdata_91 <- rename(rawdata_91, x = 'L POR X [px]')
rawdata_91 <- rename(rawdata_91, y = 'L POR Y [px]')

rawdata_91 <- rawdata_91 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 91

vehicle91 <- subset(rawdata_91, Time >= 3782807906 & Time <= 3839548049)

vehicle91$time <- seq.int(nrow(vehicle91))*4
vehicle91 = vehicle91[,-c(1)]
write_tsv(vehicle91,"D:/Mario/Escritorio/Fijaciones/vehicle91.tsv")

ggplot(vehicle91, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle91_fixations <- subset(detect.fixations(vehicle91))

diagnostic.plot(vehicle91, vehicle91_fixations)

diagnostic.plot(vehicle91, vehicle91_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle91 <- calculate.summary(vehicle91_fixations)
round(stats_vehicle91, digits=2)

#Hacer rectangle en 91

rectangle91 <- subset(rawdata_91, Time >= 3859591553 & Time <= 3897905219)

rectangle91$time <- seq.int(nrow(rectangle91))*4
rectangle91 = rectangle91[,-c(1)]
write_tsv(rectangle91,"D:/Mario/Escritorio/Fijaciones/rectangle91.tsv")

ggplot(rectangle91, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle91_fixations <- subset(detect.fixations(rectangle91))

diagnostic.plot(rectangle91, rectangle91_fixations)

diagnostic.plot(rectangle91, rectangle91_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle91 <- calculate.summary(rectangle91_fixations)
round(stats_rectangle91, digits=2)
