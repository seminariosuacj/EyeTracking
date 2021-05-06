setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_63 <- read_tsv("63_rawdata.tsv", comment = "#")

rawdata_63 <- rename(rawdata_63, trial = Trial)
rawdata_63 <- rename(rawdata_63, x = 'L POR X [px]')
rawdata_63 <- rename(rawdata_63, y = 'L POR Y [px]')

rawdata_63 <- rawdata_63 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 63

vehicle63 <- subset(rawdata_63, Time >= 11710956732 & Time <= 11787761952)

vehicle63$time <- seq.int(nrow(vehicle63))*4
vehicle63 = vehicle63[,-c(1)]

write_tsv(vehicle63,"D:/Mario/Escritorio/Fijaciones/vehicle63.tsv")

ggplot(vehicle63, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle63_fixations <- subset(detect.fixations(vehicle63))

diagnostic.plot(vehicle63, vehicle63_fixations)

diagnostic.plot(vehicle63, vehicle63_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle63 <- calculate.summary(vehicle63_fixations)
round(stats_vehicle63, digits=2)



#Hacer rectangle en 63

rectangle63 <- subset(rawdata_63, Time >= 11818271878 & Time <= 11898324889)

rectangle63$time <- seq.int(nrow(rectangle63))*4
rectangle63 = rectangle63[,-c(1)]

write_tsv(rectangle63,"D:/Mario/Escritorio/Fijaciones/rectangle63.tsv")

ggplot(rectangle63, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle63_fixations <- subset(detect.fixations(rectangle63))

diagnostic.plot(rectangle63, rectangle63_fixations)

diagnostic.plot(rectangle63, rectangle63_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle63 <- calculate.summary(rectangle63_fixations)
round(stats_rectangle63, digits=2)

