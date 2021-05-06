library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_145 <- read_tsv("145_rawdata.tsv", comment = "#")

rawdata_145 <- rename(rawdata_145, trial = Trial)
rawdata_145 <- rename(rawdata_145, x = 'L POR X [px]')
rawdata_145 <- rename(rawdata_145, y = 'L POR Y [px]')

rawdata_145 <- rawdata_145 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 145

rectangle145 <- subset(rawdata_145, Time >= 31607109653 & Time <= 31684462872)

rectangle145$time <- seq.int(nrow(rectangle145))*4
rectangle145 = rectangle145[,-c(1)]
write_tsv(rectangle145,"D:/Mario/Escritorio/Fijaciones/rectangle145.tsv")

ggplot(rectangle145, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle145_fixations <- subset(detect.fixations(rectangle145))

diagnostic.plot(rectangle145, rectangle145_fixations)

diagnostic.plot(rectangle145, rectangle145_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle145 <- calculate.summary(rectangle145_fixations)
round(stats_rectangle145, digits=2)



#Hacer vehicle en 145

vehicle145 <- subset(rawdata_145, Time >= 31709293159 & Time <= 31789323490)

vehicle145$time <- seq.int(nrow(vehicle145))*4
vehicle145 = vehicle145[,-c(1)]
write_tsv(vehicle145,"D:/Mario/Escritorio/Fijaciones/vehicle145.tsv")

ggplot(vehicle145, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle145_fixations <- subset(detect.fixations(vehicle145))

diagnostic.plot(vehicle145, vehicle145_fixations)

diagnostic.plot(vehicle145, vehicle145_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle145 <- calculate.summary(vehicle145_fixations)
round(stats_vehicle145, digits=2)







































