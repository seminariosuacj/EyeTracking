setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_85 <- read_tsv("85_rawdata.tsv", comment = "#")

rawdata_85 <- rename(rawdata_85, trial = Trial)
rawdata_85 <- rename(rawdata_85, x = 'L POR X [px]')
rawdata_85 <- rename(rawdata_85, y = 'L POR Y [px]')

rawdata_85 <- rawdata_85 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 85

vehicle85 <- subset(rawdata_85, Time >= 314247832 & Time <= 362932482)

vehicle85$time <- seq.int(nrow(vehicle85))*4
vehicle85 = vehicle85[,-c(1)]

write_tsv(vehicle85,"D:/Mario/Escritorio/Fijaciones/vehicle85.tsv")

ggplot(vehicle85, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle85_fixations <- subset(detect.fixations(vehicle85))

diagnostic.plot(vehicle85, vehicle85_fixations)

diagnostic.plot(vehicle85, vehicle85_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle85 <- calculate.summary(vehicle85_fixations)
round(stats_vehicle85, digits=2)



#Hacer rectangle en 85

rectangle85 <- subset(rawdata_85, Time >= 382167179 & Time <= 430515642)

rectangle85$time <- seq.int(nrow(rectangle85))*4
rectangle85 = rectangle85[,-c(1)]

write_tsv(rectangle85,"D:/Mario/Escritorio/Fijaciones/rectangle85.tsv")

ggplot(rectangle85, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle85_fixations <- subset(detect.fixations(rectangle85))

diagnostic.plot(rectangle85, rectangle85_fixations)

diagnostic.plot(rectangle85, rectangle85_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle85 <- calculate.summary(rectangle85_fixations)
round(stats_rectangle85, digits=2)

