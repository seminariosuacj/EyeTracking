setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_26 <- read_tsv("26_rawdata.tsv", comment = "#")

rawdata_26 <- rename(rawdata_26, trial = Trial)
rawdata_26 <- rename(rawdata_26, x = 'L POR X [px]')
rawdata_26 <- rename(rawdata_26, y = 'L POR Y [px]')

rawdata_26 <- rawdata_26 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 26

vehicle26 <- subset(rawdata_26, Time >= 3060345929 & Time <= 3112002632)

vehicle26$time <- seq.int(nrow(vehicle26))*4
vehicle26 = vehicle26[,-c(1)]
write_tsv(vehicle26,"D:/Mario/Escritorio/Fijaciones/vehicle26.tsv")

ggplot(vehicle26, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle26_fixations <- subset(detect.fixations(vehicle26))

diagnostic.plot(vehicle26, vehicle26_fixations)

diagnostic.plot(vehicle26, vehicle26_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle26 <- calculate.summary(vehicle26_fixations)
round(stats_vehicle26, digits=2)

#Hacer rectangle en 26

rectangle26 <- subset(rawdata_26, Time >= 3136928934 & Time <= 3167733480)

rectangle26$time <- seq.int(nrow(rectangle26))*4
rectangle26 = rectangle26[,-c(1)]
write_tsv(rectangle26,"D:/Mario/Escritorio/Fijaciones/rectangle26.tsv")

ggplot(rectangle26, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle26_fixations <- subset(detect.fixations(rectangle26))

diagnostic.plot(rectangle26, rectangle26_fixations)

diagnostic.plot(rectangle26, rectangle26_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle26 <- calculate.summary(rectangle26_fixations)
round(stats_rectangle26, digits=2)
