library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_101 <- read_tsv("101_rawdata.tsv", comment = "#")

rawdata_101 <- rename(rawdata_101, trial = Trial)
rawdata_101 <- rename(rawdata_101, x = 'L POR X [px]')
rawdata_101 <- rename(rawdata_101, y = 'L POR Y [px]')

rawdata_101 <- rawdata_101 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 101

rectangle101 <- subset(rawdata_101, Time >= 441184985 & Time <= 483444395)

rectangle101$time <- seq.int(nrow(rectangle101))*4
rectangle101 = rectangle101[,-c(1)]
write_tsv(rectangle101,"D:/Mario/Escritorio/Fijaciones/rectangle101.tsv")

ggplot(rectangle101, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle101_fixations <- subset(detect.fixations(rectangle101))

diagnostic.plot(rectangle101, rectangle101_fixations)

diagnostic.plot(rectangle101, rectangle101_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle101 <- calculate.summary(rectangle101_fixations)
round(stats_rectangle101, digits=2)

#Hacer vehicle en 101

vehicle101 <- subset(rawdata_101, Time >= 519303047 & Time <= 729846997)

vehicle101$time <- seq.int(nrow(vehicle101))*4
vehicle101 = vehicle101[,-c(1)]
write_tsv(vehicle101,"D:/Mario/Escritorio/Fijaciones/vehicle101.tsv")

ggplot(vehicle101, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle101_fixations <- subset(detect.fixations(vehicle101))

diagnostic.plot(vehicle101, vehicle101_fixations)

diagnostic.plot(vehicle101, vehicle101_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle101 <- calculate.summary(vehicle101_fixations)
round(stats_vehicle101, digits=2)




