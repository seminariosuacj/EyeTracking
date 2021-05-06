library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_15 <- read_tsv("15_rawdata.tsv", comment = "#")

rawdata_15 <- rename(rawdata_15, trial = Trial)
rawdata_15 <- rename(rawdata_15, x = 'L POR X [px]')
rawdata_15 <- rename(rawdata_15, y = 'L POR Y [px]')

rawdata_15 <- rawdata_15 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 15

rectangle15 <- subset(rawdata_15, Time >= 15493906692 & Time <= 15537834882)

rectangle15$time <- seq.int(nrow(rectangle15))*4
rectangle15 = rectangle15[,-c(1)]

write_tsv(rectangle15,"D:/Mario/Escritorio/Fijaciones/rectangle15.tsv")

ggplot(rectangle15, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle15_fixations <- subset(detect.fixations(rectangle15))

diagnostic.plot(rectangle15, rectangle15_fixations)

diagnostic.plot(rectangle15, rectangle15_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle15 <- calculate.summary(rectangle15_fixations)
round(stats_rectangle15, digits=2)

#Hacer vehicle en 15

vehicle15 <- subset(rawdata_15, Time >= 15553585648 & Time <= 15622875608)

vehicle15$time <- seq.int(nrow(vehicle15))*4
vehicle15 = vehicle15[,-c(1)]

write_tsv(vehicle15,"D:/Mario/Escritorio/Fijaciones/vehicle15.tsv")

ggplot(vehicle15, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle15_fixations <- subset(detect.fixations(vehicle15))

diagnostic.plot(vehicle15, vehicle15_fixations)

diagnostic.plot(vehicle15, vehicle15_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle15 <- calculate.summary(vehicle15_fixations)
round(stats_vehicle15, digits=2)
