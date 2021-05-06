library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_165 <- read_tsv("165_rawdata.tsv", comment = "#")

rawdata_165 <- rename(rawdata_165, trial = Trial)
rawdata_165 <- rename(rawdata_165, x = 'L POR X [px]')
rawdata_165 <- rename(rawdata_165, y = 'L POR Y [px]')

rawdata_165 <- rawdata_165 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 165

rectangle165 <- subset(rawdata_165, Time >= 820406301 & Time <= 919093830)

rectangle165$time <- seq.int(nrow(rectangle165))*4
rectangle165 = rectangle165[,-c(1)]
write_tsv(rectangle165,"D:/Mario/Escritorio/Fijaciones/rectangle165.tsv")

ggplot(rectangle165, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle165_fixations <- subset(detect.fixations(rectangle165))

diagnostic.plot(rectangle165, rectangle165_fixations)

diagnostic.plot(rectangle165, rectangle165_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle165 <- calculate.summary(rectangle165_fixations)
round(stats_rectangle165, digits=2)


#Hacer vehicle en 165

vehicle165 <- subset(rawdata_165, Time >= 951743036 & Time <= 1006926358)

vehicle165$time <- seq.int(nrow(vehicle165))*4
vehicle165 = vehicle165[,-c(1)]
write_tsv(vehicle165,"D:/Mario/Escritorio/Fijaciones/vehicle165.tsv")

ggplot(vehicle165, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle165_fixations <- subset(detect.fixations(vehicle165))

diagnostic.plot(vehicle165, vehicle165_fixations)

diagnostic.plot(vehicle165, vehicle165_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle165 <- calculate.summary(vehicle165_fixations)
round(stats_vehicle165, digits=2)

























