setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_70 <- read_tsv("70_rawdata.tsv", comment = "#")

rawdata_70 <- rename(rawdata_70, trial = Trial)
rawdata_70 <- rename(rawdata_70, x = 'L POR X [px]')
rawdata_70 <- rename(rawdata_70, y = 'L POR Y [px]')

rawdata_70 <- rawdata_70 %>%
  select('Time','trial','x','y','L Validity')

#Hacer en rectangle

rectangle70 <- subset(rawdata_70, Time >= 222472062 & Time <= 264257628)

rectangle70$time <- seq.int(nrow(rectangle70))*4
rectangle70 = rectangle70[,-c(1)]
write_tsv(rectangle70,"D:/Mario/Escritorio/Fijaciones/rectangle70.tsv")

ggplot(rectangle70, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle70_fixations <- subset(detect.fixations(rectangle70))

diagnostic.plot(rectangle70, rectangle70_fixations)

diagnostic.plot(rectangle70, rectangle70_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle70 <- calculate.summary(rectangle70_fixations)
round(stats_rectangle70, digits=2)

#Hacer vehicle en 70

vehicle70 <- subset(rawdata_70, Time >= 288291911 & Time <= 331047557)

vehicle70$time <- seq.int(nrow(vehicle70))*4
vehicle70 = vehicle70[,-c(1)]
write_tsv(vehicle70,"D:/Mario/Escritorio/Fijaciones/vehicle70.tsv")

ggplot(vehicle70, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle70_fixations <- subset(detect.fixations(vehicle70))

diagnostic.plot(vehicle70, vehicle70_fixations)

diagnostic.plot(vehicle70, vehicle70_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle70 <- calculate.summary(vehicle70_fixations)
round(stats_vehicle70, digits=2)
