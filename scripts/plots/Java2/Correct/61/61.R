setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_61 <- read_tsv("61_rawdata.tsv", comment = "#")

rawdata_61 <- rename(rawdata_61, trial = Trial)
rawdata_61 <- rename(rawdata_61, x = 'L POR X [px]')
rawdata_61 <- rename(rawdata_61, y = 'L POR Y [px]')

rawdata_61 <- rawdata_61 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 61

vehicle61 <- subset(rawdata_61, Time >= 757752764 & Time <= 812433070)

vehicle61$time <- seq.int(nrow(vehicle61))*4
vehicle61 = vehicle61[,-c(1)]
write_tsv(vehicle61,"D:/Mario/Escritorio/Fijaciones/vehicle61.tsv")

ggplot(vehicle61, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle61_fixations <- subset(detect.fixations(vehicle61))

diagnostic.plot(vehicle61, vehicle61_fixations)

diagnostic.plot(vehicle61, vehicle61_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle61 <- calculate.summary(vehicle61_fixations)
round(stats_vehicle61, digits=2)

#Hacer en rectangle

rectangle61 <- subset(rawdata_61, Time >= 859736330 & Time <= 941433395)

rectangle61$time <- seq.int(nrow(rectangle61))*4
rectangle61 = rectangle61[,-c(1)]
write_tsv(rectangle61,"D:/Mario/Escritorio/Fijaciones/rectangle61.tsv")

ggplot(rectangle61, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle61_fixations <- subset(detect.fixations(rectangle61))

diagnostic.plot(rectangle61, rectangle61_fixations)

diagnostic.plot(rectangle61, rectangle61_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle61 <- calculate.summary(rectangle61_fixations)
round(stats_rectangle61, digits=2)
