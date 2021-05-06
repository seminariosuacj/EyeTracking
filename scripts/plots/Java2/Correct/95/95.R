library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_95 <- read_tsv("95_rawdata.tsv", comment = "#")

rawdata_95 <- rename(rawdata_95, trial = Trial)
rawdata_95 <- rename(rawdata_95, x = 'L POR X [px]')
rawdata_95 <- rename(rawdata_95, y = 'L POR Y [px]')

rawdata_95 <- rawdata_95 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 95

vehicle95 <- subset(rawdata_95, Time >= 6755829097 & Time <= 6789090685)

vehicle95$time <- seq.int(nrow(vehicle95))*4
vehicle95 = vehicle95[,-c(1)]
write_tsv(vehicle95,"D:/Mario/Escritorio/Fijaciones/vehicle95.tsv")

ggplot(vehicle95, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle95_fixations <- subset(detect.fixations(vehicle95))

diagnostic.plot(vehicle95, vehicle95_fixations)

diagnostic.plot(vehicle95, vehicle95_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle95 <- calculate.summary(vehicle95_fixations)
round(stats_vehicle95, digits=2)

#Hacer rectangle en 95

rectangle95 <- subset(rawdata_95, Time >= 6820904287 & Time <= 6867263722)

rectangle95$time <- seq.int(nrow(rectangle95))*4
rectangle95 = rectangle95[,-c(1)]
write_tsv(rectangle95,"D:/Mario/Escritorio/Fijaciones/rectangle95.tsv")

ggplot(rectangle95, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle95_fixations <- subset(detect.fixations(rectangle95))

diagnostic.plot(rectangle95, rectangle95_fixations)

diagnostic.plot(rectangle95, rectangle95_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle95 <- calculate.summary(rectangle95_fixations)
round(stats_rectangle95, digits=2)
