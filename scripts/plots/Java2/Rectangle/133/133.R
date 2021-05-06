library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_133 <- read_tsv("133_rawdata.tsv", comment = "#")

rawdata_133 <- rename(rawdata_133, trial = Trial)
rawdata_133 <- rename(rawdata_133, x = 'L POR X [px]')
rawdata_133 <- rename(rawdata_133, y = 'L POR Y [px]')

rawdata_133 <- rawdata_133 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 133

rectangle133 <- subset(rawdata_133, Time >= 2548321735 & Time <= 2601498138)

rectangle133$time <- seq.int(nrow(rectangle133))*4
rectangle133 = rectangle133[,-c(1)]
write_tsv(rectangle133,"D:/Mario/Escritorio/Fijaciones/rectangle133.tsv")

ggplot(rectangle133, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle133_fixations <- subset(detect.fixations(rectangle133))

diagnostic.plot(rectangle133, rectangle133_fixations)

diagnostic.plot(rectangle133, rectangle133_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle133 <- calculate.summary(rectangle133_fixations)
round(stats_rectangle133, digits=2)


#Hacer vehicle en 133

vehicle133 <- subset(rawdata_133, Time >= 2645143125 & Time <= 2712138696)

vehicle133$time <- seq.int(nrow(vehicle133))*4
vehicle133 = vehicle133[,-c(1)]
write_tsv(vehicle133,"D:/Mario/Escritorio/Fijaciones/vehicle133.tsv")

ggplot(vehicle133, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle133_fixations <- subset(detect.fixations(vehicle133))

diagnostic.plot(vehicle133, vehicle133_fixations)

diagnostic.plot(vehicle133, vehicle133_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle133 <- calculate.summary(vehicle133_fixations)
round(stats_vehicle133, digits=2)




























