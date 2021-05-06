library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_88 <- read_tsv("88_rawdata.tsv", comment = "#")

rawdata_88 <- rename(rawdata_88, trial = Trial)
rawdata_88 <- rename(rawdata_88, x = 'L POR X [px]')
rawdata_88 <- rename(rawdata_88, y = 'L POR Y [px]')

rawdata_88 <- rawdata_88 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 88

rectangle88 <- subset(rawdata_88, Time >= 5585153088 & Time <= 5630667143)

rectangle88$time <- seq.int(nrow(rectangle88))*4
rectangle88 = rectangle88[,-c(1)]
write_tsv(rectangle88,"D:/Mario/Escritorio/Fijaciones/rectangle88.tsv")

ggplot(rectangle88, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle88_fixations <- subset(detect.fixations(rectangle88))

diagnostic.plot(rectangle88, rectangle88_fixations)

diagnostic.plot(rectangle88, rectangle88_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle88 <- calculate.summary(rectangle88_fixations)
round(stats_rectangle88, digits=2)

#Hacer vehicle en 88

vehicle88 <- subset(rawdata_88, Time >= 5720715079 & Time <= 5791444582)

vehicle88$time <- seq.int(nrow(vehicle88))*4
vehicle88 = vehicle88[,-c(1)]
write_tsv(vehicle88,"D:/Mario/Escritorio/Fijaciones/vehicle88.tsv")

ggplot(vehicle88, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle88_fixations <- subset(detect.fixations(vehicle88))

diagnostic.plot(vehicle88, vehicle88_fixations)

diagnostic.plot(vehicle88, vehicle88_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle88 <- calculate.summary(vehicle88_fixations)
round(stats_vehicle88, digits=2)














