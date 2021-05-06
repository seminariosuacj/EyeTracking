setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_71 <- read_tsv("71_rawdata.tsv", comment = "#")

rawdata_71 <- rename(rawdata_71, trial = Trial)
rawdata_71 <- rename(rawdata_71, x = 'L POR X [px]')
rawdata_71 <- rename(rawdata_71, y = 'L POR Y [px]')

rawdata_71 <- rawdata_71 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 71

rectangle71 <- subset(rawdata_71, Time >= 13901910382 & Time <= 13972832411)

rectangle71$time <- seq.int(nrow(rectangle71))*4
rectangle71 = rectangle71[,-c(1)]

write_tsv(rectangle71,"D:/Mario/Escritorio/Fijaciones/rectangle71.tsv")

ggplot(rectangle71, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle71_fixations <- subset(detect.fixations(rectangle71))

diagnostic.plot(rectangle71, rectangle71_fixations)

diagnostic.plot(rectangle71, rectangle71_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle71 <- calculate.summary(rectangle71_fixations)
round(stats_rectangle71, digits=2)

#Hacer vehicle en 71

vehicle71 <- subset(rawdata_71, Time >= 14003013800 & Time <= 14128501760)

vehicle71$time <- seq.int(nrow(vehicle71))*4
vehicle71 = vehicle71[,-c(1)]

write_tsv(vehicle71,"D:/Mario/Escritorio/Fijaciones/vehicle71.tsv")

ggplot(vehicle71, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle71_fixations <- subset(detect.fixations(vehicle71))

diagnostic.plot(vehicle71, vehicle71_fixations)

diagnostic.plot(vehicle71, vehicle71_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle71 <- calculate.summary(vehicle71_fixations)
round(stats_vehicle71, digits=2)
