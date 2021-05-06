setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_118 <- read_tsv("118_rawdata.tsv", comment = "#")

rawdata_118 <- rename(rawdata_118, trial = Trial)
rawdata_118 <- rename(rawdata_118, x = 'L POR X [px]')
rawdata_118 <- rename(rawdata_118, y = 'L POR Y [px]')

rawdata_118 <- rawdata_118 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 118

rectangle118 <- subset(rawdata_118, Time >= 7527215114 & Time <= 7589226731)

rectangle118$time <- seq.int(nrow(rectangle118))*4
rectangle118 = rectangle118[,-c(1)]

write_tsv(rectangle118,"D:/Mario/Escritorio/Fijaciones/rectangle118.tsv")

ggplot(rectangle118, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle118_fixations <- subset(detect.fixations(rectangle118))

diagnostic.plot(rectangle118, rectangle118_fixations)

diagnostic.plot(rectangle118, rectangle118_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle118 <- calculate.summary(rectangle118_fixations)
round(stats_rectangle118, digits=2)

#Hacer vehicle en 118

vehicle118 <- subset(rawdata_118, Time >= 7605217727 & Time <= 7639023352)

vehicle118$time <- seq.int(nrow(vehicle118))*4
vehicle118 = vehicle118[,-c(1)]

write_tsv(vehicle118,"D:/Mario/Escritorio/Fijaciones/vehicle118.tsv")

ggplot(vehicle118, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle118_fixations <- subset(detect.fixations(vehicle118))

diagnostic.plot(vehicle118, vehicle118_fixations)

diagnostic.plot(vehicle118, vehicle118_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle118 <- calculate.summary(vehicle118_fixations)
round(stats_vehicle118, digits=2)
