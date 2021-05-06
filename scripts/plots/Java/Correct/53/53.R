library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_53 <- read_tsv("53_rawdata.tsv", comment = "#")

rawdata_53 <- rename(rawdata_53, trial = Trial)
rawdata_53 <- rename(rawdata_53, x = 'L POR X [px]')
rawdata_53 <- rename(rawdata_53, y = 'L POR Y [px]')

rawdata_53 <- rawdata_53 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 53

rectangle53 <- subset(rawdata_53, Time >= 3743384594 & Time <= 3802380166)

rectangle53$time <- seq.int(nrow(rectangle53))*4
rectangle53 = rectangle53[,-c(1)]

write_tsv(rectangle53,"D:/Mario/Escritorio/Fijaciones/rectangle53.tsv")

ggplot(rectangle53, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080) +
    xlab("Eje X") +
    ylab("Eje Y") +
  theme(axis.text=element_text(size=12),
         axis.title=element_text(size=12,face="bold"))

rectangle53_fixations <- subset(detect.fixations(rectangle53))

diagnostic.plot(rectangle53, rectangle53_fixations)

diagnostic.plot(rectangle53, rectangle53_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle53 <- calculate.summary(rectangle53_fixations)
round(stats_rectangle53, digits=2)

#Hacer vehicle en 53

vehicle53 <- subset(rawdata_53, Time >= 3829298356 & Time <= 3886074232)

vehicle53$time <- seq.int(nrow(vehicle53))*4

vehicle53 = vehicle53[,-c(1)]
write_tsv(vehicle53,"D:/Mario/Escritorio/Fijaciones/vehicle53.tsv")

ggplot(vehicle53, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle53_fixations <- subset(detect.fixations(vehicle53))

diagnostic.plot(vehicle53, vehicle53_fixations)

diagnostic.plot(vehicle53, vehicle53_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle53 <- calculate.summary(vehicle53_fixations)
round(stats_vehicle53, digits=2)
