setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_195 <- read_tsv("195_rawdata.tsv", comment = "#")

rawdata_195 <- rename(rawdata_195, trial = Trial)
rawdata_195 <- rename(rawdata_195, x = 'L POR X [px]')
rawdata_195 <- rename(rawdata_195, y = 'L POR Y [px]')

rawdata_195 <- rawdata_195 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 195

vehicle195 <- subset(rawdata_195, Time >= 610282307 & Time <= 659902866)

vehicle195$time <- seq.int(nrow(vehicle195))*4
vehicle195 = vehicle195[,-c(1)]

write_tsv(vehicle195,"D:/Mario/Escritorio/Fijaciones/vehicle195.tsv")

ggplot(vehicle195, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle195_fixations <- subset(detect.fixations(vehicle195))

diagnostic.plot(vehicle195, vehicle195_fixations)

diagnostic.plot(vehicle195, vehicle195_fixations, start.time=4, duration=100000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle195 <- calculate.summary(vehicle195_fixations)
round(stats_vehicle195, digits=2)

#Hacer rectangle en 195

rectangle195 <- subset(rawdata_195, Time >= 679901935 & Time <= 757292016)

rectangle195$time <- seq.int(nrow(rectangle195))*4
rectangle195 = rectangle195[,-c(1)]

write_tsv(rectangle195,"D:/Mario/Escritorio/Fijaciones/rectangle195.tsv")


ggplot(rectangle195, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle195_fixations <- subset(detect.fixations(rectangle195))

diagnostic.plot(rectangle195, rectangle195_fixations)

diagnostic.plot(rectangle195, rectangle195_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle195 <- calculate.summary(rectangle195_fixations)
round(stats_rectangle195, digits=2)

