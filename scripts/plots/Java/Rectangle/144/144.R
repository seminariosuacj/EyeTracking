setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_144 <- read_tsv("144_rawdata.tsv", comment = "#")

rawdata_144 <- rename(rawdata_144, trial = Trial)
rawdata_144 <- rename(rawdata_144, x = 'L POR X [px]')
rawdata_144 <- rename(rawdata_144, y = 'L POR Y [px]')

rawdata_144 <- rawdata_144 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 144

vehicle144 <- subset(rawdata_144, Time >= 272067253 & Time <= 318715257)

vehicle144$time <- seq.int(nrow(vehicle144))*4
vehicle144 = vehicle144[,-c(1)]

write_tsv(vehicle144,"D:/Mario/Escritorio/Fijaciones/vehicle144.tsv")

ggplot(vehicle144, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle144_fixations <- subset(detect.fixations(vehicle144))

diagnostic.plot(vehicle144, vehicle144_fixations)

diagnostic.plot(vehicle144, vehicle144_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle144 <- calculate.summary(vehicle144_fixations)
round(stats_vehicle144, digits=2)



#Hacer rectangle en 144

rectangle144 <- subset(rawdata_144, Time >= 329526314 & Time <= 362971342)

rectangle144$time <- seq.int(nrow(rectangle144))*4
rectangle144 = rectangle144[,-c(1)]

write_tsv(rectangle144,"D:/Mario/Escritorio/Fijaciones/rectangle144.tsv")

ggplot(rectangle144, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle144_fixations <- subset(detect.fixations(rectangle144))

diagnostic.plot(rectangle144, rectangle144_fixations)

diagnostic.plot(rectangle144, rectangle144_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle144 <- calculate.summary(rectangle144_fixations)
round(stats_rectangle144, digits=2)

