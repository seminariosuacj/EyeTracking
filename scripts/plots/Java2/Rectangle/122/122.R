library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_122 <- read_tsv("122_rawdata.tsv", comment = "#")

rawdata_122 <- rename(rawdata_122, trial = Trial)
rawdata_122 <- rename(rawdata_122, x = 'L POR X [px]')
rawdata_122 <- rename(rawdata_122, y = 'L POR Y [px]')

rawdata_122 <- rawdata_122 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 122

vehicle122 <- subset(rawdata_122, Time >= 9061178315 & Time <= 9104929136)

vehicle122$time <- seq.int(nrow(vehicle122))*4
vehicle122 = vehicle122[,-c(1)]
write_tsv(vehicle122,"D:/Mario/Escritorio/Fijaciones/vehicle122.tsv")

ggplot(vehicle122, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle122_fixations <- subset(detect.fixations(vehicle122))

diagnostic.plot(vehicle122, vehicle122_fixations)

diagnostic.plot(vehicle122, vehicle122_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle122 <- calculate.summary(vehicle122_fixations)
round(stats_vehicle122, digits=2)


#Hacer rectangle en 122

rectangle122 <- subset(rawdata_122, Time >= 9170090555 & Time <= 9192272797)

rectangle122$time <- seq.int(nrow(rectangle122))*4
rectangle122 = rectangle122[,-c(1)]
write_tsv(rectangle122,"D:/Mario/Escritorio/Fijaciones/rectangle122.tsv")

ggplot(rectangle122, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle122_fixations <- subset(detect.fixations(rectangle122))

diagnostic.plot(rectangle122, rectangle122_fixations)

diagnostic.plot(rectangle122, rectangle122_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle122 <- calculate.summary(rectangle122_fixations)
round(stats_rectangle122, digits=2)

























