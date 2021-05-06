library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_35 <- read_tsv("35_rawdata.tsv", comment = "#")

rawdata_35 <- rename(rawdata_35, trial = Trial)
rawdata_35 <- rename(rawdata_35, x = 'L POR X [px]')
rawdata_35 <- rename(rawdata_35, y = 'L POR Y [px]')

rawdata_35 <- rawdata_35 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 35

rectangle35 <- subset(rawdata_35, Time >= 16895981804 & Time <= 16941818762)

rectangle35$time <- seq.int(nrow(rectangle35))*4
rectangle35 = rectangle35[,-c(1)]
write_tsv(rectangle35,"D:/Mario/Escritorio/Fijaciones/rectangle35.tsv")

ggplot(rectangle35, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle35_fixations <- subset(detect.fixations(rectangle35))

diagnostic.plot(rectangle35, rectangle35_fixations)

diagnostic.plot(rectangle35, rectangle35_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle35 <- calculate.summary(rectangle35_fixations)
round(stats_rectangle35, digits=2)

#Hacer vehicle en 35

vehicle35 <- subset(rawdata_35, Time >= 16964589150 & Time <= 17038946492)

vehicle35$time <- seq.int(nrow(vehicle35))*4
vehicle35 = vehicle35[,-c(1)]
write_tsv(vehicle35,"D:/Mario/Escritorio/Fijaciones/vehicle35.tsv")

ggplot(vehicle35, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle35_fixations <- subset(detect.fixations(vehicle35))

diagnostic.plot(vehicle35, vehicle35_fixations)

diagnostic.plot(vehicle35, vehicle35_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle35 <- calculate.summary(vehicle35_fixations)
round(stats_vehicle35, digits=2)












