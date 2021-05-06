setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_10 <- read_tsv("10_rawdata.tsv", comment = "#")

rawdata_10 <- rename(rawdata_10, trial = Trial)
rawdata_10 <- rename(rawdata_10, x = 'L POR X [px]')
rawdata_10 <- rename(rawdata_10, y = 'L POR Y [px]')

rawdata_10 <- rawdata_10 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 10

rectangle10 <- subset(rawdata_10, Time >= 2437315789 & Time <= 2469861017)

rectangle10$time <- seq.int(nrow(rectangle10))*4
rectangle10 = rectangle10[,-c(1)]

write_tsv(rectangle10,"D:/Mario/Escritorio/Fijaciones/rectangle10.tsv")

ggplot(rectangle10, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle10_fixations <- subset(detect.fixations(rectangle10))

diagnostic.plot(rectangle10, rectangle10_fixations)

diagnostic.plot(rectangle10, rectangle10_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle10 <- calculate.summary(rectangle10_fixations)
round(stats_rectangle10, digits=2)

#Hacer vehicle10 en 10

vehicle10 <- subset(rawdata_10, Time >= 2494206922 & Time <= 2531467757)

vehicle10$time <- seq.int(nrow(vehicle10))*4
vehicle10 = vehicle10[,-c(1)]

write_tsv(vehicle10,"D:/Mario/Escritorio/Fijaciones/vehicle10.tsv")

ggplot(vehicle10, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle10_fixations <- subset(detect.fixations(vehicle10))

diagnostic.plot(vehicle10, vehicle10_fixations)

diagnostic.plot(vehicle10, vehicle10_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle10 <- calculate.summary(vehicle10_fixations)
round(stats_vehicle10, digits=2)
