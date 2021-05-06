setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_194 <- read_tsv("194_rawdata.tsv", comment = "#")

rawdata_194 <- rename(rawdata_194, trial = Trial)
rawdata_194 <- rename(rawdata_194, x = 'L POR X [px]')
rawdata_194 <- rename(rawdata_194, y = 'L POR Y [px]')

rawdata_194 <- rawdata_194 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 194

rectangle194 <- subset(rawdata_194, Time >= 908397549 & Time <= 1027299570)

rectangle194$time <- seq.int(nrow(rectangle194))*4
rectangle194 = rectangle194[,-c(1)]

write_tsv(rectangle194,"D:/Mario/Escritorio/Fijaciones/rectangle194.tsv")

ggplot(rectangle194, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle194_fixations <- subset(detect.fixations(rectangle194))

diagnostic.plot(rectangle194, rectangle194_fixations)

diagnostic.plot(rectangle194, rectangle194_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle194 <- calculate.summary(rectangle194_fixations)
round(stats_rectangle194, digits=2)



#Hacer vehicle en 194

vehicle194 <- subset(rawdata_194, Time >= 1062565617 & Time <= 1133427660)

vehicle194$time <- seq.int(nrow(vehicle194))*4
vehicle194 = vehicle194[,-c(1)]

write_tsv(vehicle194,"D:/Mario/Escritorio/Fijaciones/vehicle194.tsv")

ggplot(vehicle194, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle194_fixations <- subset(detect.fixations(vehicle194))

diagnostic.plot(vehicle194, vehicle194_fixations)

diagnostic.plot(vehicle194, vehicle194_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle194 <- calculate.summary(vehicle194_fixations)
round(stats_vehicle194, digits=2)





