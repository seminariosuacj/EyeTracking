setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_90 <- read_tsv("90_rawdata.tsv", comment = "#")

rawdata_90 <- rename(rawdata_90, trial = Trial)
rawdata_90 <- rename(rawdata_90, x = 'L POR X [px]')
rawdata_90 <- rename(rawdata_90, y = 'L POR Y [px]')

rawdata_90 <- rawdata_90 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 90

vehicle90 <- subset(rawdata_90, Time >= 3754030527 & Time <= 3761449972)

vehicle90$time <- seq.int(nrow(vehicle90))*4
vehicle90 = vehicle90[,-c(1)]
write_tsv(vehicle90,"D:/Mario/Escritorio/Fijaciones/vehicle90.tsv")

ggplot(vehicle90, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle90_fixations <- subset(detect.fixations(vehicle90))

diagnostic.plot(vehicle90, vehicle90_fixations)

diagnostic.plot(vehicle90, vehicle90_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle90 <- calculate.summary(vehicle90_fixations)
round(stats_vehicle90, digits=2)



#Hacer rectangle en 90

rectangle90 <- subset(rawdata_90, Time >= 3777447485 & Time <= 3804713953)

rectangle90$time <- seq.int(nrow(rectangle90))*4
rectangle90 = rectangle90[,-c(1)]
write_tsv(rectangle90,"D:/Mario/Escritorio/Fijaciones/rectangle90.tsv")

ggplot(rectangle90, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle90_fixations <- subset(detect.fixations(rectangle90))

diagnostic.plot(rectangle90, rectangle90_fixations)

diagnostic.plot(rectangle90, rectangle90_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle90 <- calculate.summary(rectangle90_fixations)
round(stats_rectangle90, digits=2)

