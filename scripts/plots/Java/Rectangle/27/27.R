setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_27 <- read_tsv("27_rawdata.tsv", comment = "#")

rawdata_27 <- rename(rawdata_27, trial = Trial)
rawdata_27 <- rename(rawdata_27, x = 'L POR X [px]')
rawdata_27 <- rename(rawdata_27, y = 'L POR Y [px]')

rawdata_27 <- rawdata_27 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 27

vehicle27 <- subset(rawdata_27, Time >= 237191782 & Time <= 262925219)

vehicle27$time <- seq.int(nrow(vehicle27))*4
vehicle27 = vehicle27[,-c(1)]

write_tsv(vehicle27,"D:/Mario/Escritorio/Fijaciones/vehicle27.tsv")

ggplot(vehicle27, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle27_fixations <- subset(detect.fixations(vehicle27))

diagnostic.plot(vehicle27, vehicle27_fixations)

diagnostic.plot(vehicle27, vehicle27_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle27 <- calculate.summary(vehicle27_fixations)
round(stats_vehicle27, digits=2)


#Hacer rectangle en 27

rectangle27 <- subset(rawdata_27, Time >= 285602582 & Time <= 308636672)

rectangle27$time <- seq.int(nrow(rectangle27))*4
rectangle27 = rectangle27[,-c(1)]

write_tsv(rectangle27,"D:/Mario/Escritorio/Fijaciones/rectangle27.tsv")

ggplot(rectangle27, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle27_fixations <- subset(detect.fixations(rectangle27))

diagnostic.plot(rectangle27, rectangle27_fixations)

diagnostic.plot(rectangle27, rectangle27_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle27 <- calculate.summary(rectangle27_fixations)
round(stats_rectangle27, digits=2)

