library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_215 <- read_tsv("215_rawdata.tsv", comment = "#")

rawdata_215 <- rename(rawdata_215, trial = Trial)
rawdata_215 <- rename(rawdata_215, x = 'L POR X [px]')
rawdata_215 <- rename(rawdata_215, y = 'L POR Y [px]')

rawdata_215 <- rawdata_215 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 215

vehicle215 <- subset(rawdata_215, Time >= 292312083 & Time <= 360139357)

vehicle215$time <- seq.int(nrow(vehicle215))*4
vehicle215 = vehicle215[,-c(1)]
write_tsv(vehicle215,"D:/Mario/Escritorio/Fijaciones/vehicle215.tsv")

ggplot(vehicle215, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle215_fixations <- subset(detect.fixations(vehicle215))

diagnostic.plot(vehicle215, vehicle215_fixations)

diagnostic.plot(vehicle215, vehicle215_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle215 <- calculate.summary(vehicle215_fixations)
round(stats_vehicle215, digits=2)

#Hacer rectangle en 215

rectangle215 <- subset(rawdata_215, Time >= 389929454 & Time <= 435242305)

rectangle215$time <- seq.int(nrow(rectangle215))*4
rectangle215 = rectangle215[,-c(1)]
write_tsv(rectangle215,"D:/Mario/Escritorio/Fijaciones/rectangle215.tsv")

ggplot(rectangle215, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle215_fixations <- subset(detect.fixations(rectangle215))

diagnostic.plot(rectangle215, rectangle215_fixations)

diagnostic.plot(rectangle215, rectangle215_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle215 <- calculate.summary(rectangle215_fixations)
round(stats_rectangle215, digits=2)















