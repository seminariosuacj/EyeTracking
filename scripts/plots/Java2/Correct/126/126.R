library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_126 <- read_tsv("126_rawdata.tsv", comment = "#")

rawdata_126 <- rename(rawdata_126, trial = Trial)
rawdata_126 <- rename(rawdata_126, x = 'L POR X [px]')
rawdata_126 <- rename(rawdata_126, y = 'L POR Y [px]')

rawdata_126 <- rawdata_126 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 126

vehicle126 <- subset(rawdata_126, Time >= 11449057277 & Time <= 11525723455)

vehicle126$time <- seq.int(nrow(vehicle126))*4
vehicle126 = vehicle126[,-c(1)]
write_tsv(vehicle126,"D:/Mario/Escritorio/Fijaciones/vehicle126.tsv")

ggplot(vehicle126, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle126_fixations <- subset(detect.fixations(vehicle126))

diagnostic.plot(vehicle126, vehicle126_fixations)

diagnostic.plot(vehicle126, vehicle126_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle126 <- calculate.summary(vehicle126_fixations)
round(stats_vehicle126, digits=2)

#Hacer rectangle en 126

rectangle126 <- subset(rawdata_126, Time >= 11547675375 & Time <= 11609927286)

rectangle126$time <- seq.int(nrow(rectangle126))*4
rectangle126 = rectangle126[,-c(1)]
write_tsv(rectangle126,"D:/Mario/Escritorio/Fijaciones/rectangle126.tsv")

ggplot(rectangle126, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle126_fixations <- subset(detect.fixations(rectangle126))

diagnostic.plot(rectangle126, rectangle126_fixations)

diagnostic.plot(rectangle126, rectangle126_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle126 <- calculate.summary(rectangle126_fixations)
round(stats_rectangle126, digits=2)

