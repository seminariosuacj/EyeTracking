library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_151 <- read_tsv("151_rawdata.tsv", comment = "#")

rawdata_151 <- rename(rawdata_151, trial = Trial)
rawdata_151 <- rename(rawdata_151, x = 'L POR X [px]')
rawdata_151 <- rename(rawdata_151, y = 'L POR Y [px]')

rawdata_151 <- rawdata_151 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 151

rectangle151 <- subset(rawdata_151, Time >= 1337912622 & Time <= 1450759298)

rectangle151$time <- seq.int(nrow(rectangle151))*4
rectangle151 = rectangle151[,-c(1)]
write_tsv(rectangle151,"D:/Mario/Escritorio/Fijaciones/rectangle151.tsv")

ggplot(rectangle151, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle151_fixations <- subset(detect.fixations(rectangle151))

diagnostic.plot(rectangle151, rectangle151_fixations)

diagnostic.plot(rectangle151, rectangle151_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle151 <- calculate.summary(rectangle151_fixations)
round(stats_rectangle151, digits=2)


#Hacer vehicle en 151

vehicle151 <- subset(rawdata_151, Time >= 1518350332 & Time <= 1695915296)

vehicle151$time <- seq.int(nrow(vehicle151))*4
vehicle151 = vehicle151[,-c(1)]
write_tsv(vehicle151,"D:/Mario/Escritorio/Fijaciones/vehicle151.tsv")

ggplot(vehicle151, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle151_fixations <- subset(detect.fixations(vehicle151))

diagnostic.plot(vehicle151, vehicle151_fixations)

diagnostic.plot(vehicle151, vehicle151_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle151 <- calculate.summary(vehicle151_fixations)
round(stats_vehicle151, digits=2)
















