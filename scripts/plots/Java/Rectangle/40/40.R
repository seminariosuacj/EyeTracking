setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_40 <- read_tsv("40_rawdata.tsv", comment = "#")

rawdata_40 <- rename(rawdata_40, trial = Trial)
rawdata_40 <- rename(rawdata_40, x = 'L POR X [px]')
rawdata_40 <- rename(rawdata_40, y = 'L POR Y [px]')

rawdata_40 <- rawdata_40 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 40

rectangle40 <- subset(rawdata_40, Time >= 25287943251 & Time <= 25337311193)

rectangle40$time <- seq.int(nrow(rectangle40))*4
rectangle40 = rectangle40[,-c(1)]

write_tsv(rectangle40,"D:/Mario/Escritorio/Fijaciones/rectangle40.tsv")

ggplot(rectangle40, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle40_fixations <- subset(detect.fixations(rectangle40))

diagnostic.plot(rectangle40, rectangle40_fixations)

diagnostic.plot(rectangle40, rectangle40_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle40 <- calculate.summary(rectangle40_fixations)
round(stats_rectangle40, digits=2)

#Hacer vehicle en 40

vehicle40 <- subset(rawdata_40, Time >= 25370452173 & Time <= 25428179474)

vehicle40$time <- seq.int(nrow(vehicle40))*4
vehicle40 = vehicle40[,-c(1)]

write_tsv(vehicle40,"D:/Mario/Escritorio/Fijaciones/vehicle40.tsv")

ggplot(vehicle40, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle40_fixations <- subset(detect.fixations(vehicle40))

diagnostic.plot(vehicle40, vehicle40_fixations)

diagnostic.plot(vehicle40, vehicle40_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle40 <- calculate.summary(vehicle40_fixations)
round(stats_vehicle40, digits=2)
