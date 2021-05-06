library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_187 <- read_tsv("187_rawdata.tsv", comment = "#")

rawdata_187 <- rename(rawdata_187, trial = Trial)
rawdata_187 <- rename(rawdata_187, x = 'L POR X [px]')
rawdata_187 <- rename(rawdata_187, y = 'L POR Y [px]')

rawdata_187 <- rawdata_187 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 187

rectangle187 <- subset(rawdata_187, Time >= 9703348381 & Time <= 9734978036)

rectangle187$time <- seq.int(nrow(rectangle187))*4
rectangle187 = rectangle187[,-c(1)]
write_tsv(rectangle187,"D:/Mario/Escritorio/Fijaciones/rectangle187.tsv")

ggplot(rectangle187, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle187_fixations <- subset(detect.fixations(rectangle187))

diagnostic.plot(rectangle187, rectangle187_fixations)

diagnostic.plot(rectangle187, rectangle187_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle187 <- calculate.summary(rectangle187_fixations)
round(stats_rectangle187, digits=2)

#Hacer vehicle en 187

vehicle187 <- subset(rawdata_187, Time >= 9766473473 & Time <= 9825519793)

vehicle187$time <- seq.int(nrow(vehicle187))*4
vehicle187 = vehicle187[,-c(1)]
write_tsv(vehicle187,"D:/Mario/Escritorio/Fijaciones/vehicle187.tsv")

ggplot(vehicle187, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle187_fixations <- subset(detect.fixations(vehicle187))

diagnostic.plot(vehicle187, vehicle187_fixations)

diagnostic.plot(vehicle187, vehicle187_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle187 <- calculate.summary(vehicle187_fixations)
round(stats_vehicle187, digits=2)






