library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_4 <- read_tsv("4_rawdata.tsv", comment = "#")

rawdata_4 <- rename(rawdata_4, trial = Trial)
rawdata_4 <- rename(rawdata_4, x = 'L POR X [px]')
rawdata_4 <- rename(rawdata_4, y = 'L POR Y [px]')

rawdata_4 <- rawdata_4 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 4

rectangle4 <- subset(rawdata_4, Time >= 278785840 & Time <= 330438185)

rectangle4$time <- seq.int(nrow(rectangle4))*4
rectangle4 = rectangle4[,-c(1)]
write_tsv(rectangle4,"D:/Mario/Escritorio/Fijaciones/rectangle4.tsv")

ggplot(rectangle4, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle4_fixations <- subset(detect.fixations(rectangle4))

diagnostic.plot(rectangle4, rectangle4_fixations)

diagnostic.plot(rectangle4, rectangle4_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle4 <- calculate.summary(rectangle4_fixations)
round(stats_rectangle4, digits=2)

#Hacer vehicle en 4

vehicle4 <- subset(rawdata_4, Time >= 364483697 & Time <= 422271672)

vehicle4$time <- seq.int(nrow(vehicle4))*4
vehicle4 = vehicle4[,-c(1)]
write_tsv(vehicle4,"D:/Mario/Escritorio/Fijaciones/vehicle4.tsv")

ggplot(vehicle4, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle4_fixations <- subset(detect.fixations(vehicle4))

diagnostic.plot(vehicle4, vehicle4_fixations)

diagnostic.plot(vehicle4, vehicle4_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle4 <- calculate.summary(vehicle4_fixations)
round(stats_vehicle4, digits=2)




