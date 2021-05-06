setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_98 <- read_tsv("98_rawdata.tsv", comment = "#")

rawdata_98 <- rename(rawdata_98, trial = Trial)
rawdata_98 <- rename(rawdata_98, x = 'L POR X [px]')
rawdata_98 <- rename(rawdata_98, y = 'L POR Y [px]')

rawdata_98 <- rawdata_98 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 98

rectangle98 <- subset(rawdata_98, Time >= 899907738 & Time <= 941488648)

rectangle98$time <- seq.int(nrow(rectangle98))*4
rectangle98 = rectangle98[,-c(1)]

write_tsv(rectangle98,"D:/Mario/Escritorio/Fijaciones/rectangle98.tsv")

ggplot(rectangle98, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle98_fixations <- subset(detect.fixations(rectangle98))

diagnostic.plot(rectangle98, rectangle98_fixations)

diagnostic.plot(rectangle98, rectangle98_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle98 <- calculate.summary(rectangle98_fixations)
round(stats_rectangle98, digits=2)

#Hacer vehicle en 98

vehicle98 <- subset(rawdata_98, Time >= 1000560166 & Time <= 1034496847)

vehicle98$time <- seq.int(nrow(vehicle98))*4
vehicle98 = vehicle98[,-c(1)]

write_tsv(vehicle98,"D:/Mario/Escritorio/Fijaciones/vehicle98.tsv")

ggplot(vehicle98, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle98_fixations <- subset(detect.fixations(vehicle98))

diagnostic.plot(vehicle98, vehicle98_fixations)

diagnostic.plot(vehicle98, vehicle98_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle98 <- calculate.summary(vehicle98_fixations)
round(stats_vehicle98, digits=2)
