library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_186 <- read_tsv("186_rawdata.tsv", comment = "#")

rawdata_186 <- rename(rawdata_186, trial = Trial)
rawdata_186 <- rename(rawdata_186, x = 'L POR X [px]')
rawdata_186 <- rename(rawdata_186, y = 'L POR Y [px]')

rawdata_186 <- rawdata_186 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 186

rectangle186 <- subset(rawdata_186, Time >= 389619747 & Time <= 453487475)

rectangle186$time <- seq.int(nrow(rectangle186))*4
rectangle186 = rectangle186[,-c(1)]
write_tsv(rectangle186,"D:/Mario/Escritorio/Fijaciones/rectangle186.tsv")

ggplot(rectangle186, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle186_fixations <- subset(detect.fixations(rectangle186))

diagnostic.plot(rectangle186, rectangle186_fixations)

diagnostic.plot(rectangle186, rectangle186_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle186 <- calculate.summary(rectangle186_fixations)
round(stats_rectangle186, digits=2)

#Hacer vehicle en 186

vehicle186 <- subset(rawdata_186, Time >= 500984491 & Time <= 577839435)

vehicle186$time <- seq.int(nrow(vehicle186))*4
vehicle186 = vehicle186[,-c(1)]
write_tsv(vehicle186,"D:/Mario/Escritorio/Fijaciones/vehicle186.tsv")

ggplot(vehicle186, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle186_fixations <- subset(detect.fixations(vehicle186))

diagnostic.plot(vehicle186, vehicle186_fixations)

diagnostic.plot(vehicle186, vehicle186_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle186 <- calculate.summary(vehicle186_fixations)
round(stats_vehicle186, digits=2)






