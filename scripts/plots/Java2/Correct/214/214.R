setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_214 <- read_tsv("214_rawdata.tsv", comment = "#")

rawdata_214 <- rename(rawdata_214, trial = Trial)
rawdata_214 <- rename(rawdata_214, x = 'L POR X [px]')
rawdata_214 <- rename(rawdata_214, y = 'L POR Y [px]')

rawdata_214 <- rawdata_214 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 214

rectangle214 <- subset(rawdata_214, Time >= 13954977330 & Time <= 14011817745)

rectangle214$time <- seq.int(nrow(rectangle214))*4
rectangle214 = rectangle214[,-c(1)]
write_tsv(rectangle214,"D:/Mario/Escritorio/Fijaciones/rectangle214.tsv")

ggplot(rectangle214, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle214_fixations <- subset(detect.fixations(rectangle214))

diagnostic.plot(rectangle214, rectangle214_fixations)

diagnostic.plot(rectangle214, rectangle214_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle214 <- calculate.summary(rectangle214_fixations)
round(stats_rectangle214, digits=2)

#Hacer vehicle en 214

vehicle214 <- subset(rawdata_214, Time >= 14059494174 & Time <= 14166362877)

vehicle214$time <- seq.int(nrow(vehicle214))*4
vehicle214 = vehicle214[,-c(1)]
write_tsv(vehicle214,"D:/Mario/Escritorio/Fijaciones/vehicle214.tsv")

ggplot(vehicle214, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle214_fixations <- subset(detect.fixations(vehicle214))

diagnostic.plot(vehicle214, vehicle214_fixations)

diagnostic.plot(vehicle214, vehicle214_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle214 <- calculate.summary(vehicle214_fixations)
round(stats_vehicle214, digits=2)
