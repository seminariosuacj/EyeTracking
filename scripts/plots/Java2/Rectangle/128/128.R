library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_128 <- read_tsv("128_rawdata.tsv", comment = "#")

rawdata_128 <- rename(rawdata_128, trial = Trial)
rawdata_128 <- rename(rawdata_128, x = 'L POR X [px]')
rawdata_128 <- rename(rawdata_128, y = 'L POR Y [px]')

rawdata_128 <- rawdata_128 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 128

rectangle128 <- subset(rawdata_128, Time >= 18307252043 & Time <= 18361292391)

rectangle128$time <- seq.int(nrow(rectangle128))*4
rectangle128 = rectangle128[,-c(1)]
write_tsv(rectangle128,"D:/Mario/Escritorio/Fijaciones/rectangle128.tsv")

ggplot(rectangle128, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle128_fixations <- subset(detect.fixations(rectangle128))

diagnostic.plot(rectangle128, rectangle128_fixations)

diagnostic.plot(rectangle128, rectangle128_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle128 <- calculate.summary(rectangle128_fixations)
round(stats_rectangle128, digits=2)


#Hacer vehicle en 128

vehicle128 <- subset(rawdata_128, Time >= 18420828350 & Time <= 18550732499)

vehicle128$time <- seq.int(nrow(vehicle128))*4
vehicle128 = vehicle128[,-c(1)]
write_tsv(vehicle128,"D:/Mario/Escritorio/Fijaciones/vehicle128.tsv")

ggplot(vehicle128, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle128_fixations <- subset(detect.fixations(vehicle128))

diagnostic.plot(vehicle128, vehicle128_fixations)

diagnostic.plot(vehicle128, vehicle128_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle128 <- calculate.summary(vehicle128_fixations)
round(stats_vehicle128, digits=2)




























