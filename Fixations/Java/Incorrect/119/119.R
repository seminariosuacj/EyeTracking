rawdata_119 <- read_tsv("119_rawdata.tsv", comment = "#")

rawdata_119 <- rename(rawdata_119, time = Time)
rawdata_119 <- rename(rawdata_119, trial = Trial)
rawdata_119 <- rename(rawdata_119, x = 'L POR X [px]')
rawdata_119 <- rename(rawdata_119, y = 'L POR Y [px]')

rawdata_119 = rawdata_119[,-c(2)]

rawdata_119 = rawdata_119[,-c(3:20)]

rawdata_119 = rawdata_119[,-c(5:26)]

#Hacer rectangle en 119

rectangle119 <- subset(rawdata_119, time >= 22554850305 & time <= 22578304258)

ggplot(rectangle119, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +  
  expand_limits(x = 1920, y = 1080)

rectangle119_fixations <- subset(detect.fixations(rectangle119))

diagnostic.plot(rectangle119, rectangle119_fixations)

diagnostic.plot(rectangle119, rectangle119_fixations, start.time=22554850305, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle119 <- calculate.summary(rectangle119_fixations)
round(stats_rectangle119, digits=2)

#Hacer vehicle en 119

vehicle119 <- subset(rawdata_119, time >= 22589667339 & time <= 22609389475)

ggplot(vehicle119, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle119_fixations <- subset(detect.fixations(vehicle119))

diagnostic.plot(vehicle119, vehicle119_fixations)

diagnostic.plot(vehicle119, vehicle119_fixations, start.time=22589667339, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle119 <- calculate.summary(vehicle119_fixations)
round(stats_vehicle119, digits=2)
