setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_120 <- read_tsv("120_rawdata.tsv", comment = "#")

rawdata_120 <- rename(rawdata_120, trial = Trial)
rawdata_120 <- rename(rawdata_120, x = 'L POR X [px]')
rawdata_120 <- rename(rawdata_120, y = 'L POR Y [px]')

rawdata_120 <- rawdata_120 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 120

rectangle120 <- subset(rawdata_120, Time >= 9949061430 & Time <= 10004440795)

rectangle120$time <- seq.int(nrow(rectangle120))*4
rectangle120 = rectangle120[,-c(1)]

write_tsv(rectangle120,"D:/Mario/Escritorio/Fijaciones/rectangle120.tsv")

ggplot(rectangle120, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle120_fixations <- subset(detect.fixations(rectangle120))

diagnostic.plot(rectangle120, rectangle120_fixations)

diagnostic.plot(rectangle120, rectangle120_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle120 <- calculate.summary(rectangle120_fixations)
round(stats_rectangle120, digits=2)

#Hacer vehicle en 120

vehicle120 <- subset(rawdata_120, Time >= 10025037544 & Time <= 10083928520)

vehicle120$time <- seq.int(nrow(vehicle120))*4
vehicle120 = vehicle120[,-c(1)]

write_tsv(vehicle120,"D:/Mario/Escritorio/Fijaciones/vehicle120.tsv")

ggplot(vehicle120, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle120_fixations <- subset(detect.fixations(vehicle120))

diagnostic.plot(vehicle120, vehicle120_fixations)

diagnostic.plot(vehicle120, vehicle120_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle120 <- calculate.summary(vehicle120_fixations)
round(stats_vehicle120, digits=2)
