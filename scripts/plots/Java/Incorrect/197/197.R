setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_197 <- read_tsv("197_rawdata.tsv", comment = "#")

rawdata_197 <- rename(rawdata_197, trial = Trial)
rawdata_197 <- rename(rawdata_197, x = 'L POR X [px]')
rawdata_197 <- rename(rawdata_197, y = 'L POR Y [px]')

rawdata_197 <- rawdata_197 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 197

vehicle197 <- subset(rawdata_197, Time >= 13005490453 & Time <= 13077304359)

vehicle197$time <- seq.int(nrow(vehicle197))*4
vehicle197 = vehicle197[,-c(1)]

write_tsv(vehicle197,"D:/Mario/Escritorio/Fijaciones/vehicle197.tsv")

ggplot(vehicle197, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle197_fixations <- subset(detect.fixations(vehicle197))

diagnostic.plot(vehicle197, vehicle197_fixations)

diagnostic.plot(vehicle197, vehicle197_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle197 <- calculate.summary(vehicle197_fixations)
round(stats_vehicle197, digits=2)

#Hacer rectangle en 197

rectangle197 <- subset(rawdata_197, Time >= 13088147336 & Time <= 13128372156)

rectangle197$time <- seq.int(nrow(rectangle197))*4
rectangle197 = rectangle197[,-c(1)]

write_tsv(rectangle197,"D:/Mario/Escritorio/Fijaciones/rectangle197.tsv")

ggplot(rectangle197, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle197_fixations <- subset(detect.fixations(rectangle197))

diagnostic.plot(rectangle197, rectangle197_fixations)

diagnostic.plot(rectangle197, rectangle197_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle197 <- calculate.summary(rectangle197_fixations)
round(stats_rectangle197, digits=2)

