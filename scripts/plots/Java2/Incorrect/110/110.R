setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_110 <- read_tsv("110_rawdata.tsv", comment = "#")

rawdata_110 <- rename(rawdata_110, trial = Trial)
rawdata_110 <- rename(rawdata_110, x = 'L POR X [px]')
rawdata_110 <- rename(rawdata_110, y = 'L POR Y [px]')

rawdata_110 <- rawdata_110 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 110

rectangle110 <- subset(rawdata_110, Time >= 2350915256 & Time <= 2382717015)

rectangle110$time <- seq.int(nrow(rectangle110))*4
rectangle110 = rectangle110[,-c(1)]
write_tsv(rectangle110,"D:/Mario/Escritorio/Fijaciones/rectangle110.tsv")

ggplot(rectangle110, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle110_fixations <- subset(detect.fixations(rectangle110))

diagnostic.plot(rectangle110, rectangle110_fixations)

diagnostic.plot(rectangle110, rectangle110_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle110 <- calculate.summary(rectangle110_fixations)
round(stats_rectangle110, digits=2)

#Hacer vehicle en 110

vehicle110 <- subset(rawdata_110, Time >= 2416206515 & Time <= 2441912408)

vehicle110$time <- seq.int(nrow(vehicle110))*4
vehicle110 = vehicle110[,-c(1)]
write_tsv(vehicle110,"D:/Mario/Escritorio/Fijaciones/vehicle110.tsv")

ggplot(vehicle110, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle110_fixations <- subset(detect.fixations(vehicle110))

diagnostic.plot(vehicle110, vehicle110_fixations)

diagnostic.plot(vehicle110, vehicle110_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle110 <- calculate.summary(vehicle110_fixations)
round(stats_vehicle110, digits=2)
