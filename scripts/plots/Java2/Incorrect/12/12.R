setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_12 <- read_tsv("12_rawdata.tsv", comment = "#")

rawdata_12 <- rename(rawdata_12, trial = Trial)
rawdata_12 <- rename(rawdata_12, x = 'L POR X [px]')
rawdata_12 <- rename(rawdata_12, y = 'L POR Y [px]')

rawdata_12 <- rawdata_12 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 12

vehicle12 <- subset(rawdata_12, Time >= 1655619095 & Time <= 1750832690)

vehicle12$time <- seq.int(nrow(vehicle12))*4
vehicle12 = vehicle12[,-c(1)]
write_tsv(vehicle12,"D:/Mario/Escritorio/Fijaciones/vehicle12.tsv")

ggplot(vehicle12, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle12_fixations <- subset(detect.fixations(vehicle12))

diagnostic.plot(vehicle12, vehicle12_fixations)

diagnostic.plot(vehicle12, vehicle12_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle12 <- calculate.summary(vehicle12_fixations)
round(stats_vehicle12, digits=2)


#Hacer rectangle en 12

rectangle12 <- subset(rawdata_12, Time >= 1780806555 & Time <= 1816840204) 

rectangle12$time <- seq.int(nrow(rectangle12))*4
rectangle12 = rectangle12[,-c(1)]
write_tsv(rectangle12,"D:/Mario/Escritorio/Fijaciones/rectangle12.tsv")

ggplot(rectangle12, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle12_fixations <- subset(detect.fixations(rectangle12))

diagnostic.plot(rectangle12, rectangle12_fixations)

diagnostic.plot(rectangle12, rectangle12_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle12 <- calculate.summary(rectangle12_fixations)
round(stats_rectangle12, digits=2)

