setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_167 <- read_tsv("167_rawdata.tsv", comment = "#")

rawdata_167 <- rename(rawdata_167, trial = Trial)
rawdata_167 <- rename(rawdata_167, x = 'L POR X [px]')
rawdata_167 <- rename(rawdata_167, y = 'L POR Y [px]')

rawdata_167 <- rawdata_167 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 167

vehicle167 <- subset(rawdata_167, Time >= 24269567507 & Time <= 24313287812)

vehicle167$time <- seq.int(nrow(vehicle167))*4
vehicle167 = vehicle167[,-c(1)]

write_tsv(vehicle167,"D:/Mario/Escritorio/Fijaciones/vehicle167.tsv")

ggplot(vehicle167, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle167_fixations <- subset(detect.fixations(vehicle167))

diagnostic.plot(vehicle167, vehicle167_fixations)

diagnostic.plot(vehicle167, vehicle167_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle167 <- calculate.summary(vehicle167_fixations)
round(stats_vehicle167, digits=2)


#Hacer rectangle en 167

rectangle167 <- subset(rawdata_167, Time >= 24324330903 & Time <= 24349604749)

rectangle167$time <- seq.int(nrow(rectangle167))*4
rectangle167 = rectangle167[,-c(1)]

write_tsv(rectangle167,"D:/Mario/Escritorio/Fijaciones/rectangle167.tsv")

ggplot(rectangle167, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle167_fixations <- subset(detect.fixations(rectangle167))

diagnostic.plot(rectangle167, rectangle167_fixations)

diagnostic.plot(rectangle167, rectangle167_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle167 <- calculate.summary(rectangle167_fixations)
round(stats_rectangle167, digits=2)

