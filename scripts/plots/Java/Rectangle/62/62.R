setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_62 <- read_tsv("62_rawdata.tsv", comment = "#")

rawdata_62 <- rename(rawdata_62, trial = Trial)
rawdata_62 <- rename(rawdata_62, x = 'L POR X [px]')
rawdata_62 <- rename(rawdata_62, y = 'L POR Y [px]')

rawdata_62 <- rawdata_62 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 62

rectangle62 <- subset(rawdata_62, Time >= 3718355353 & Time <= 3761424129)

rectangle62$time <- seq.int(nrow(rectangle62))*4
rectangle62 = rectangle62[,-c(1)]

write_tsv(rectangle62,"D:/Mario/Escritorio/Fijaciones/rectangle62.tsv")

ggplot(rectangle62, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle62_fixations <- subset(detect.fixations(rectangle62))

diagnostic.plot(rectangle62, rectangle62_fixations)

diagnostic.plot(rectangle62, rectangle62_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle62 <- calculate.summary(rectangle62_fixations)
round(stats_rectangle62, digits=2)

#Hacer vehicle en 62

vehicle62 <- subset(rawdata_62, Time >= 3789129513 & Time <= 3838089371)

vehicle62$time <- seq.int(nrow(vehicle62))*4
vehicle62 = vehicle62[,-c(1)]

write_tsv(vehicle62,"D:/Mario/Escritorio/Fijaciones/vehicle62.tsv")

ggplot(vehicle62, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle62_fixations <- subset(detect.fixations(vehicle62))

diagnostic.plot(vehicle62, vehicle62_fixations)

diagnostic.plot(vehicle62, vehicle62_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle62 <- calculate.summary(vehicle62_fixations)
round(stats_vehicle62, digits=2)
