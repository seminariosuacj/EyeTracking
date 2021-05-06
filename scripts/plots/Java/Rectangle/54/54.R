setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_54 <- read_tsv("54_rawdata.tsv", comment = "#")

rawdata_54 <- rename(rawdata_54, trial = Trial)
rawdata_54 <- rename(rawdata_54, x = 'L POR X [px]')
rawdata_54 <- rename(rawdata_54, y = 'L POR Y [px]')

rawdata_54 <- rawdata_54 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 54

vehicle54 <- subset(rawdata_54, Time >= 4541558011 & Time <= 4583586341)

vehicle54$time <- seq.int(nrow(vehicle54))*4
vehicle54 = vehicle54[,-c(1)]

write_tsv(vehicle54,"D:/Mario/Escritorio/Fijaciones/vehicle54.tsv")

ggplot(vehicle54, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle54_fixations <- subset(detect.fixations(vehicle54))

diagnostic.plot(vehicle54, vehicle54_fixations)

diagnostic.plot(vehicle54, vehicle54_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle54 <- calculate.summary(vehicle54_fixations)
round(stats_vehicle54, digits=2)



#Hacer rectangle en 54

rectangle54 <- subset(rawdata_54, Time >= 4625448688 & Time <= 4710381261)

rectangle54$time <- seq.int(nrow(rectangle54))*4
rectangle54 = rectangle54[,-c(1)]

write_tsv(rectangle54,"D:/Mario/Escritorio/Fijaciones/rectangle54.tsv")

ggplot(rectangle54, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle54_fixations <- subset(detect.fixations(rectangle54))

diagnostic.plot(rectangle54, rectangle54_fixations)

diagnostic.plot(rectangle54, rectangle54_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle54 <- calculate.summary(rectangle54_fixations)
round(stats_rectangle54, digits=2)
