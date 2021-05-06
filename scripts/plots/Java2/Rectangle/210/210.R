library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_210 <- read_tsv("210_rawdata.tsv", comment = "#")

rawdata_210 <- rename(rawdata_210, trial = Trial)
rawdata_210 <- rename(rawdata_210, x = 'L POR X [px]')
rawdata_210 <- rename(rawdata_210, y = 'L POR Y [px]')

rawdata_210 <- rawdata_210 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 210

vehicle210 <- subset(rawdata_210, Time >= 788434056 & Time <= 819448045)

vehicle210$time <- seq.int(nrow(vehicle210))*4
vehicle210 = vehicle210[,-c(1)]
write_tsv(vehicle210,"D:/Mario/Escritorio/Fijaciones/vehicle210.tsv")

ggplot(vehicle210, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle210_fixations <- subset(detect.fixations(vehicle210))

diagnostic.plot(vehicle210, vehicle210_fixations)

diagnostic.plot(vehicle210, vehicle210_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle210 <- calculate.summary(vehicle210_fixations)
round(stats_vehicle210, digits=2)

#Hacer rectangle en 210

rectangle210 <- subset(rawdata_210, Time >= 837270555 & Time <= 865336801)

rectangle210$time <- seq.int(nrow(rectangle210))*4
rectangle210 = rectangle210[,-c(1)]
write_tsv(rectangle210,"D:/Mario/Escritorio/Fijaciones/rectangle210.tsv")

ggplot(rectangle210, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle210_fixations <- subset(detect.fixations(rectangle210))

diagnostic.plot(rectangle210, rectangle210_fixations)

diagnostic.plot(rectangle210, rectangle210_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle210 <- calculate.summary(rectangle210_fixations)
round(stats_rectangle210, digits=2)








