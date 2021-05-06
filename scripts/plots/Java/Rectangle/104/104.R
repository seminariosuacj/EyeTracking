setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_104 <- read_tsv("104_rawdata.tsv", comment = "#")

rawdata_104 <- rename(rawdata_104, trial = Trial)
rawdata_104 <- rename(rawdata_104, x = 'L POR X [px]')
rawdata_104 <- rename(rawdata_104, y = 'L POR Y [px]')

rawdata_104 <- rawdata_104 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 104

rectangle104 <- subset(rawdata_104, Time >= 938944200 & Time <= 1033415483)

rectangle104$time <- seq.int(nrow(rectangle104))*4
rectangle104 = rectangle104[,-c(1)]

write_tsv(rectangle104,"D:/Mario/Escritorio/Fijaciones/rectangle104.tsv")

ggplot(rectangle104, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle104_fixations <- subset(detect.fixations(rectangle104))

diagnostic.plot(rectangle104, rectangle104_fixations)

diagnostic.plot(rectangle104, rectangle104_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle104 <- calculate.summary(rectangle104_fixations)
round(stats_rectangle104, digits=2)

#Hacer vehicle en 104

vehicle104 <- subset(rawdata_104, Time >= 1077108494 & Time <= 1200135842)

vehicle104$time <- seq.int(nrow(vehicle104))*4
vehicle104 = vehicle104[,-c(1)]

write_tsv(vehicle104,"D:/Mario/Escritorio/Fijaciones/vehicle104.tsv")

ggplot(vehicle104, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle104_fixations <- subset(detect.fixations(vehicle104))

diagnostic.plot(vehicle104, vehicle104_fixations)

diagnostic.plot(vehicle104, vehicle104_fixations, start.time=4, duration=100000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle104 <- calculate.summary(vehicle104_fixations)
round(stats_vehicle104, digits=2)
