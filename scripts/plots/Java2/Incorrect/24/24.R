setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_24 <- read_tsv("24_rawdata.tsv", comment = "#")

rawdata_24 <- rename(rawdata_24, trial = Trial)
rawdata_24 <- rename(rawdata_24, x = 'L POR X [px]')
rawdata_24 <- rename(rawdata_24, y = 'L POR Y [px]')

rawdata_24 <- rawdata_24 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 24

vehicle24 <- subset(rawdata_24, Time >= 2715589688 & Time <= 2771015531)

vehicle24$time <- seq.int(nrow(vehicle24))*4
vehicle24 = vehicle24[,-c(1)]
write_tsv(vehicle24,"D:/Mario/Escritorio/Fijaciones/vehicle24.tsv")

ggplot(vehicle24, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle24_fixations <- subset(detect.fixations(vehicle24))

diagnostic.plot(vehicle24, vehicle24_fixations)

diagnostic.plot(vehicle24, vehicle24_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle24 <- calculate.summary(vehicle24_fixations)
round(stats_vehicle24, digits=2)


#Hacer rectangle en 24

rectangle24 <- subset(rawdata_24, Time >= 2814911657 & Time <= 2859584607)

rectangle24$time <- seq.int(nrow(rectangle24))*4
rectangle24 = rectangle24[,-c(1)]
write_tsv(rectangle24,"D:/Mario/Escritorio/Fijaciones/rectangle24.tsv")

ggplot(rectangle24, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle24_fixations <- subset(detect.fixations(rectangle24))

diagnostic.plot(rectangle24, rectangle24_fixations)

diagnostic.plot(rectangle24, rectangle24_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle24 <- calculate.summary(rectangle24_fixations)
round(stats_rectangle24, digits=2)

