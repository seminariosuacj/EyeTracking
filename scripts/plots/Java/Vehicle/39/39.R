library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_39 <- read_tsv("39_rawdata.tsv", comment = "#")

rawdata_39 <- rename(rawdata_39, trial = Trial)
rawdata_39 <- rename(rawdata_39, x = 'L POR X [px]')
rawdata_39 <- rename(rawdata_39, y = 'L POR Y [px]')

rawdata_39 <- rawdata_39 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 39

vehicle39 <- subset(rawdata_39, Time >= 4777731694 & Time <= 4798658267)

vehicle39$time <- seq.int(nrow(vehicle39))*4
vehicle39 = vehicle39[,-c(1)]

write_tsv(vehicle39,"D:/Mario/Escritorio/Fijaciones/vehicle39.tsv")

ggplot(vehicle39, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle39_fixations <- subset(detect.fixations(vehicle39))

diagnostic.plot(vehicle39, vehicle39_fixations)

diagnostic.plot(vehicle39, vehicle39_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle39 <- calculate.summary(vehicle39_fixations)
round(stats_vehicle39, digits=2)



#Hacer rectangle en 39

rectangle39 <- subset(rawdata_39, Time >= 4831541787 & Time <= 4841694252)

rectangle39$time <- seq.int(nrow(rectangle39))*4
rectangle39 = rectangle39[,-c(1)]

write_tsv(rectangle39,"D:/Mario/Escritorio/Fijaciones/rectangle39.tsv")

ggplot(rectangle39, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle39_fixations <- subset(detect.fixations(rectangle39))

diagnostic.plot(rectangle39, rectangle39_fixations)

diagnostic.plot(rectangle39, rectangle39_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle39 <- calculate.summary(rectangle39_fixations)
round(stats_rectangle39, digits=2)

