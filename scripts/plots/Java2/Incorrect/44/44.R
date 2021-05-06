setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_44 <- read_tsv("44_rawdata.tsv", comment = "#")

rawdata_44 <- rename(rawdata_44, trial = Trial)
rawdata_44 <- rename(rawdata_44, x = 'L POR X [px]')
rawdata_44 <- rename(rawdata_44, y = 'L POR Y [px]')

rawdata_44 <- rawdata_44 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 44

vehicle44 <- subset(rawdata_44, Time >= 2813327518 & Time <= 2871879399)

vehicle44$time <- seq.int(nrow(vehicle44))*4
vehicle44 = vehicle44[,-c(1)]
write_tsv(vehicle44,"D:/Mario/Escritorio/Fijaciones/vehicle44.tsv")

ggplot(vehicle44, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle44_fixations <- subset(detect.fixations(vehicle44))

diagnostic.plot(vehicle44, vehicle44_fixations)

diagnostic.plot(vehicle44, vehicle44_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle44 <- calculate.summary(vehicle44_fixations)
round(stats_vehicle44, digits=2)

#Hacer rectangle en 44

rectangle44 <- subset(rawdata_44, Time >= 2890346227 & Time <= 2923192003)

rectangle44$time <- seq.int(nrow(rectangle44))*4
rectangle44 = rectangle44[,-c(1)]
write_tsv(rectangle44,"D:/Mario/Escritorio/Fijaciones/rectangle44.tsv")

ggplot(rectangle44, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle44_fixations <- subset(detect.fixations(rectangle44))

diagnostic.plot(rectangle44, rectangle44_fixations)

diagnostic.plot(rectangle44, rectangle44_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle44 <- calculate.summary(rectangle44_fixations)
round(stats_rectangle44, digits=2)

