setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_169 <- read_tsv("169_rawdata.tsv", comment = "#")

rawdata_169 <- rename(rawdata_169, trial = Trial)
rawdata_169 <- rename(rawdata_169, x = 'L POR X [px]')
rawdata_169 <- rename(rawdata_169, y = 'L POR Y [px]')

rawdata_169 <- rawdata_169 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 169

vehicle169 <- subset(rawdata_169, Time >= 2190983374 & Time <= 2253907825)

vehicle169$time <- seq.int(nrow(vehicle169))*4
vehicle169 = vehicle169[,-c(1)]

write_tsv(vehicle169,"D:/Mario/Escritorio/Fijaciones/vehicle169.tsv")

ggplot(vehicle169, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle169_fixations <- subset(detect.fixations(vehicle169))

diagnostic.plot(vehicle169, vehicle169_fixations)

diagnostic.plot(vehicle169, vehicle169_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle169 <- calculate.summary(vehicle169_fixations)
round(stats_vehicle169, digits=2)



#Hacer rectangle en 169

rectangle169 <- subset(rawdata_169, Time >= 2272237696 & Time <= 2359681288)

rectangle169$time <- seq.int(nrow(rectangle169))*4
rectangle169 = rectangle169[,-c(1)]

write_tsv(rectangle169,"D:/Mario/Escritorio/Fijaciones/rectangle169.tsv")

ggplot(rectangle169, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle169_fixations <- subset(detect.fixations(rectangle169))

diagnostic.plot(rectangle169, rectangle169_fixations)

diagnostic.plot(rectangle169, rectangle169_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle169 <- calculate.summary(rectangle169_fixations)
round(stats_rectangle169, digits=2)

