setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_203 <- read_tsv("203_rawdata.tsv", comment = "#")

rawdata_203 <- rename(rawdata_203, trial = Trial)
rawdata_203 <- rename(rawdata_203, x = 'L POR X [px]')
rawdata_203 <- rename(rawdata_203, y = 'L POR Y [px]')

rawdata_203 <- rawdata_203 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 203

rectangle203 <- subset(rawdata_203, Time >= 14806930021 & Time <= 14848178467)

rectangle203$time <- seq.int(nrow(rectangle203))*4
rectangle203 = rectangle203[,-c(1)]

write_tsv(rectangle203,"D:/Mario/Escritorio/Fijaciones/rectangle203.tsv")

ggplot(rectangle203, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle203_fixations <- subset(detect.fixations(rectangle203))

diagnostic.plot(rectangle203, rectangle203_fixations)

diagnostic.plot(rectangle203, rectangle203_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle203 <- calculate.summary(rectangle203_fixations)
round(stats_rectangle203, digits=2)

#Hacer vehicle en 203

vehicle203 <- subset(rawdata_203, Time >= 14871876410 & Time <= 14908669172)

vehicle203$time <- seq.int(nrow(vehicle203))*4
vehicle203 = vehicle203[,-c(1)]

write_tsv(vehicle203,"D:/Mario/Escritorio/Fijaciones/vehicle203.tsv")

ggplot(vehicle203, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle203_fixations <- subset(detect.fixations(vehicle203))

diagnostic.plot(vehicle203, vehicle203_fixations)

diagnostic.plot(vehicle203, vehicle203_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle203 <- calculate.summary(vehicle203_fixations)
round(stats_vehicle203, digits=2)
