setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_6 <- read_tsv("6_rawdata.tsv", comment = "#")

rawdata_6 <- rename(rawdata_6, trial = Trial)
rawdata_6 <- rename(rawdata_6, x = 'L POR X [px]')
rawdata_6 <- rename(rawdata_6, y = 'L POR Y [px]')

rawdata_6 <- rawdata_6 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 6

rectangle6 <- subset(rawdata_6, Time >= 2760917166 & Time <= 2800717714)

rectangle6$time <- seq.int(nrow(rectangle6))*4
rectangle6 = rectangle6[,-c(1)]

write_tsv(rectangle6,"D:/Mario/Escritorio/Fijaciones/rectangle6.tsv")

ggplot(rectangle6, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle6_fixations <- subset(detect.fixations(rectangle6))

diagnostic.plot(rectangle6, rectangle6_fixations)

diagnostic.plot(rectangle6, rectangle6_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle6 <- calculate.summary(rectangle6_fixations)
round(stats_rectangle6, digits=2)

#Hacer vehicle6 en 6

vehicle6 <- subset(rawdata_6, Time >= 2830959197 & Time <= 2909764370)

vehicle6$time <- seq.int(nrow(vehicle6))*4
vehicle6 = vehicle6[,-c(1)]

write_tsv(vehicle6,"D:/Mario/Escritorio/Fijaciones/vehicle6.tsv")

ggplot(vehicle6, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle6_fixations <- subset(detect.fixations(vehicle6))

diagnostic.plot(vehicle6, vehicle6_fixations)

diagnostic.plot(vehicle6, vehicle6_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle6 <- calculate.summary(vehicle6_fixations)
round(stats_vehicle6, digits=2)
