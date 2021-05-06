setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_204 <- read_tsv("204_rawdata.tsv", comment = "#")

rawdata_204 <- rename(rawdata_204, trial = Trial)
rawdata_204 <- rename(rawdata_204, x = 'L POR X [px]')
rawdata_204 <- rename(rawdata_204, y = 'L POR Y [px]')

rawdata_204 <- rawdata_204 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 204

vehicle204 <- subset(rawdata_204, Time >= 6087824780 & Time <= 6111174758)

vehicle204$time <- seq.int(nrow(vehicle204))*4
vehicle204 = vehicle204[,-c(1)]

write_tsv(vehicle204,"D:/Mario/Escritorio/Fijaciones/vehicle204.tsv")

ggplot(vehicle204, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle204_fixations <- subset(detect.fixations(vehicle204))

diagnostic.plot(vehicle204, vehicle204_fixations)

diagnostic.plot(vehicle204, vehicle204_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle204 <- calculate.summary(vehicle204_fixations)
round(stats_vehicle204, digits=2)

#Hacer rectangle en 204

rectangle204 <- subset(rawdata_204, Time >= 6132487662 & Time <= 6145366532)

rectangle204$time <- seq.int(nrow(rectangle204))*4
rectangle204 = rectangle204[,-c(1)]

write_tsv(rectangle204,"D:/Mario/Escritorio/Fijaciones/rectangle204.tsv")

ggplot(rectangle204, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle204_fixations <- subset(detect.fixations(rectangle204))

diagnostic.plot(rectangle204, rectangle204_fixations)

diagnostic.plot(rectangle204, rectangle204_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle204 <- calculate.summary(rectangle204_fixations)
round(stats_rectangle204, digits=2)

