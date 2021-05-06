library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_8 <- read_tsv("8_rawdata.tsv", comment = "#")

rawdata_8 <- rename(rawdata_8, trial = Trial)
rawdata_8 <- rename(rawdata_8, x = 'L POR X [px]')
rawdata_8 <- rename(rawdata_8, y = 'L POR Y [px]')

rawdata_8 <- rawdata_8 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 8

vehicle8 <- subset(rawdata_8, Time >= 4727355058 & Time <= 4866720693)

vehicle8$time <- seq.int(nrow(vehicle8))*4
vehicle8 = vehicle8[,-c(1)]
write_tsv(vehicle8,"D:/Mario/Escritorio/Fijaciones/vehicle8.tsv")

ggplot(vehicle8, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle8_fixations <- subset(detect.fixations(vehicle8))

diagnostic.plot(vehicle8, vehicle8_fixations)

diagnostic.plot(vehicle8, vehicle8_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle8 <- calculate.summary(vehicle8_fixations)
round(stats_vehicle8, digits=2)

#Hacer rectangle en 8

rectangle8 <- subset(rawdata_8, Time >= 4894846654 & Time <= 4956914181)

rectangle8$time <- seq.int(nrow(rectangle8))*4
rectangle8 = rectangle8[,-c(1)]
write_tsv(rectangle8,"D:/Mario/Escritorio/Fijaciones/rectangle8.tsv")

ggplot(rectangle8, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle8_fixations <- subset(detect.fixations(rectangle8))

diagnostic.plot(rectangle8, rectangle8_fixations)

diagnostic.plot(rectangle8, rectangle8_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle8 <- calculate.summary(rectangle8_fixations)
round(stats_rectangle8, digits=2)






