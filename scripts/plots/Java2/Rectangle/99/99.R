library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_99 <- read_tsv("99_rawdata.tsv", comment = "#")

rawdata_99 <- rename(rawdata_99, trial = Trial)
rawdata_99 <- rename(rawdata_99, x = 'L POR X [px]')
rawdata_99 <- rename(rawdata_99, y = 'L POR Y [px]')

rawdata_99 <- rawdata_99 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 99

rectangle99 <- subset(rawdata_99, Time >= 9179742208 & Time <= 9215807711)

rectangle99$time <- seq.int(nrow(rectangle99))*4
rectangle99 = rectangle99[,-c(1)]
write_tsv(rectangle99,"D:/Mario/Escritorio/Fijaciones/rectangle99.tsv")

ggplot(rectangle99, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle99_fixations <- subset(detect.fixations(rectangle99))

diagnostic.plot(rectangle99, rectangle99_fixations)

diagnostic.plot(rectangle99, rectangle99_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle99 <- calculate.summary(rectangle99_fixations)
round(stats_rectangle99, digits=2)


#Hacer vehicle en 99

vehicle99 <- subset(rawdata_99, Time >= 9249677322 & Time <= 9324400178)

vehicle99$time <- seq.int(nrow(vehicle99))*4
vehicle99 = vehicle99[,-c(1)]
write_tsv(vehicle99,"D:/Mario/Escritorio/Fijaciones/vehicle99.tsv")

ggplot(vehicle99, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle99_fixations <- subset(detect.fixations(vehicle99))

diagnostic.plot(vehicle99, vehicle99_fixations)

diagnostic.plot(vehicle99, vehicle99_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle99 <- calculate.summary(vehicle99_fixations)
round(stats_vehicle99, digits=2)


















