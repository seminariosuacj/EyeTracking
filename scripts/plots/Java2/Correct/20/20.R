setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_20 <- read_tsv("20_rawdata.tsv", comment = "#")

rawdata_20 <- rename(rawdata_20, trial = Trial)
rawdata_20 <- rename(rawdata_20, x = 'L POR X [px]')
rawdata_20 <- rename(rawdata_20, y = 'L POR Y [px]')

rawdata_20 <- rawdata_20 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 20

rectangle20 <- subset(rawdata_20, Time >= 1573577432 & Time <= 1620326339)

rectangle20$time <- seq.int(nrow(rectangle20))*4
rectangle20 = rectangle20[,-c(1)]

write_tsv(rectangle20,"D:/Mario/Escritorio/Fijaciones/rectangle20.tsv")

ggplot(rectangle20, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle20_fixations <- subset(detect.fixations(rectangle20))

diagnostic.plot(rectangle20, rectangle20_fixations)

diagnostic.plot(rectangle20, rectangle20_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle20 <- calculate.summary(rectangle20_fixations)
round(stats_rectangle20, digits=2)

#Hacer vehicle en 20

vehicle20 <- subset(rawdata_20, Time >= 1650413014 & Time <= 1720404333)

vehicle20$time <- seq.int(nrow(vehicle20))*4
vehicle20 = vehicle20[,-c(1)]
write_tsv(vehicle20,"D:/Mario/Escritorio/Fijaciones/vehicle20.tsv")

ggplot(vehicle20, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle20_fixations <- subset(detect.fixations(vehicle20))

diagnostic.plot(vehicle20, vehicle20_fixations)

diagnostic.plot(vehicle20, vehicle20_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle20 <- calculate.summary(vehicle20_fixations)
round(stats_vehicle20, digits=2)
