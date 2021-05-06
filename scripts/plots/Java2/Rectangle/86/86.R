library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_86 <- read_tsv("86_rawdata.tsv", comment = "#")

rawdata_86 <- rename(rawdata_86, trial = Trial)
rawdata_86 <- rename(rawdata_86, x = 'L POR X [px]')
rawdata_86 <- rename(rawdata_86, y = 'L POR Y [px]')

rawdata_86 <- rawdata_86 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 86

rectangle86 <- subset(rawdata_86, Time >= 12263185079 & Time <= 12422467928)

rectangle86$time <- seq.int(nrow(rectangle86))*4
rectangle86 = rectangle86[,-c(1)]
write_tsv(rectangle86,"D:/Mario/Escritorio/Fijaciones/rectangle86.tsv")

ggplot(rectangle86, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle86_fixations <- subset(detect.fixations(rectangle86))

diagnostic.plot(rectangle86, rectangle86_fixations)

diagnostic.plot(rectangle86, rectangle86_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle86 <- calculate.summary(rectangle86_fixations)
round(stats_rectangle86, digits=2)

#Hacer vehicle en 86

vehicle86 <- subset(rawdata_86, Time >= 12459525675 & Time <= 12549679502)

vehicle86$time <- seq.int(nrow(vehicle86))*4
vehicle86 = vehicle86[,-c(1)]
write_tsv(vehicle86,"D:/Mario/Escritorio/Fijaciones/vehicle86.tsv")

ggplot(vehicle86, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle86_fixations <- subset(detect.fixations(vehicle86))

diagnostic.plot(vehicle86, vehicle86_fixations)

diagnostic.plot(vehicle86, vehicle86_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle86 <- calculate.summary(vehicle86_fixations)
round(stats_vehicle86, digits=2)

























