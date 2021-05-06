library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_157 <- read_tsv("157_rawdata.tsv", comment = "#")

rawdata_157 <- rename(rawdata_157, trial = Trial)
rawdata_157 <- rename(rawdata_157, x = 'L POR X [px]')
rawdata_157 <- rename(rawdata_157, y = 'L POR Y [px]')

rawdata_157 <- rawdata_157 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 157

vehicle157 <- subset(rawdata_157, Time >= 3705676988 & Time <= 3798697762)

vehicle157$time <- seq.int(nrow(vehicle157))*4
vehicle157 = vehicle157[,-c(1)]
write_tsv(vehicle157,"D:/Mario/Escritorio/Fijaciones/vehicle157.tsv")

ggplot(vehicle157, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle157_fixations <- subset(detect.fixations(vehicle157))

diagnostic.plot(vehicle157, vehicle157_fixations)

diagnostic.plot(vehicle157, vehicle157_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle157 <- calculate.summary(vehicle157_fixations)
round(stats_vehicle157, digits=2)

#Hacer rectangle en 157

rectangle157 <- subset(rawdata_157, Time >= 3851882354 & Time <= 3951355379)

rectangle157$time <- seq.int(nrow(rectangle157))*4
rectangle157 = rectangle157[,-c(1)]
write_tsv(rectangle157,"D:/Mario/Escritorio/Fijaciones/rectangle157.tsv")

ggplot(rectangle157, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle157_fixations <- subset(detect.fixations(rectangle157))

diagnostic.plot(rectangle157, rectangle157_fixations)

diagnostic.plot(rectangle157, rectangle157_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle157 <- calculate.summary(rectangle157_fixations)
round(stats_rectangle157, digits=2)






