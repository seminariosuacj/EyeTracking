setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_94 <- read_tsv("94_rawdata.tsv", comment = "#")

rawdata_94 <- rename(rawdata_94, trial = Trial)
rawdata_94 <- rename(rawdata_94, x = 'L POR X [px]')
rawdata_94 <- rename(rawdata_94, y = 'L POR Y [px]')

rawdata_94 <- rawdata_94 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 94

rectangle94 <- subset(rawdata_94, Time >= 5345858646 & Time <= 5371589178)

rectangle94$time <- seq.int(nrow(rectangle94))*4
rectangle94 = rectangle94[,-c(1)]
write_tsv(rectangle94,"D:/Mario/Escritorio/Fijaciones/rectangle94.tsv")

ggplot(rectangle94, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle94_fixations <- subset(detect.fixations(rectangle94))

diagnostic.plot(rectangle94, rectangle94_fixations)

diagnostic.plot(rectangle94, rectangle94_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle94 <- calculate.summary(rectangle94_fixations)
round(stats_rectangle94, digits=2)

#Hacer vehicle en 94

vehicle94 <- subset(rawdata_94, Time >= 5384217530 & Time <= 5435912843)

vehicle94$time <- seq.int(nrow(vehicle94))*4
vehicle94 = vehicle94[,-c(1)]
write_tsv(vehicle94,"D:/Mario/Escritorio/Fijaciones/vehicle94.tsv")

ggplot(vehicle94, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle94_fixations <- subset(detect.fixations(vehicle94))

diagnostic.plot(vehicle94, vehicle94_fixations)

diagnostic.plot(vehicle94, vehicle94_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle94 <- calculate.summary(vehicle94_fixations)
round(stats_vehicle94, digits=2)
