setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_193 <- read_tsv("193_rawdata.tsv", comment = "#")

rawdata_193 <- rename(rawdata_193, trial = Trial)
rawdata_193 <- rename(rawdata_193, x = 'L POR X [px]')
rawdata_193 <- rename(rawdata_193, y = 'L POR Y [px]')

rawdata_193 <- rawdata_193 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 193

rectangle193 <- subset(rawdata_193, Time >= 3789843778 & Time <= 3834947244)

rectangle193$time <- seq.int(nrow(rectangle193))*4
rectangle193 = rectangle193[,-c(1)]
write_tsv(rectangle193,"D:/Mario/Escritorio/Fijaciones/rectangle193.tsv")

ggplot(rectangle193, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle193_fixations <- subset(detect.fixations(rectangle193))

diagnostic.plot(rectangle193, rectangle193_fixations)

diagnostic.plot(rectangle193, rectangle193_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle193 <- calculate.summary(rectangle193_fixations)
round(stats_rectangle193, digits=2)

#Hacer vehicle en 193

vehicle193 <- subset(rawdata_193, Time >= 3887783647 & Time <= 3928484920)

vehicle193$time <- seq.int(nrow(vehicle193))*4
vehicle193 = vehicle193[,-c(1)]
write_tsv(vehicle193,"D:/Mario/Escritorio/Fijaciones/vehicle193.tsv")

ggplot(vehicle193, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle193_fixations <- subset(detect.fixations(vehicle193))

diagnostic.plot(vehicle193, vehicle193_fixations)

diagnostic.plot(vehicle193, vehicle193_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle193 <- calculate.summary(vehicle193_fixations)
round(stats_vehicle193, digits=2)
