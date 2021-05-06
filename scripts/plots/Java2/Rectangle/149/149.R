library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_149 <- read_tsv("149_rawdata.tsv", comment = "#")

rawdata_149 <- rename(rawdata_149, trial = Trial)
rawdata_149 <- rename(rawdata_149, x = 'L POR X [px]')
rawdata_149 <- rename(rawdata_149, y = 'L POR Y [px]')

rawdata_149 <- rawdata_149 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 149

vehicle149 <- subset(rawdata_149, Time >= 16607324442 & Time <= 16637718316)

vehicle149$time <- seq.int(nrow(vehicle149))*4
vehicle149 = vehicle149[,-c(1)]
write_tsv(vehicle149,"D:/Mario/Escritorio/Fijaciones/vehicle149.tsv")

ggplot(vehicle149, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle149_fixations <- subset(detect.fixations(vehicle149))

diagnostic.plot(vehicle149, vehicle149_fixations)

diagnostic.plot(vehicle149, vehicle149_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle149 <- calculate.summary(vehicle149_fixations)
round(stats_vehicle149, digits=2)

#Hacer rectangle en 149

rectangle149 <- subset(rawdata_149, Time >= 16653792081 & Time <= 16673117046)

rectangle149$time <- seq.int(nrow(rectangle149))*4
rectangle149 = rectangle149[,-c(1)]
write_tsv(rectangle149,"D:/Mario/Escritorio/Fijaciones/rectangle149.tsv")

ggplot(rectangle149, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle149_fixations <- subset(detect.fixations(rectangle149))

diagnostic.plot(rectangle149, rectangle149_fixations)

diagnostic.plot(rectangle149, rectangle149_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle149 <- calculate.summary(rectangle149_fixations)
round(stats_rectangle149, digits=2)











































