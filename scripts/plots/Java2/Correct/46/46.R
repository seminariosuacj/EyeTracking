setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_46 <- read_tsv("46_rawdata.tsv", comment = "#")

rawdata_46 <- rename(rawdata_46, trial = Trial)
rawdata_46 <- rename(rawdata_46, x = 'L POR X [px]')
rawdata_46 <- rename(rawdata_46, y = 'L POR Y [px]')

rawdata_46 <- rawdata_46 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 46

vehicle46 <- subset(rawdata_46, Time >= 366937746 & Time <= 414513061)

vehicle46$time <- seq.int(nrow(vehicle46))*4
vehicle46 = vehicle46[,-c(1)]
write_tsv(vehicle46,"D:/Mario/Escritorio/Fijaciones/vehicle46.tsv")

ggplot(vehicle46, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle46_fixations <- subset(detect.fixations(vehicle46))

diagnostic.plot(vehicle46, vehicle46_fixations)

diagnostic.plot(vehicle46, vehicle46_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle46 <- calculate.summary(vehicle46_fixations)
round(stats_vehicle46, digits=2)

#Hacer en rectangle

rectangle46 <- subset(rawdata_46, Time >= 473460893 & Time <= 513373929)

rectangle46$time <- seq.int(nrow(rectangle46))*4
rectangle46 = rectangle46[,-c(1)]
write_tsv(rectangle46,"D:/Mario/Escritorio/Fijaciones/rectangle46.tsv")

ggplot(rectangle46, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle46_fixations <- subset(detect.fixations(rectangle46))

diagnostic.plot(rectangle46, rectangle46_fixations)

diagnostic.plot(rectangle46, rectangle46_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle46 <- calculate.summary(rectangle46_fixations)
round(stats_rectangle46, digits=2)
