setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_119 <- read_tsv("119_rawdata.tsv", comment = "#")

rawdata_119 <- rename(rawdata_119, trial = Trial)
rawdata_119 <- rename(rawdata_119, x = 'L POR X [px]')
rawdata_119 <- rename(rawdata_119, y = 'L POR Y [px]')

rawdata_119 <- rawdata_119 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 119

rectangle119 <- subset(rawdata_119, Time >= 22554850305 & Time <= 22578304258)

rectangle119$time <- seq.int(nrow(rectangle119))*4
rectangle119 = rectangle119[,-c(1)]

write_tsv(rectangle119,"D:/Mario/Escritorio/Fijaciones/rectangle119.tsv")

ggplot(rectangle119, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +  
  expand_limits(x = 1920, y = 1080)

rectangle119_fixations <- subset(detect.fixations(rectangle119))

diagnostic.plot(rectangle119, rectangle119_fixations)

diagnostic.plot(rectangle119, rectangle119_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle119 <- calculate.summary(rectangle119_fixations)
round(stats_rectangle119, digits=2)

#Hacer vehicle en 119

vehicle119 <- subset(rawdata_119, Time >= 22589667339 & Time <= 22609389475)

vehicle119$time <- seq.int(nrow(vehicle119))*4
vehicle119 = vehicle119[,-c(1)]

write_tsv(vehicle119,"D:/Mario/Escritorio/Fijaciones/vehicle119.tsv")

ggplot(vehicle119, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle119_fixations <- subset(detect.fixations(vehicle119))

diagnostic.plot(vehicle119, vehicle119_fixations)

diagnostic.plot(vehicle119, vehicle119_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle119 <- calculate.summary(vehicle119_fixations)
round(stats_vehicle119, digits=2)
