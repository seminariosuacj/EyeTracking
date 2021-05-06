setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_129 <- read_tsv("129_rawdata.tsv", comment = "#")

rawdata_129 <- rename(rawdata_129, trial = Trial)
rawdata_129 <- rename(rawdata_129, x = 'L POR X [px]')
rawdata_129 <- rename(rawdata_129, y = 'L POR Y [px]')

rawdata_129 <- rawdata_129 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 129

rectangle129 <- subset(rawdata_129, Time >= 14163056256 & Time <= 14193361076)

rectangle129$time <- seq.int(nrow(rectangle129))*4
rectangle129 = rectangle129[,-c(1)]
write_tsv(rectangle129,"D:/Mario/Escritorio/Fijaciones/rectangle129.tsv")

ggplot(rectangle129, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle129_fixations <- subset(detect.fixations(rectangle129))

diagnostic.plot(rectangle129, rectangle129_fixations)

diagnostic.plot(rectangle129, rectangle129_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle129 <- calculate.summary(rectangle129_fixations)
round(stats_rectangle129, digits=2)

#Hacer vehicle en 129

vehicle129 <- subset(rawdata_129, Time >= 14231879544 & Time <= 14281821129)

vehicle129$time <- seq.int(nrow(vehicle129))*4
vehicle129 = vehicle129[,-c(1)]
write_tsv(vehicle129,"D:/Mario/Escritorio/Fijaciones/vehicle129.tsv")

ggplot(vehicle129, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle129_fixations <- subset(detect.fixations(vehicle129))

diagnostic.plot(vehicle129, vehicle129_fixations)

diagnostic.plot(vehicle129, vehicle129_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle129 <- calculate.summary(vehicle129_fixations)
round(stats_vehicle129, digits=2)
