library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_184 <- read_tsv("184_rawdata.tsv", comment = "#")

rawdata_184 <- rename(rawdata_184, trial = Trial)
rawdata_184 <- rename(rawdata_184, x = 'L POR X [px]')
rawdata_184 <- rename(rawdata_184, y = 'L POR Y [px]')

rawdata_184 <- rawdata_184 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 184

vehicle184 <- subset(rawdata_184, Time >= 723745636 & Time <= 786365205)

vehicle184$time <- seq.int(nrow(vehicle184))*4
vehicle184 = vehicle184[,-c(1)]
write_tsv(vehicle184,"D:/Mario/Escritorio/Fijaciones/vehicle184.tsv")

ggplot(vehicle184, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle184_fixations <- subset(detect.fixations(vehicle184))

diagnostic.plot(vehicle184, vehicle184_fixations)

diagnostic.plot(vehicle184, vehicle184_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle184 <- calculate.summary(vehicle184_fixations)
round(stats_vehicle184, digits=2)

#Hacer rectangle en 184

rectangle184 <- subset(rawdata_184, Time >= 815618919 & Time <= 881550548)

rectangle184$time <- seq.int(nrow(rectangle184))*4
rectangle184 = rectangle184[,-c(1)]
write_tsv(rectangle184,"D:/Mario/Escritorio/Fijaciones/rectangle184.tsv")

ggplot(rectangle184, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle184_fixations <- subset(detect.fixations(rectangle184))

diagnostic.plot(rectangle184, rectangle184_fixations)

diagnostic.plot(rectangle184, rectangle184_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle184 <- calculate.summary(rectangle184_fixations)
round(stats_rectangle184, digits=2)








