library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_32 <- read_tsv("32_rawdata.tsv", comment = "#")

rawdata_32 <- rename(rawdata_32, trial = Trial)
rawdata_32 <- rename(rawdata_32, x = 'L POR X [px]')
rawdata_32 <- rename(rawdata_32, y = 'L POR Y [px]')

rawdata_32 <- rawdata_32 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 32

rectangle32 <- subset(rawdata_32, Time >= 904247219 & Time <= 937100960)

rectangle32$time <- seq.int(nrow(rectangle32))*4
rectangle32 = rectangle32[,-c(1)]
write_tsv(rectangle32,"D:/Mario/Escritorio/Fijaciones/rectangle32.tsv")

ggplot(rectangle32, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle32_fixations <- subset(detect.fixations(rectangle32))

diagnostic.plot(rectangle32, rectangle32_fixations)

diagnostic.plot(rectangle32, rectangle32_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle32 <- calculate.summary(rectangle32_fixations)
round(stats_rectangle32, digits=2)

#Hacer vehicle en 32

vehicle32 <- subset(rawdata_32, Time >= 971702629 & Time <= 1017363493)

vehicle32$time <- seq.int(nrow(vehicle32))*4
vehicle32 = vehicle32[,-c(1)]
write_tsv(vehicle32,"D:/Mario/Escritorio/Fijaciones/vehicle32.tsv")

ggplot(vehicle32, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle32_fixations <- subset(detect.fixations(vehicle32))

diagnostic.plot(vehicle32, vehicle32_fixations)

diagnostic.plot(vehicle32, vehicle32_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle32 <- calculate.summary(vehicle32_fixations)
round(stats_vehicle32, digits=2)








