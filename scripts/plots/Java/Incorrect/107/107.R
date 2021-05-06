setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_107 <- read_tsv("107_rawdata.tsv", comment = "#")

rawdata_107 <- rename(rawdata_107, trial = Trial)
rawdata_107 <- rename(rawdata_107, x = 'L POR X [px]')
rawdata_107 <- rename(rawdata_107, y = 'L POR Y [px]')

rawdata_107 <- rawdata_107 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 107

rectangle107 <- subset(rawdata_107, Time >= 1168783867 & Time <= 1231378586)

rectangle107$time <- seq.int(nrow(rectangle107))*4
rectangle107 = rectangle107[,-c(1)]

write_tsv(rectangle107,"D:/Mario/Escritorio/Fijaciones/rectangle107.tsv")

ggplot(rectangle107, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle107_fixations <- subset(detect.fixations(rectangle107))

diagnostic.plot(rectangle107, rectangle107_fixations)

diagnostic.plot(rectangle107, rectangle107_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle107 <- calculate.summary(rectangle107_fixations)
round(stats_rectangle107, digits=2)

#Hacer vehicle en 107

vehicle107 <- subset(rawdata_107, Time >= 1269304753 & Time <= 1295872302)

vehicle107$time <- seq.int(nrow(vehicle107))*4
vehicle107 = vehicle107[,-c(1)]

write_tsv(vehicle107,"D:/Mario/Escritorio/Fijaciones/vehicle107.tsv")

ggplot(vehicle107, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle107_fixations <- subset(detect.fixations(vehicle107))

diagnostic.plot(vehicle107, vehicle107_fixations)

diagnostic.plot(vehicle107, vehicle107_fixations, start.time=4, duration=100000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle107 <- calculate.summary(vehicle107_fixations)
round(stats_vehicle107, digits=2)
