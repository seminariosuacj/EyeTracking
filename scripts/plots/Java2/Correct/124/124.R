library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_124 <- read_tsv("124_rawdata.tsv", comment = "#")

rawdata_124 <- rename(rawdata_124, trial = Trial)
rawdata_124 <- rename(rawdata_124, x = 'L POR X [px]')
rawdata_124 <- rename(rawdata_124, y = 'L POR Y [px]')

rawdata_124 <- rawdata_124 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 124

vehicle124 <- subset(rawdata_124, Time >= 251559548 & Time <= 337737353)

vehicle124$time <- seq.int(nrow(vehicle124))*4
vehicle124 = vehicle124[,-c(1)]
write_tsv(vehicle124,"D:/Mario/Escritorio/Fijaciones/vehicle124.tsv")

ggplot(vehicle124, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle124_fixations <- subset(detect.fixations(vehicle124))

diagnostic.plot(vehicle124, vehicle124_fixations)

diagnostic.plot(vehicle124, vehicle124_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle124 <- calculate.summary(vehicle124_fixations)
round(stats_vehicle124, digits=2)

#Hacer rectangle en 124

rectangle124 <- subset(rawdata_124, Time >= 345948695 & Time <= 446866346)

rectangle124$time <- seq.int(nrow(rectangle124))*4
rectangle124 = rectangle124[,-c(1)]
write_tsv(rectangle124,"D:/Mario/Escritorio/Fijaciones/rectangle124.tsv")

ggplot(rectangle124, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle124_fixations <- subset(detect.fixations(rectangle124))

diagnostic.plot(rectangle124, rectangle124_fixations)

diagnostic.plot(rectangle124, rectangle124_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle124 <- calculate.summary(rectangle124_fixations)
round(stats_rectangle124, digits=2)

