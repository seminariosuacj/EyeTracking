library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_154 <- read_tsv("154_rawdata.tsv", comment = "#")

rawdata_154 <- rename(rawdata_154, trial = Trial)
rawdata_154 <- rename(rawdata_154, x = 'L POR X [px]')
rawdata_154 <- rename(rawdata_154, y = 'L POR Y [px]')

rawdata_154 <- rawdata_154 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 154

vehicle154 <- subset(rawdata_154, Time >= 2807692601 & Time <= 2944542228)

vehicle154$time <- seq.int(nrow(vehicle154))*4
vehicle154 = vehicle154[,-c(1)]
write_tsv(vehicle154,"D:/Mario/Escritorio/Fijaciones/vehicle154.tsv")

ggplot(vehicle154, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle154_fixations <- subset(detect.fixations(vehicle154))

diagnostic.plot(vehicle154, vehicle154_fixations)

diagnostic.plot(vehicle154, vehicle154_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle154 <- calculate.summary(vehicle154_fixations)
round(stats_vehicle154, digits=2)

#Hacer rectangle en 154

rectangle154 <- subset(rawdata_154, Time >= 2994557170 & Time <= 3075387196)

rectangle154$time <- seq.int(nrow(rectangle154))*4
rectangle154 = rectangle154[,-c(1)]
write_tsv(rectangle154,"D:/Mario/Escritorio/Fijaciones/rectangle154.tsv")

ggplot(rectangle154, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle154_fixations <- subset(detect.fixations(rectangle154))

diagnostic.plot(rectangle154, rectangle154_fixations)

diagnostic.plot(rectangle154, rectangle154_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle154 <- calculate.summary(rectangle154_fixations)
round(stats_rectangle154, digits=2)



















