setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_123 <- read_tsv("123_rawdata.tsv", comment = "#")

rawdata_123 <- rename(rawdata_123, trial = Trial)
rawdata_123 <- rename(rawdata_123, x = 'L POR X [px]')
rawdata_123 <- rename(rawdata_123, y = 'L POR Y [px]')

rawdata_123 <- rawdata_123 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 123

rectangle123 <- subset(rawdata_123, Time >= 1842474019 & Time <= 1882497336)

rectangle123$time <- seq.int(nrow(rectangle123))*4
rectangle123 = rectangle123[,-c(1)]

write_tsv(rectangle123,"D:/Mario/Escritorio/Fijaciones/rectangle123.tsv")

ggplot(rectangle123, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle123_fixations <- subset(detect.fixations(rectangle123))

diagnostic.plot(rectangle123, rectangle123_fixations)

diagnostic.plot(rectangle123, rectangle123_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle123 <- calculate.summary(rectangle123_fixations)
round(stats_rectangle123, digits=2)

#Hacer vehicle en 123

vehicle123 <- subset(rawdata_123, Time >= 1920926888 & Time <= 1952520624)

vehicle123$time <- seq.int(nrow(vehicle123))*4
vehicle123 = vehicle123[,-c(1)]

write_tsv(vehicle123,"D:/Mario/Escritorio/Fijaciones/vehicle123.tsv")

ggplot(vehicle123, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle123_fixations <- subset(detect.fixations(vehicle123))

diagnostic.plot(vehicle123, vehicle123_fixations)

diagnostic.plot(vehicle123, vehicle123_fixations, start.time=4, duration=00, interactive=FALSE, ylim=c(0,1000))

stats_vehicle123 <- calculate.summary(vehicle123_fixations)
round(stats_vehicle123, digits=2)
