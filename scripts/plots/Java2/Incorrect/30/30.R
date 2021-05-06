setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_30 <- read_tsv("30_rawdata.tsv", comment = "#")

rawdata_30 <- rename(rawdata_30, trial = Trial)
rawdata_30 <- rename(rawdata_30, x = 'L POR X [px]')
rawdata_30 <- rename(rawdata_30, y = 'L POR Y [px]')

rawdata_30 <- rawdata_30 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 30

vehicle30 <- subset(rawdata_30, Time >= 532555296 & Time <= 572547918)

vehicle30$time <- seq.int(nrow(vehicle30))*4
vehicle30 = vehicle30[,-c(1)]
write_tsv(vehicle30,"D:/Mario/Escritorio/Fijaciones/vehicle30.tsv")

ggplot(vehicle30, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle30_fixations <- subset(detect.fixations(vehicle30))

diagnostic.plot(vehicle30, vehicle30_fixations)

diagnostic.plot(vehicle30, vehicle30_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle30 <- calculate.summary(vehicle30_fixations)
round(stats_vehicle30, digits=2)


#Hacer rectangle en 30

rectangle30 <- subset(rawdata_30, Time >= 653645008 & Time <= 690421958)

rectangle30$time <- seq.int(nrow(rectangle30))*4
rectangle30 = rectangle30[,-c(1)]
write_tsv(rectangle30,"D:/Mario/Escritorio/Fijaciones/rectangle30.tsv")

ggplot(rectangle30, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle30_fixations <- subset(detect.fixations(rectangle30))

diagnostic.plot(rectangle30, rectangle30_fixations)

diagnostic.plot(rectangle30, rectangle30_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle30 <- calculate.summary(rectangle30_fixations)
round(stats_rectangle30, digits=2)

