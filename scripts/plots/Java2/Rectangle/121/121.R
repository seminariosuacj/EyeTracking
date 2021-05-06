library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_121 <- read_tsv("121_rawdata.tsv", comment = "#")

rawdata_121 <- rename(rawdata_121, trial = Trial)
rawdata_121 <- rename(rawdata_121, x = 'L POR X [px]')
rawdata_121 <- rename(rawdata_121, y = 'L POR Y [px]')

rawdata_121 <- rawdata_121 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 121

vehicle121 <- subset(rawdata_121, Time >= 3342054973 & Time <= 3369605210)

vehicle121$time <- seq.int(nrow(vehicle121))*4
vehicle121 = vehicle121[,-c(1)]
write_tsv(vehicle121,"D:/Mario/Escritorio/Fijaciones/vehicle121.tsv")

ggplot(vehicle121, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle121_fixations <- subset(detect.fixations(vehicle121))

diagnostic.plot(vehicle121, vehicle121_fixations)

diagnostic.plot(vehicle121, vehicle121_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle121 <- calculate.summary(vehicle121_fixations)
round(stats_vehicle121, digits=2)


#Hacer rectangle en 121

rectangle121 <- subset(rawdata_121, Time >= 3379800479 & Time <= 3422209594)

rectangle121$time <- seq.int(nrow(rectangle121))*4
rectangle121 = rectangle121[,-c(1)]
write_tsv(rectangle121,"D:/Mario/Escritorio/Fijaciones/rectangle121.tsv")

ggplot(rectangle121, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle121_fixations <- subset(detect.fixations(rectangle121))

diagnostic.plot(rectangle121, rectangle121_fixations)

diagnostic.plot(rectangle121, rectangle121_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle121 <- calculate.summary(rectangle121_fixations)
round(stats_rectangle121, digits=2)

























