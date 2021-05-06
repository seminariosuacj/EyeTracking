library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_201 <- read_tsv("201_rawdata.tsv", comment = "#")

rawdata_201 <- rename(rawdata_201, trial = Trial)
rawdata_201 <- rename(rawdata_201, x = 'L POR X [px]')
rawdata_201 <- rename(rawdata_201, y = 'L POR Y [px]')

rawdata_201 <- rawdata_201 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 201

rectangle201 <- subset(rawdata_201, Time >= 882627876 & Time <= 912768203)

rectangle201$time <- seq.int(nrow(rectangle201))*4
rectangle201 = rectangle201[,-c(1)]
write_tsv(rectangle201,"D:/Mario/Escritorio/Fijaciones/rectangle201.tsv")

ggplot(rectangle201, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle201_fixations <- subset(detect.fixations(rectangle201))

diagnostic.plot(rectangle201, rectangle201_fixations)

diagnostic.plot(rectangle201, rectangle201_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle201 <- calculate.summary(rectangle201_fixations)
round(stats_rectangle201, digits=2)

#Hacer vehicle en 201

vehicle201 <- subset(rawdata_201, Time >= 920855632 & Time <= 944097932)

vehicle201$time <- seq.int(nrow(vehicle201))*4
vehicle201 = vehicle201[,-c(1)]
write_tsv(vehicle201,"D:/Mario/Escritorio/Fijaciones/vehicle201.tsv")

ggplot(vehicle201, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle201_fixations <- subset(detect.fixations(vehicle201))

diagnostic.plot(vehicle201, vehicle201_fixations)

diagnostic.plot(vehicle201, vehicle201_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle201 <- calculate.summary(vehicle201_fixations)
round(stats_vehicle201, digits=2)






