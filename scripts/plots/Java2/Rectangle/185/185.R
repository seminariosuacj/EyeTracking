library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_185 <- read_tsv("185_rawdata.tsv", comment = "#")

rawdata_185 <- rename(rawdata_185, trial = Trial)
rawdata_185 <- rename(rawdata_185, x = 'L POR X [px]')
rawdata_185 <- rename(rawdata_185, y = 'L POR Y [px]')

rawdata_185 <- rawdata_185 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 185

rectangle185 <- subset(rawdata_185, Time >= 3274016299 & Time <= 3299302512)

rectangle185$time <- seq.int(nrow(rectangle185))*4
rectangle185 = rectangle185[,-c(1)]
write_tsv(rectangle185,"D:/Mario/Escritorio/Fijaciones/rectangle185.tsv")

ggplot(rectangle185, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle185_fixations <- subset(detect.fixations(rectangle185))

diagnostic.plot(rectangle185, rectangle185_fixations)

diagnostic.plot(rectangle185, rectangle185_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle185 <- calculate.summary(rectangle185_fixations)
round(stats_rectangle185, digits=2)

#Hacer vehicle en 185

vehicle185 <- subset(rawdata_185, Time >= 3325501040 & Time <= 3357134625)

vehicle185$time <- seq.int(nrow(vehicle185))*4
vehicle185 = vehicle185[,-c(1)]
write_tsv(vehicle185,"D:/Mario/Escritorio/Fijaciones/vehicle185.tsv")

ggplot(vehicle185, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle185_fixations <- subset(detect.fixations(vehicle185))

diagnostic.plot(vehicle185, vehicle185_fixations)

diagnostic.plot(vehicle185, vehicle185_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle185 <- calculate.summary(vehicle185_fixations)
round(stats_vehicle185, digits=2)






