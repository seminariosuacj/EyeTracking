setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_132 <- read_tsv("132_rawdata.tsv", comment = "#")

rawdata_132 <- rename(rawdata_132, trial = Trial)
rawdata_132 <- rename(rawdata_132, x = 'L POR X [px]')
rawdata_132 <- rename(rawdata_132, y = 'L POR Y [px]')

rawdata_132 <- rawdata_132 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 132

rectangle132 <- subset(rawdata_132, Time >= 14617747116 & Time <= 14724192073)

rectangle132$time <- seq.int(nrow(rectangle132))*4
rectangle132 = rectangle132[,-c(1)]
write_tsv(rectangle132,"D:/Mario/Escritorio/Fijaciones/rectangle132.tsv")

ggplot(rectangle132, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle132_fixations <- subset(detect.fixations(rectangle132))

diagnostic.plot(rectangle132, rectangle132_fixations)

diagnostic.plot(rectangle132, rectangle132_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle132 <- calculate.summary(rectangle132_fixations)
round(stats_rectangle132, digits=2)

#Hacer vehicle en 132

vehicle132 <- subset(rawdata_132, Time >= 14763952613 & Time <= 14841267219)

vehicle132$time <- seq.int(nrow(vehicle132))*4
vehicle132 = vehicle132[,-c(1)]
write_tsv(vehicle132,"D:/Mario/Escritorio/Fijaciones/vehicle132.tsv")

ggplot(vehicle132, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle132_fixations <- subset(detect.fixations(vehicle132))

diagnostic.plot(vehicle132, vehicle132_fixations)

diagnostic.plot(vehicle132, vehicle132_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle132 <- calculate.summary(vehicle132_fixations)
round(stats_vehicle132, digits=2)
