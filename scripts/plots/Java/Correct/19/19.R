library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_19 <- read_tsv("19_rawdata.tsv", comment = "#")

rawdata_19 <- rename(rawdata_19, trial = Trial)
rawdata_19 <- rename(rawdata_19, x = 'L POR X [px]')
rawdata_19 <- rename(rawdata_19, y = 'L POR Y [px]')

rawdata_19 <- rawdata_19 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 19

rectangle19 <- subset(rawdata_19, Time >= 2844214412 & Time <= 2876619608)


rectangle19$time <- seq.int(nrow(rectangle19))*4
rectangle19 = rectangle19[,-c(1)]

write_tsv(rectangle19,"D:/Mario/Escritorio/Fijaciones/rectangle19.tsv")

ggplot(rectangle19, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle19_fixations <- subset(detect.fixations(rectangle19))

rectangle19_fixations_save <- subset(detect.fixations(rectangle19), event=="fixation")

diagnostic.plot(rectangle19, rectangle19_fixations)

diagnostic.plot(rectangle19, rectangle19_fixations, start.time=4, duration=2000, interactive=FALSE, ylim=c(0,1000))

diagnostic.plot(rectangle19, rectangle19_fixations, start.time=304, duration=400, interactive=FALSE, ylim=c(0,1000))


stats_rectangle19 <- calculate.summary(rectangle19_fixations)
round(stats_rectangle19, digits=2)

#Hacer vehicle en 19

vehicle19 <- subset(rawdata_19, Time >= 2887162904 & Time <= 2926079882)

vehicle19$time <- seq.int(nrow(vehicle19))*4

vehicle19 = vehicle19[,-c(1)]

write_tsv(vehicle19,"D:/Mario/Escritorio/Fijaciones/vehicle19.tsv")

ggplot(vehicle19, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle19_fixations <- subset(detect.fixations(vehicle19))

diagnostic.plot(vehicle19, vehicle19_fixations)

diagnostic.plot(vehicle19, vehicle19_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle19 <- calculate.summary(vehicle19_fixations)
round(stats_vehicle19, digits=2)




