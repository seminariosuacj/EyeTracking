setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_51 <- read_tsv("51_rawdata.tsv", comment = "#")

rawdata_51 <- rename(rawdata_51, trial = Trial)
rawdata_51 <- rename(rawdata_51, x = 'L POR X [px]')
rawdata_51 <- rename(rawdata_51, y = 'L POR Y [px]')

rawdata_51 <- rawdata_51 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 51

vehicle51 <- subset(rawdata_51, Time >= 4683180469 & Time <= 4708438837)

vehicle51$time <- seq.int(nrow(vehicle51))*4
vehicle51 = vehicle51[,-c(1)]
write_tsv(vehicle51,"D:/Mario/Escritorio/Fijaciones/vehicle51.tsv")

ggplot(vehicle51, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle51_fixations <- subset(detect.fixations(vehicle51))

diagnostic.plot(vehicle51, vehicle51_fixations)

diagnostic.plot(vehicle51, vehicle51_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle51 <- calculate.summary(vehicle51_fixations)
round(stats_vehicle51, digits=2)


#Hacer rectangle en 51

rectangle51 <- subset(rawdata_51, Time >= 4728253694 & Time <= 4754571999)

rectangle51$time <- seq.int(nrow(rectangle51))*4
rectangle51 = rectangle51[,-c(1)]
write_tsv(rectangle51,"D:/Mario/Escritorio/Fijaciones/rectangle51.tsv")

ggplot(rectangle51, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle51_fixations <- subset(detect.fixations(rectangle51))

diagnostic.plot(rectangle51, rectangle51_fixations)

diagnostic.plot(rectangle51, rectangle51_fixations, start.time=4, duration=1000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle51 <- calculate.summary(rectangle51_fixations)
round(stats_rectangle51, digits=2)

