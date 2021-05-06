setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_140 <- read_tsv("140_rawdata.tsv", comment = "#")

rawdata_140 <- rename(rawdata_140, trial = Trial)
rawdata_140 <- rename(rawdata_140, x = 'L POR X [px]')
rawdata_140 <- rename(rawdata_140, y = 'L POR Y [px]')

rawdata_140 <- rawdata_140 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 140

vehicle140 <- subset(rawdata_140, Time >= 1079049611 & Time <= 1129422121)

vehicle140$time <- seq.int(nrow(vehicle140))*4
vehicle140 = vehicle140[,-c(1)]
write_tsv(vehicle140,"D:/Mario/Escritorio/Fijaciones/vehicle140.tsv")

ggplot(vehicle140, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle140_fixations <- subset(detect.fixations(vehicle140))

diagnostic.plot(vehicle140, vehicle140_fixations)

diagnostic.plot(vehicle140, vehicle140_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle140 <- calculate.summary(vehicle140_fixations)
round(stats_vehicle140, digits=2)


#Hacer rectangle en 140

rectangle140 <- subset(rawdata_140, Time >= 1158100094 & Time <= 1184570289)

rectangle140$time <- seq.int(nrow(rectangle140))*4
rectangle140 = rectangle140[,-c(1)]
write_tsv(rectangle140,"D:/Mario/Escritorio/Fijaciones/rectangle140.tsv")

ggplot(rectangle140, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle140_fixations <- subset(detect.fixations(rectangle140))

diagnostic.plot(rectangle140, rectangle140_fixations)

diagnostic.plot(rectangle140, rectangle140_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle140 <- calculate.summary(rectangle140_fixations)
round(stats_rectangle140, digits=2)

