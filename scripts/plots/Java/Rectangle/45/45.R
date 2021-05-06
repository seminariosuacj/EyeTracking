setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_45 <- read_tsv("45_rawdata.tsv", comment = "#")

rawdata_45 <- rename(rawdata_45, trial = Trial)
rawdata_45 <- rename(rawdata_45, x = 'L POR X [px]')
rawdata_45 <- rename(rawdata_45, y = 'L POR Y [px]')

rawdata_45 <- rawdata_45 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 45

vehicle45 <- subset(rawdata_45, Time >= 527890049 & Time <= 662089202)

vehicle45$time <- seq.int(nrow(vehicle45))*4
vehicle45 = vehicle45[,-c(1)]

write_tsv(vehicle45,"D:/Mario/Escritorio/Fijaciones/vehicle45.tsv")

ggplot(vehicle45, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle45_fixations <- subset(detect.fixations(vehicle45))

diagnostic.plot(vehicle45, vehicle45_fixations)

diagnostic.plot(vehicle45, vehicle45_fixations, start.time=4, duration=100000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle45 <- calculate.summary(vehicle45_fixations)
round(stats_vehicle45, digits=2)



#Hacer rectangle en 45

rectangle45 <- subset(rawdata_45, Time >= 707158972 & Time <= 811338756)

rectangle45$time <- seq.int(nrow(rectangle45))*4
rectangle45 = rectangle45[,-c(1)]

write_tsv(rectangle45,"D:/Mario/Escritorio/Fijaciones/rectangle45.tsv")

ggplot(rectangle45, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle45_fixations <- subset(detect.fixations(rectangle45))

diagnostic.plot(rectangle45, rectangle45_fixations)

diagnostic.plot(rectangle45, rectangle45_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle45 <- calculate.summary(rectangle45_fixations)
round(stats_rectangle45, digits=2)

