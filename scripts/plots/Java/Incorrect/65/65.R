setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_65 <- read_tsv("65_rawdata.tsv", comment = "#")

rawdata_65 <- rename(rawdata_65, trial = Trial)
rawdata_65 <- rename(rawdata_65, x = 'L POR X [px]')
rawdata_65 <- rename(rawdata_65, y = 'L POR Y [px]')

rawdata_65 <- rawdata_65 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 65

rectangle65 <- subset(rawdata_65, Time >= 3957020951 & Time <= 4013827726)

rectangle65$time <- seq.int(nrow(rectangle65))*4
rectangle65 = rectangle65[,-c(1)]

write_tsv(rectangle65,"D:/Mario/Escritorio/Fijaciones/rectangle65.tsv")

ggplot(rectangle65, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle65_fixations <- subset(detect.fixations(rectangle65))

diagnostic.plot(rectangle65, rectangle65_fixations)

diagnostic.plot(rectangle65, rectangle65_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle65 <- calculate.summary(rectangle65_fixations)
round(stats_rectangle65, digits=2)

#Hacer vehicle en 65

vehicle65 <- subset(rawdata_65, Time >= 4036558159 & Time <= 4095070495)

vehicle65$time <- seq.int(nrow(vehicle65))*4
vehicle65 = vehicle65[,-c(1)]

write_tsv(vehicle65,"D:/Mario/Escritorio/Fijaciones/vehicle65.tsv")

ggplot(vehicle65, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle65_fixations <- subset(detect.fixations(vehicle65))

diagnostic.plot(vehicle65, vehicle65_fixations)

diagnostic.plot(vehicle65, vehicle65_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle65 <- calculate.summary(vehicle65_fixations)
round(stats_vehicle65, digits=2)
