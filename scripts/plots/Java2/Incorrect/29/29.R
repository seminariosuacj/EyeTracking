setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_29 <- read_tsv("29_rawdata.tsv", comment = "#")

rawdata_29 <- rename(rawdata_29, trial = Trial)
rawdata_29 <- rename(rawdata_29, x = 'L POR X [px]')
rawdata_29 <- rename(rawdata_29, y = 'L POR Y [px]')

rawdata_29 <- rawdata_29 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 29

vehicle29 <- subset(rawdata_29, Time >= 1960967906 & Time <= 2009820501)

vehicle29$time <- seq.int(nrow(vehicle29))*4
vehicle29 = vehicle29[,-c(1)]
write_tsv(vehicle29,"D:/Mario/Escritorio/Fijaciones/vehicle29.tsv")

ggplot(vehicle29, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle29_fixations <- subset(detect.fixations(vehicle29))

diagnostic.plot(vehicle29, vehicle29_fixations)

diagnostic.plot(vehicle29, vehicle29_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle29 <- calculate.summary(vehicle29_fixations)
round(stats_vehicle29, digits=2)


#Hacer rectangle en 29

rectangle29 <- subset(rawdata_29, Time >= 2039952118 & Time <= 2086304816)

rectangle29$time <- seq.int(nrow(rectangle29))*4
rectangle29 = rectangle29[,-c(1)]
write_tsv(rectangle29,"D:/Mario/Escritorio/Fijaciones/rectangle29.tsv")

ggplot(rectangle29, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle29_fixations <- subset(detect.fixations(rectangle29))

diagnostic.plot(rectangle29, rectangle29_fixations)

diagnostic.plot(rectangle29, rectangle29_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle29 <- calculate.summary(rectangle29_fixations)
round(stats_rectangle29, digits=2)

