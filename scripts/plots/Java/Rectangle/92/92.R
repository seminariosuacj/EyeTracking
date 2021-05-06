setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_92 <- read_tsv("92_rawdata.tsv", comment = "#")

rawdata_92 <- rename(rawdata_92, trial = Trial)
rawdata_92 <- rename(rawdata_92, x = 'L POR X [px]')
rawdata_92 <- rename(rawdata_92, y = 'L POR Y [px]')

rawdata_92 <- rawdata_92 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 92

rectangle92 <- subset(rawdata_92, Time >= 1397004238 & Time <= 1438331208)

rectangle92$time <- seq.int(nrow(rectangle92))*4
rectangle92 = rectangle92[,-c(1)]

write_tsv(rectangle92,"D:/Mario/Escritorio/Fijaciones/rectangle92.tsv")

ggplot(rectangle92, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle92_fixations <- subset(detect.fixations(rectangle92))

diagnostic.plot(rectangle92, rectangle92_fixations)

diagnostic.plot(rectangle92, rectangle92_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle92 <- calculate.summary(rectangle92_fixations)
round(stats_rectangle92, digits=2)

#Hacer vehicle en 92

vehicle92 <- subset(rawdata_92, Time >= 1469483374 & Time <= 1527293016)

vehicle92$time <- seq.int(nrow(vehicle92))*4
vehicle92 = vehicle92[,-c(1)]

write_tsv(vehicle92,"D:/Mario/Escritorio/Fijaciones/vehicle92.tsv")

ggplot(vehicle92, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle92_fixations <- subset(detect.fixations(vehicle92))

diagnostic.plot(vehicle92, vehicle92_fixations)

diagnostic.plot(vehicle92, vehicle92_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle92 <- calculate.summary(vehicle92_fixations)
round(stats_vehicle92, digits=2)
