setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_125 <- read_tsv("125_rawdata.tsv", comment = "#")

rawdata_125 <- rename(rawdata_125, trial = Trial)
rawdata_125 <- rename(rawdata_125, x = 'L POR X [px]')
rawdata_125 <- rename(rawdata_125, y = 'L POR Y [px]')

rawdata_125 <- rawdata_125 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 125

rectangle125 <- subset(rawdata_125, Time >= 11867915723 & Time <= 11907612391)

rectangle125$time <- seq.int(nrow(rectangle125))*4
rectangle125 = rectangle125[,-c(1)]

write_tsv(rectangle125,"D:/Mario/Escritorio/Fijaciones/rectangle125.tsv")

ggplot(rectangle125, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle125_fixations <- subset(detect.fixations(rectangle125))

diagnostic.plot(rectangle125, rectangle125_fixations)

diagnostic.plot(rectangle125, rectangle125_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle125 <- calculate.summary(rectangle125_fixations)
round(stats_rectangle125, digits=2)

#Hacer vehicle en 125

vehicle125 <- subset(rawdata_125, Time >= 11943289336 & Time <= 12017763099)

vehicle125$time <- seq.int(nrow(vehicle125))*4
vehicle125 = vehicle125[,-c(1)]

write_tsv(vehicle125,"D:/Mario/Escritorio/Fijaciones/vehicle125.tsv")

ggplot(vehicle125, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle125_fixations <- subset(detect.fixations(vehicle125))

diagnostic.plot(vehicle125, vehicle125_fixations)

diagnostic.plot(vehicle125, vehicle125_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle125 <- calculate.summary(vehicle125_fixations)
round(stats_vehicle125, digits=2)
