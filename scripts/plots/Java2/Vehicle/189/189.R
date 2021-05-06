library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_189 <- read_tsv("189_rawdata.tsv", comment = "#")

rawdata_189 <- rename(rawdata_189, trial = Trial)
rawdata_189 <- rename(rawdata_189, x = 'L POR X [px]')
rawdata_189 <- rename(rawdata_189, y = 'L POR Y [px]')

rawdata_189 <- rawdata_189 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 189

vehicle189 <- subset(rawdata_189, Time >= 9841618137 & Time <= 9870716203)

vehicle189$time <- seq.int(nrow(vehicle189))*4
vehicle189 = vehicle189[,-c(1)]
write_tsv(vehicle189,"D:/Mario/Escritorio/Fijaciones/vehicle189.tsv")

ggplot(vehicle189, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle189_fixations <- subset(detect.fixations(vehicle189))

diagnostic.plot(vehicle189, vehicle189_fixations)

diagnostic.plot(vehicle189, vehicle189_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle189 <- calculate.summary(vehicle189_fixations)
round(stats_vehicle189, digits=2)

#Hacer rectangle en 189

rectangle189 <- subset(rawdata_189, Time >= 9899530319 & Time <= 9939403458)

rectangle189$time <- seq.int(nrow(rectangle189))*4
rectangle189 = rectangle189[,-c(1)]
write_tsv(rectangle189,"D:/Mario/Escritorio/Fijaciones/rectangle189.tsv")

ggplot(rectangle189, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle189_fixations <- subset(detect.fixations(rectangle189))

diagnostic.plot(rectangle189, rectangle189_fixations)

diagnostic.plot(rectangle189, rectangle189_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle189 <- calculate.summary(rectangle189_fixations)
round(stats_rectangle189, digits=2)











