setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_160 <- read_tsv("160_rawdata.tsv", comment = "#")

rawdata_160 <- rename(rawdata_160, trial = Trial)
rawdata_160 <- rename(rawdata_160, x = 'L POR X [px]')
rawdata_160 <- rename(rawdata_160, y = 'L POR Y [px]')

rawdata_160 <- rawdata_160 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 160

vehicle160 <- subset(rawdata_160, Time >= 17396637792 & Time <= 17488474035)

vehicle160$time <- seq.int(nrow(vehicle160))*4
vehicle160 = vehicle160[,-c(1)]

write_tsv(vehicle160,"D:/Mario/Escritorio/Fijaciones/vehicle160.tsv")

ggplot(vehicle160, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle160_fixations <- subset(detect.fixations(vehicle160))

diagnostic.plot(vehicle160, vehicle160_fixations)

diagnostic.plot(vehicle160, vehicle160_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle160 <- calculate.summary(vehicle160_fixations)
round(stats_vehicle160, digits=2)



#Hacer rectangle en 160

rectangle160 <- subset(rawdata_160, Time >= 17519539356 & Time <= 17649437535)

rectangle160$time <- seq.int(nrow(rectangle160))*4
rectangle160 = rectangle160[,-c(1)]

write_tsv(rectangle160,"D:/Mario/Escritorio/Fijaciones/rectangle160.tsv")

ggplot(rectangle160, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle160_fixations <- subset(detect.fixations(rectangle160))

diagnostic.plot(rectangle160, rectangle160_fixations)

diagnostic.plot(rectangle160, rectangle160_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle160 <- calculate.summary(rectangle160_fixations)
round(stats_rectangle160, digits=2)

