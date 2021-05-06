library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_142 <- read_tsv("142_rawdata.tsv", comment = "#")

rawdata_142 <- rename(rawdata_142, trial = Trial)
rawdata_142 <- rename(rawdata_142, x = 'L POR X [px]')
rawdata_142 <- rename(rawdata_142, y = 'L POR Y [px]')

rawdata_142 <- rawdata_142 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 142

vehicle142 <- subset(rawdata_142, Time >= 16240600836 & Time <= 16283745697)

vehicle142$time <- seq.int(nrow(vehicle142))*4
vehicle142 = vehicle142[,-c(1)]
write_tsv(vehicle142,"D:/Mario/Escritorio/Fijaciones/vehicle142.tsv")

ggplot(vehicle142, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle142_fixations <- subset(detect.fixations(vehicle142))

diagnostic.plot(vehicle142, vehicle142_fixations)

diagnostic.plot(vehicle142, vehicle142_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle142 <- calculate.summary(vehicle142_fixations)
round(stats_vehicle142, digits=2)


#Hacer rectangle en 142

rectangle142 <- subset(rawdata_142, Time >= 16327494945 & Time <= 16400017864)

rectangle142$time <- seq.int(nrow(rectangle142))*4
rectangle142 = rectangle142[,-c(1)]
write_tsv(rectangle142,"D:/Mario/Escritorio/Fijaciones/rectangle142.tsv")

ggplot(rectangle142, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle142_fixations <- subset(detect.fixations(rectangle142))

diagnostic.plot(rectangle142, rectangle142_fixations)

diagnostic.plot(rectangle142, rectangle142_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle142 <- calculate.summary(rectangle142_fixations)
round(stats_rectangle142, digits=2)





































