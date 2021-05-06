setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_131 <- read_tsv("131_rawdata.tsv", comment = "#")

rawdata_131 <- rename(rawdata_131, trial = Trial)
rawdata_131 <- rename(rawdata_131, x = 'L POR X [px]')
rawdata_131 <- rename(rawdata_131, y = 'L POR Y [px]')

rawdata_131 <- rawdata_131 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 131

vehicle131 <- subset(rawdata_131, Time >= 212452534 & Time <= 293136239)

vehicle131$time <- seq.int(nrow(vehicle131))*4
vehicle131 = vehicle131[,-c(1)]

write_tsv(vehicle131,"D:/Mario/Escritorio/Fijaciones/vehicle131.tsv")

ggplot(vehicle131, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle131_fixations <- subset(detect.fixations(vehicle131))

diagnostic.plot(vehicle131, vehicle131_fixations)

diagnostic.plot(vehicle131, vehicle131_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle131 <- calculate.summary(vehicle131_fixations)
round(stats_vehicle131, digits=2)



#Hacer rectangle en 131

rectangle131 <- subset(rawdata_131, Time >= 320690946 & Time <= 387821246)

rectangle131$time <- seq.int(nrow(rectangle131))*4
rectangle131 = rectangle131[,-c(1)]

write_tsv(rectangle131,"D:/Mario/Escritorio/Fijaciones/rectangle131.tsv")

ggplot(rectangle131, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle131_fixations <- subset(detect.fixations(rectangle131))

diagnostic.plot(rectangle131, rectangle131_fixations)

diagnostic.plot(rectangle131, rectangle131_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle131 <- calculate.summary(rectangle131_fixations)
round(stats_rectangle131, digits=2)

