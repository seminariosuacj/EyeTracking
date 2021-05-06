library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_3 <- read_tsv("3_rawdata.tsv", comment = "#")

rawdata_3 <- rename(rawdata_3, trial = Trial)
rawdata_3 <- rename(rawdata_3, x = 'L POR X [px]')
rawdata_3 <- rename(rawdata_3, y = 'L POR Y [px]')

rawdata_3 <- rawdata_3 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 3

vehicle3 <- subset(rawdata_3, Time >= 2248880418 & Time <= 2288461117)

vehicle3$time <- seq.int(nrow(vehicle3))*4
vehicle3 = vehicle3[,-c(1)]
write_tsv(vehicle3,"D:/Mario/Escritorio/Fijaciones/vehicle3.tsv")

ggplot(vehicle3, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle3_fixations <- subset(detect.fixations(vehicle3))

diagnostic.plot(vehicle3, vehicle3_fixations)

diagnostic.plot(vehicle3, vehicle3_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle3 <- calculate.summary(vehicle3_fixations)
round(stats_vehicle3, digits=2)

#Hacer rectangle en 3

rectangle3 <- subset(rawdata_3, Time >= 2330805566 & Time <= 2361826836)

rectangle3$time <- seq.int(nrow(rectangle3))*4
rectangle3 = rectangle3[,-c(1)]
write_tsv(rectangle3,"D:/Mario/Escritorio/Fijaciones/rectangle3.tsv")

ggplot(rectangle3, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle3_fixations <- subset(detect.fixations(rectangle3))

diagnostic.plot(rectangle3, rectangle3_fixations)

diagnostic.plot(rectangle3, rectangle3_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle3 <- calculate.summary(rectangle3_fixations)
round(stats_rectangle3, digits=2)


