setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_150 <- read_tsv("150_rawdata.tsv", comment = "#")

rawdata_150 <- rename(rawdata_150, trial = Trial)
rawdata_150 <- rename(rawdata_150, x = 'L POR X [px]')
rawdata_150 <- rename(rawdata_150, y = 'L POR Y [px]')

rawdata_150 <- rawdata_150 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 150

rectangle150 <- subset(rawdata_150, Time >= 4014943633 & Time <= 4033659245)

rectangle150$time <- seq.int(nrow(rectangle150))*4
rectangle150 = rectangle150[,-c(1)]

write_tsv(rectangle150,"D:/Mario/Escritorio/Fijaciones/rectangle150.tsv")

ggplot(rectangle150, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle150_fixations <- subset(detect.fixations(rectangle150))

diagnostic.plot(rectangle150, rectangle150_fixations)

diagnostic.plot(rectangle150, rectangle150_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle150 <- calculate.summary(rectangle150_fixations)
round(stats_rectangle150, digits=2)

#Hacer vehicle en 150

vehicle150 <- subset(rawdata_150, Time >= 4064736605 & Time <= 4106616964)

vehicle150$time <- seq.int(nrow(vehicle150))*4
vehicle150 = vehicle150[,-c(1)]

write_tsv(vehicle150,"D:/Mario/Escritorio/Fijaciones/vehicle150.tsv")


ggplot(vehicle150, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle150_fixations <- subset(detect.fixations(vehicle150))

diagnostic.plot(vehicle150, vehicle150_fixations)

diagnostic.plot(vehicle150, vehicle150_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle150 <- calculate.summary(vehicle150_fixations)
round(stats_vehicle150, digits=2)
