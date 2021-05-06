library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_49 <- read_tsv("49_rawdata.tsv", comment = "#")

rawdata_49 <- rename(rawdata_49, time = Time)
rawdata_49 <- rename(rawdata_49, trial = Trial)
rawdata_49 <- rename(rawdata_49, x = 'L POR X [px]')
rawdata_49 <- rename(rawdata_49, y = 'L POR Y [px]')

rawdata_49 = rawdata_49[,-c(2)]

rawdata_49 = rawdata_49[,-c(3:20)]

rawdata_49 = rawdata_49[,-c(5:26)]



#Hacer rectangle en 49

rectangle49 <- subset(rawdata_49, time >= 209360550 & time <= 248873934)

ggplot(rectangle49, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle49_fixations <- subset(detect.fixations(rectangle49))

diagnostic.plot(rectangle49, rectangle49_fixations)

diagnostic.plot(rectangle49, rectangle49_fixations, start.time=209360550, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle49 <- calculate.summary(rectangle49_fixations)
round(stats_rectangle49, digits=2)



#Hacer vehicle en 49

vehicle49 <- subset(rawdata_49, time >= 276816063 & time <= 322700975)

ggplot(vehicle49, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle49_fixations <- subset(detect.fixations(vehicle49))

diagnostic.plot(vehicle49, vehicle49_fixations)

diagnostic.plot(vehicle49, vehicle49_fixations, start.time=276816063, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle49 <- calculate.summary(vehicle49_fixations)
round(stats_vehicle49, digits=2)


