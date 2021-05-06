library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_96 <- read_tsv("96_rawdata.tsv", comment = "#")

rawdata_96 <- rename(rawdata_96, trial = Trial)
rawdata_96 <- rename(rawdata_96, x = 'L POR X [px]')
rawdata_96 <- rename(rawdata_96, y = 'L POR Y [px]')

rawdata_96 <- rawdata_96 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 96

vehicle96 <- subset(rawdata_96, Time >= 12282996355 & Time <= 12342580318)

vehicle96$time <- seq.int(nrow(vehicle96))*4
vehicle96 = vehicle96[,-c(1)]
write_tsv(vehicle96,"D:/Mario/Escritorio/Fijaciones/vehicle96.tsv")

ggplot(vehicle96, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle96_fixations <- subset(detect.fixations(vehicle96))

diagnostic.plot(vehicle96, vehicle96_fixations)

diagnostic.plot(vehicle96, vehicle96_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle96 <- calculate.summary(vehicle96_fixations)
round(stats_vehicle96, digits=2)

#Hacer rectangle en 96

rectangle96 <- subset(rawdata_96, Time >= 12358947185 & Time <= 12417040056)

rectangle96$time <- seq.int(nrow(rectangle96))*4
rectangle96 = rectangle96[,-c(1)]
write_tsv(rectangle96,"D:/Mario/Escritorio/Fijaciones/rectangle96.tsv")

ggplot(rectangle96, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle96_fixations <- subset(detect.fixations(rectangle96))

diagnostic.plot(rectangle96, rectangle96_fixations)

diagnostic.plot(rectangle96, rectangle96_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle96 <- calculate.summary(rectangle96_fixations)
round(stats_rectangle96, digits=2)
















