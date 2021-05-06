library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_43 <- read_tsv("43_rawdata.tsv", comment = "#")

rawdata_43 <- rename(rawdata_43, trial = Trial)
rawdata_43 <- rename(rawdata_43, x = 'L POR X [px]')
rawdata_43 <- rename(rawdata_43, y = 'L POR Y [px]')

rawdata_43 <- rawdata_43 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 43

vehicle43 <- subset(rawdata_43, Time >= 671546557 & Time <= 746124315)

vehicle43$time <- seq.int(nrow(vehicle43))*4
vehicle43 = vehicle43[,-c(1)]
write_tsv(vehicle43,"D:/Mario/Escritorio/Fijaciones/vehicle43.tsv")

ggplot(vehicle43, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle43_fixations <- subset(detect.fixations(vehicle43))

diagnostic.plot(vehicle43, vehicle43_fixations)

diagnostic.plot(vehicle43, vehicle43_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle43 <- calculate.summary(vehicle43_fixations)
round(stats_vehicle43, digits=2)

#Hacer rectangle en 43

rectangle43 <- subset(rawdata_43, Time >= 794448234 & Time <= 829201269)

rectangle43$time <- seq.int(nrow(rectangle43))*4
rectangle43 = rectangle43[,-c(1)]
write_tsv(rectangle43,"D:/Mario/Escritorio/Fijaciones/rectangle43.tsv")

ggplot(rectangle43, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle43_fixations <- subset(detect.fixations(rectangle43))

diagnostic.plot(rectangle43, rectangle43_fixations)

diagnostic.plot(rectangle43, rectangle43_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle43 <- calculate.summary(rectangle43_fixations)
round(stats_rectangle43, digits=2)














