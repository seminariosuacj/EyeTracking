setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_168 <- read_tsv("168_rawdata.tsv", comment = "#")

rawdata_168 <- rename(rawdata_168, trial = Trial)
rawdata_168 <- rename(rawdata_168, x = 'L POR X [px]')
rawdata_168 <- rename(rawdata_168, y = 'L POR Y [px]')

rawdata_168 <- rawdata_168 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 168

rectangle168 <- subset(rawdata_168, Time >= 1270630078 & Time <= 1403049349)

rectangle168$time <- seq.int(nrow(rectangle168))*4
rectangle168 = rectangle168[,-c(1)]
write_tsv(rectangle168,"D:/Mario/Escritorio/Fijaciones/rectangle168.tsv")

ggplot(rectangle168, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle168_fixations <- subset(detect.fixations(rectangle168))

diagnostic.plot(rectangle168, rectangle168_fixations)

diagnostic.plot(rectangle168, rectangle168_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle168 <- calculate.summary(rectangle168_fixations)
round(stats_rectangle168, digits=2)

#Hacer vehicle en 168

vehicle168 <- subset(rawdata_168, Time >= 1434527205 & Time <= 1509492692)

vehicle168$time <- seq.int(nrow(vehicle168))*4
vehicle168 = vehicle168[,-c(1)]
write_tsv(vehicle168,"D:/Mario/Escritorio/Fijaciones/vehicle168.tsv")

ggplot(vehicle168, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle168_fixations <- subset(detect.fixations(vehicle168))

diagnostic.plot(vehicle168, vehicle168_fixations)

diagnostic.plot(vehicle168, vehicle168_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle168 <- calculate.summary(vehicle168_fixations)
round(stats_vehicle168, digits=2)
