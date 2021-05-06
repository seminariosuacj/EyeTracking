setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_93 <- read_tsv("93_rawdata.tsv", comment = "#")

rawdata_93 <- rename(rawdata_93, trial = Trial)
rawdata_93 <- rename(rawdata_93, x = 'L POR X [px]')
rawdata_93 <- rename(rawdata_93, y = 'L POR Y [px]')

rawdata_93 <- rawdata_93 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 93

vehicle93 <- subset(rawdata_93, Time >= 3166903197 & Time <= 3185545638)

vehicle93$time <- seq.int(nrow(vehicle93))*4
vehicle93 = vehicle93[,-c(1)]

write_tsv(vehicle93,"D:/Mario/Escritorio/Fijaciones/vehicle93.tsv")

ggplot(vehicle93, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle93_fixations <- subset(detect.fixations(vehicle93))

diagnostic.plot(vehicle93, vehicle93_fixations)

diagnostic.plot(vehicle93, vehicle93_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle93 <- calculate.summary(vehicle93_fixations)
round(stats_vehicle93, digits=2)


#Hacer rectangle en 93

rectangle93 <- subset(rawdata_93, Time >= 3197268707 & Time <= 3216294934)

rectangle93$time <- seq.int(nrow(rectangle93))*4
rectangle93 = rectangle93[,-c(1)]

write_tsv(rectangle93,"D:/Mario/Escritorio/Fijaciones/rectangle93.tsv")

ggplot(rectangle93, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle93_fixations <- subset(detect.fixations(rectangle93))

diagnostic.plot(rectangle93, rectangle93_fixations)

diagnostic.plot(rectangle93, rectangle93_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle93 <- calculate.summary(rectangle93_fixations)
round(stats_rectangle93, digits=2)

