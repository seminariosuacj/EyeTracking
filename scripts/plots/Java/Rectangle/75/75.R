setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_75 <- read_tsv("75_rawdata.tsv", comment = "#")

rawdata_75 <- rename(rawdata_75, trial = Trial)
rawdata_75 <- rename(rawdata_75, x = 'L POR X [px]')
rawdata_75 <- rename(rawdata_75, y = 'L POR Y [px]')

rawdata_75 <- rawdata_75 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 75

vehicle75 <- subset(rawdata_75, Time >= 334897219 & Time <= 423575041)

vehicle75$time <- seq.int(nrow(vehicle75))*4
vehicle75 = vehicle75[,-c(1)]

write_tsv(vehicle75,"D:/Mario/Escritorio/Fijaciones/vehicle75.tsv")

ggplot(vehicle75, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle75_fixations <- subset(detect.fixations(vehicle75))

diagnostic.plot(vehicle75, vehicle75_fixations)

diagnostic.plot(vehicle75, vehicle75_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle75 <- calculate.summary(vehicle75_fixations)
round(stats_vehicle75, digits=2)



#Hacer rectangle en 75

rectangle75 <- subset(rawdata_75, Time >= 496277923 & Time <= 552565977)

rectangle75$time <- seq.int(nrow(rectangle75))*4
rectangle75 = rectangle75[,-c(1)]

write_tsv(rectangle75,"D:/Mario/Escritorio/Fijaciones/rectangle75.tsv")

ggplot(rectangle75, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle75_fixations <- subset(detect.fixations(rectangle75))

diagnostic.plot(rectangle75, rectangle75_fixations)

diagnostic.plot(rectangle75, rectangle75_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle75 <- calculate.summary(rectangle75_fixations)
round(stats_rectangle75, digits=2)

