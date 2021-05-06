setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_59 <- read_tsv("59_rawdata.tsv", comment = "#")

rawdata_59 <- rename(rawdata_59, trial = Trial)
rawdata_59 <- rename(rawdata_59, x = 'L POR X [px]')
rawdata_59 <- rename(rawdata_59, y = 'L POR Y [px]')

rawdata_59 <- rawdata_59 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 59

vehicle59 <- subset(rawdata_59, Time >= 425613250 & Time <= 522206187)

vehicle59$time <- seq.int(nrow(vehicle59))*4
vehicle59 = vehicle59[,-c(1)]

write_tsv(vehicle59,"D:/Mario/Escritorio/Fijaciones/vehicle59.tsv")

ggplot(vehicle59, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle59_fixations <- subset(detect.fixations(vehicle59))

diagnostic.plot(vehicle59, vehicle59_fixations)

diagnostic.plot(vehicle59, vehicle59_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle59 <- calculate.summary(vehicle59_fixations)
round(stats_vehicle59, digits=2)



#Hacer rectangle en 59

rectangle59 <- subset(rawdata_59, Time >= 548434845 & Time <= 643190331)

rectangle59$time <- seq.int(nrow(rectangle59))*4
rectangle59 = rectangle59[,-c(1)]

write_tsv(rectangle59,"D:/Mario/Escritorio/Fijaciones/rectangle59.tsv")

ggplot(rectangle59, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle59_fixations <- subset(detect.fixations(rectangle59))

diagnostic.plot(rectangle59, rectangle59_fixations)

diagnostic.plot(rectangle59, rectangle59_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle59 <- calculate.summary(rectangle59_fixations)
round(stats_rectangle59, digits=2)

