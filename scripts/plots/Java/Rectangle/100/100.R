setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_100 <- read_tsv("100_rawdata.tsv", comment = "#")

rawdata_100 <- rename(rawdata_100, trial = Trial)
rawdata_100 <- rename(rawdata_100, x = 'L POR X [px]')
rawdata_100 <- rename(rawdata_100, y = 'L POR Y [px]')

rawdata_100 <- rawdata_100 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 100

rectangle100 <- subset(rawdata_100, Time >= 20611512438 & Time <= 20667929581)

rectangle100$time <- seq.int(nrow(rectangle100))*4
rectangle100 = rectangle100[,-c(1)]

write_tsv(rectangle100,"D:/Mario/Escritorio/Fijaciones/rectangle100.tsv")

ggplot(rectangle100, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle100_fixations <- subset(detect.fixations(rectangle100))

diagnostic.plot(rectangle100, rectangle100_fixations)

diagnostic.plot(rectangle100, rectangle100_fixations, start.time=4, duration=100000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle100 <- calculate.summary(rectangle100_fixations)
round(stats_rectangle100, digits=2)

#Hacer vehicle en 100

vehicle100 <- subset(rawdata_100, Time >= 20689383566 & Time <= 20821366297)

vehicle100$time <- seq.int(nrow(vehicle100))*4
vehicle100 = vehicle100[,-c(1)]

write_tsv(vehicle100,"D:/Mario/Escritorio/Fijaciones/vehicle100.tsv")

ggplot(vehicle100, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle100_fixations <- subset(detect.fixations(vehicle100))

diagnostic.plot(vehicle100, vehicle100_fixations)

diagnostic.plot(vehicle100, vehicle100_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle100 <- calculate.summary(vehicle100_fixations)
round(stats_vehicle100, digits=2)
