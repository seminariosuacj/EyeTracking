library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_182 <- read_tsv("182_rawdata.tsv", comment = "#")

rawdata_182 <- rename(rawdata_182, trial = Trial)
rawdata_182 <- rename(rawdata_182, x = 'L POR X [px]')
rawdata_182 <- rename(rawdata_182, y = 'L POR Y [px]')

rawdata_182 <- rawdata_182 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 182

vehicle182 <- subset(rawdata_182, Time >= 874903983 & Time <= 989707771)

vehicle182$time <- seq.int(nrow(vehicle182))*4
vehicle182 = vehicle182[,-c(1)]
write_tsv(vehicle182,"D:/Mario/Escritorio/Fijaciones/vehicle182.tsv")

ggplot(vehicle182, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle182_fixations <- subset(detect.fixations(vehicle182))

diagnostic.plot(vehicle182, vehicle182_fixations)

diagnostic.plot(vehicle182, vehicle182_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle182 <- calculate.summary(vehicle182_fixations)
round(stats_vehicle182, digits=2)


#Hacer rectangle en 182

rectangle182 <- subset(rawdata_182, Time >= 1006423479 & Time <= 1068091188)

rectangle182$time <- seq.int(nrow(rectangle182))*4
rectangle182 = rectangle182[,-c(1)]
write_tsv(rectangle182,"D:/Mario/Escritorio/Fijaciones/rectangle182.tsv")

ggplot(rectangle182, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle182_fixations <- subset(detect.fixations(rectangle182))

diagnostic.plot(rectangle182, rectangle182_fixations)

diagnostic.plot(rectangle182, rectangle182_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle182 <- calculate.summary(rectangle182_fixations)
round(stats_rectangle182, digits=2)








