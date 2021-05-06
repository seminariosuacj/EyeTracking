library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_115 <- read_tsv("115_rawdata.tsv", comment = "#")

rawdata_115 <- rename(rawdata_115, trial = Trial)
rawdata_115 <- rename(rawdata_115, x = 'L POR X [px]')
rawdata_115 <- rename(rawdata_115, y = 'L POR Y [px]')

rawdata_115 <- rawdata_115 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 115

rectangle115 <- subset(rawdata_115, Time >= 290385730 & Time <= 324321960)

rectangle115$time <- seq.int(nrow(rectangle115))*4
rectangle115 = rectangle115[,-c(1)]
write_tsv(rectangle115,"D:/Mario/Escritorio/Fijaciones/rectangle115.tsv")

ggplot(rectangle115, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle115_fixations <- subset(detect.fixations(rectangle115))

diagnostic.plot(rectangle115, rectangle115_fixations)

diagnostic.plot(rectangle115, rectangle115_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle115 <- calculate.summary(rectangle115_fixations)
round(stats_rectangle115, digits=2)

#Hacer vehicle en 115

vehicle115 <- subset(rawdata_115, Time >= 366883033 & Time <= 432565132)

vehicle115$time <- seq.int(nrow(vehicle115))*4
vehicle115 = vehicle115[,-c(1)]
write_tsv(vehicle115,"D:/Mario/Escritorio/Fijaciones/vehicle115.tsv")

ggplot(vehicle115, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle115_fixations <- subset(detect.fixations(vehicle115))

diagnostic.plot(vehicle115, vehicle115_fixations)

diagnostic.plot(vehicle115, vehicle115_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle115 <- calculate.summary(vehicle115_fixations)
round(stats_vehicle115, digits=2)























