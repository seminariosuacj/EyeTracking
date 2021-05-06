setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_172 <- read_tsv("172_rawdata.tsv", comment = "#")

rawdata_172 <- rename(rawdata_172, trial = Trial)
rawdata_172 <- rename(rawdata_172, x = 'L POR X [px]')
rawdata_172 <- rename(rawdata_172, y = 'L POR Y [px]')

rawdata_172 <- rawdata_172 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 172

vehicle172 <- subset(rawdata_172, Time >= 2265661390 & Time <= 2307184999)

vehicle172$time <- seq.int(nrow(vehicle172))*4
vehicle172 = vehicle172[,-c(1)]
write_tsv(vehicle172,"D:/Mario/Escritorio/Fijaciones/vehicle172.tsv")

ggplot(vehicle172, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle172_fixations <- subset(detect.fixations(vehicle172))

diagnostic.plot(vehicle172, vehicle172_fixations)

diagnostic.plot(vehicle172, vehicle172_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle172 <- calculate.summary(vehicle172_fixations)
round(stats_vehicle172, digits=2)


#Hacer rectangle en 172

rectangle172 <- subset(rawdata_172, Time >= 2338649627 & Time <= 2357424221)

rectangle172$time <- seq.int(nrow(rectangle172))*4
rectangle172 = rectangle172[,-c(1)]
write_tsv(rectangle172,"D:/Mario/Escritorio/Fijaciones/rectangle172.tsv")

ggplot(rectangle172, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle172_fixations <- subset(detect.fixations(rectangle172))

diagnostic.plot(rectangle172, rectangle172_fixations)

diagnostic.plot(rectangle172, rectangle172_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle172 <- calculate.summary(rectangle172_fixations)
round(stats_rectangle172, digits=2)

