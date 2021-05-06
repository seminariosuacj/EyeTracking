library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_23 <- read_tsv("23_rawdata.tsv", comment = "#")

rawdata_23 <- rename(rawdata_23, trial = Trial)
rawdata_23 <- rename(rawdata_23, x = 'L POR X [px]')
rawdata_23 <- rename(rawdata_23, y = 'L POR Y [px]')

rawdata_23 <- rawdata_23 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 23

rectangle23 <- subset(rawdata_23, Time >= 32985755058 & Time <= 33027404248)

rectangle23$time <- seq.int(nrow(rectangle23))*4
rectangle23 = rectangle23[,-c(1)]
write_tsv(rectangle23,"D:/Mario/Escritorio/Fijaciones/rectangle23.tsv")

ggplot(rectangle23, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle23_fixations <- subset(detect.fixations(rectangle23))

diagnostic.plot(rectangle23, rectangle23_fixations)

diagnostic.plot(rectangle23, rectangle23_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle23 <- calculate.summary(rectangle23_fixations)
round(stats_rectangle23, digits=2)

#Hacer vehicle en 23

vehicle23 <- subset(rawdata_23, Time >= 33065652111 & Time <= 33122050847)

vehicle23$time <- seq.int(nrow(vehicle23))*4
vehicle23 = vehicle23[,-c(1)]
write_tsv(vehicle23,"D:/Mario/Escritorio/Fijaciones/vehicle23.tsv")

ggplot(vehicle23, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle23_fixations <- subset(detect.fixations(vehicle23))

diagnostic.plot(vehicle23, vehicle23_fixations)

diagnostic.plot(vehicle23, vehicle23_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle23 <- calculate.summary(vehicle23_fixations)
round(stats_vehicle23, digits=2)








