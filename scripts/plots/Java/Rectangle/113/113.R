setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_113 <- read_tsv("113_rawdata.tsv", comment = "#")

rawdata_113 <- rename(rawdata_113, trial = Trial)
rawdata_113 <- rename(rawdata_113, x = 'L POR X [px]')
rawdata_113 <- rename(rawdata_113, y = 'L POR Y [px]')

rawdata_113 <- rawdata_113 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 113

rectangle113 <- subset(rawdata_113, Time >= 3435556269 & Time <= 3509691191)

rectangle113$time <- seq.int(nrow(rectangle113))*4
rectangle113 = rectangle113[,-c(1)]

write_tsv(rectangle113,"D:/Mario/Escritorio/Fijaciones/rectangle113.tsv")

ggplot(rectangle113, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle113_fixations <- subset(detect.fixations(rectangle113))

diagnostic.plot(rectangle113, rectangle113_fixations)

diagnostic.plot(rectangle113, rectangle113_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle113 <- calculate.summary(rectangle113_fixations)
round(stats_rectangle113, digits=2)

#Hacer vehicle en 113

vehicle113 <- subset(rawdata_113, Time >= 3660565582 & Time <= 3718902966)

vehicle113$time <- seq.int(nrow(vehicle113))*4
vehicle113 = vehicle113[,-c(1)]

write_tsv(vehicle113,"D:/Mario/Escritorio/Fijaciones/vehicle113.tsv")

ggplot(vehicle113, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle113_fixations <- subset(detect.fixations(vehicle113))

diagnostic.plot(vehicle113, vehicle113_fixations)

diagnostic.plot(vehicle113, vehicle113_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle113 <- calculate.summary(vehicle113_fixations)
round(stats_vehicle113, digits=2)
