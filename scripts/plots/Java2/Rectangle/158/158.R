library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_158 <- read_tsv("158_rawdata.tsv", comment = "#")

rawdata_158 <- rename(rawdata_158, trial = Trial)
rawdata_158 <- rename(rawdata_158, x = 'L POR X [px]')
rawdata_158 <- rename(rawdata_158, y = 'L POR Y [px]')

rawdata_158 <- rawdata_158 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 158

rectangle158 <- subset(rawdata_158, Time >= 2095300746 & Time <= 2148910816)

rectangle158$time <- seq.int(nrow(rectangle158))*4
rectangle158 = rectangle158[,-c(1)]
write_tsv(rectangle158,"D:/Mario/Escritorio/Fijaciones/rectangle158.tsv")

ggplot(rectangle158, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle158_fixations <- subset(detect.fixations(rectangle158))

diagnostic.plot(rectangle158, rectangle158_fixations)

diagnostic.plot(rectangle158, rectangle158_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle158 <- calculate.summary(rectangle158_fixations)
round(stats_rectangle158, digits=2)

#Hacer vehicle en 158

vehicle158 <- subset(rawdata_158, Time >= 2189343374 & Time <= 2262506234)

vehicle158$time <- seq.int(nrow(vehicle158))*4
vehicle158 = vehicle158[,-c(1)]
write_tsv(vehicle158,"D:/Mario/Escritorio/Fijaciones/vehicle158.tsv")

ggplot(vehicle158, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle158_fixations <- subset(detect.fixations(vehicle158))

diagnostic.plot(vehicle158, vehicle158_fixations)

diagnostic.plot(vehicle158, vehicle158_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle158 <- calculate.summary(vehicle158_fixations)
round(stats_vehicle158, digits=2)





















