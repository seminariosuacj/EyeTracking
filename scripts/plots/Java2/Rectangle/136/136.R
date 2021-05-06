library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_136 <- read_tsv("136_rawdata.tsv", comment = "#")

rawdata_136 <- rename(rawdata_136, trial = Trial)
rawdata_136 <- rename(rawdata_136, x = 'L POR X [px]')
rawdata_136 <- rename(rawdata_136, y = 'L POR Y [px]')

rawdata_136 <- rawdata_136 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 136

vehicle136 <- subset(rawdata_136, Time >= 6460585087 & Time <= 6517091643)

vehicle136$time <- seq.int(nrow(vehicle136))*4
vehicle136 = vehicle136[,-c(1)]
write_tsv(vehicle136,"D:/Mario/Escritorio/Fijaciones/vehicle136.tsv")

ggplot(vehicle136, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle136_fixations <- subset(detect.fixations(vehicle136))

diagnostic.plot(vehicle136, vehicle136_fixations)

diagnostic.plot(vehicle136, vehicle136_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle136 <- calculate.summary(vehicle136_fixations)
round(stats_vehicle136, digits=2)


#Hacer rectangle en 136

rectangle136 <- subset(rawdata_136, Time >= 6533653249 & Time <= 6608947181)

rectangle136$time <- seq.int(nrow(rectangle136))*4
rectangle136 = rectangle136[,-c(1)]
write_tsv(rectangle136,"D:/Mario/Escritorio/Fijaciones/rectangle136.tsv")

ggplot(rectangle136, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle136_fixations <- subset(detect.fixations(rectangle136))

diagnostic.plot(rectangle136, rectangle136_fixations)

diagnostic.plot(rectangle136, rectangle136_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle136 <- calculate.summary(rectangle136_fixations)
round(stats_rectangle136, digits=2)































