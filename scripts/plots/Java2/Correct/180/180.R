setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_180 <- read_tsv("180_rawdata.tsv", comment = "#")

rawdata_180 <- rename(rawdata_180, trial = Trial)
rawdata_180 <- rename(rawdata_180, x = 'L POR X [px]')
rawdata_180 <- rename(rawdata_180, y = 'L POR Y [px]')

rawdata_180 <- rawdata_180 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 180

vehicle180 <- subset(rawdata_180, Time >= 5019519217 & Time <= 5059364402)

vehicle180$time <- seq.int(nrow(vehicle180))*4
vehicle180 = vehicle180[,-c(1)]
write_tsv(vehicle180,"D:/Mario/Escritorio/Fijaciones/vehicle180.tsv")

ggplot(vehicle180, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle180_fixations <- subset(detect.fixations(vehicle180))

diagnostic.plot(vehicle180, vehicle180_fixations)

diagnostic.plot(vehicle180, vehicle180_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle180 <- calculate.summary(vehicle180_fixations)
round(stats_vehicle180, digits=2)

#Hacer rectangle en 180

rectangle180 <- subset(rawdata_180, Time >= 5079751061 & Time <= 5113428695)

rectangle180$time <- seq.int(nrow(rectangle180))*4
rectangle180 = rectangle180[,-c(1)]
write_tsv(rectangle180,"D:/Mario/Escritorio/Fijaciones/rectangle180.tsv")

ggplot(rectangle180, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle180_fixations <- subset(detect.fixations(rectangle180))

diagnostic.plot(rectangle180, rectangle180_fixations)

diagnostic.plot(rectangle180, rectangle180_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle180 <- calculate.summary(rectangle180_fixations)
round(stats_rectangle180, digits=2)
