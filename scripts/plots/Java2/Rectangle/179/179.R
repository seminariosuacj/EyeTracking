library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_179 <- read_tsv("179_rawdata.tsv", comment = "#")

rawdata_179 <- rename(rawdata_179, trial = Trial)
rawdata_179 <- rename(rawdata_179, x = 'L POR X [px]')
rawdata_179 <- rename(rawdata_179, y = 'L POR Y [px]')

rawdata_179 <- rawdata_179 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 179

vehicle179 <- subset(rawdata_179, Time >= 421895650 & Time <= 502380974)

vehicle179$time <- seq.int(nrow(vehicle179))*4
vehicle179 = vehicle179[,-c(1)]
write_tsv(vehicle179,"D:/Mario/Escritorio/Fijaciones/vehicle179.tsv")

ggplot(vehicle179, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle179_fixations <- subset(detect.fixations(vehicle179))

diagnostic.plot(vehicle179, vehicle179_fixations)

diagnostic.plot(vehicle179, vehicle179_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle179 <- calculate.summary(vehicle179_fixations)
round(stats_vehicle179, digits=2)


#Hacer rectangle en 179

rectangle179 <- subset(rawdata_179, Time >= 524551124 & Time <= 635713695)

rectangle179$time <- seq.int(nrow(rectangle179))*4
rectangle179 = rectangle179[,-c(1)]
write_tsv(rectangle179,"D:/Mario/Escritorio/Fijaciones/rectangle179.tsv")

ggplot(rectangle179, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle179_fixations <- subset(detect.fixations(rectangle179))

diagnostic.plot(rectangle179, rectangle179_fixations)

diagnostic.plot(rectangle179, rectangle179_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle179 <- calculate.summary(rectangle179_fixations)
round(stats_rectangle179, digits=2)








