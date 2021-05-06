setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_199 <- read_tsv("199_rawdata.tsv", comment = "#")

rawdata_199 <- rename(rawdata_199, trial = Trial)
rawdata_199 <- rename(rawdata_199, x = 'L POR X [px]')
rawdata_199 <- rename(rawdata_199, y = 'L POR Y [px]')

rawdata_199 <- rawdata_199 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 199

vehicle199 <- subset(rawdata_199, Time >= 14523575994 & Time <= 14558737040)

vehicle199$time <- seq.int(nrow(vehicle199))*4
vehicle199 = vehicle199[,-c(1)]

write_tsv(vehicle199,"D:/Mario/Escritorio/Fijaciones/vehicle199.tsv")

ggplot(vehicle199, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle199_fixations <- subset(detect.fixations(vehicle199))

diagnostic.plot(vehicle199, vehicle199_fixations)

diagnostic.plot(vehicle199, vehicle199_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle199 <- calculate.summary(vehicle199_fixations)
round(stats_vehicle199, digits=2)



#Hacer rectangle en 199

rectangle199 <- subset(rawdata_199, Time >= 14580671045 & Time <= 14616660687)

rectangle199$time <- seq.int(nrow(rectangle199))*4
rectangle199 = rectangle199[,-c(1)]

write_tsv(rectangle199,"D:/Mario/Escritorio/Fijaciones/rectangle199.tsv")

ggplot(rectangle199, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle199_fixations <- subset(detect.fixations(rectangle199))

diagnostic.plot(rectangle199, rectangle199_fixations)

diagnostic.plot(rectangle199, rectangle199_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle199 <- calculate.summary(rectangle199_fixations)
round(stats_rectangle199, digits=2)

