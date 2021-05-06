setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_80 <- read_tsv("80_rawdata.tsv", comment = "#")

rawdata_80 <- rename(rawdata_80, trial = Trial)
rawdata_80 <- rename(rawdata_80, x = 'L POR X [px]')
rawdata_80 <- rename(rawdata_80, y = 'L POR Y [px]')

rawdata_80 <- rawdata_80 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 80

vehicle80 <- subset(rawdata_80, Time >= 384552460 & Time <= 421832426)

vehicle80$time <- seq.int(nrow(vehicle80))*4
vehicle80 = vehicle80[,-c(1)]

write_tsv(vehicle80,"D:/Mario/Escritorio/Fijaciones/vehicle80.tsv")

ggplot(vehicle80, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle80_fixations <- subset(detect.fixations(vehicle80))

diagnostic.plot(vehicle80, vehicle80_fixations)

diagnostic.plot(vehicle80, vehicle80_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle80 <- calculate.summary(vehicle80_fixations)
round(stats_vehicle80, digits=2)

#Hacer rectangle en 80

rectangle80 <- subset(rawdata_80, Time >= 442234979 & Time <= 474152640)

rectangle80$time <- seq.int(nrow(rectangle80))*4
rectangle80 = rectangle80[,-c(1)]

write_tsv(rectangle80,"D:/Mario/Escritorio/Fijaciones/rectangle80.tsv")

ggplot(rectangle80, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle80_fixations <- subset(detect.fixations(rectangle80))

diagnostic.plot(rectangle80, rectangle80_fixations)

diagnostic.plot(rectangle80, rectangle80_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle80 <- calculate.summary(rectangle80_fixations)
round(stats_rectangle80, digits=2)
