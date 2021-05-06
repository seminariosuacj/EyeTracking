setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_156 <- read_tsv("156_rawdata.tsv", comment = "#")

rawdata_156 <- rename(rawdata_156, trial = Trial)
rawdata_156 <- rename(rawdata_156, x = 'L POR X [px]')
rawdata_156 <- rename(rawdata_156, y = 'L POR Y [px]')

rawdata_156 <- rawdata_156 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 156

rectangle156 <- subset(rawdata_156, Time >= 857440652 & Time <= 898839749)

rectangle156$time <- seq.int(nrow(rectangle156))*4
rectangle156 = rectangle156[,-c(1)]
write_tsv(rectangle156,"D:/Mario/Escritorio/Fijaciones/rectangle156.tsv")

ggplot(rectangle156, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle156_fixations <- subset(detect.fixations(rectangle156))

diagnostic.plot(rectangle156, rectangle156_fixations)

diagnostic.plot(rectangle156, rectangle156_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle156 <- calculate.summary(rectangle156_fixations)
round(stats_rectangle156, digits=2)

#Hacer vehicle en 156

vehicle156 <- subset(rawdata_156, Time >= 949013879 & Time <= 1025296389)

vehicle156$time <- seq.int(nrow(vehicle156))*4
vehicle156 = vehicle156[,-c(1)]
write_tsv(vehicle156,"D:/Mario/Escritorio/Fijaciones/vehicle156.tsv")

ggplot(vehicle156, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle156_fixations <- subset(detect.fixations(vehicle156))

diagnostic.plot(vehicle156, vehicle156_fixations)

diagnostic.plot(vehicle156, vehicle156_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle156 <- calculate.summary(vehicle156_fixations)
round(stats_vehicle156, digits=2)
