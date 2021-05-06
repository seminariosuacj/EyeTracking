setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_74 <- read_tsv("74_rawdata.tsv", comment = "#")

rawdata_74 <- rename(rawdata_74, trial = Trial)
rawdata_74 <- rename(rawdata_74, x = 'L POR X [px]')
rawdata_74 <- rename(rawdata_74, y = 'L POR Y [px]')

rawdata_74 <- rawdata_74 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 74

rectangle74 <- subset(rawdata_74, Time >= 9706938303 & Time <= 9738559781)

rectangle74$time <- seq.int(nrow(rectangle74))*4
rectangle74 = rectangle74[,-c(1)]
write_tsv(rectangle74,"D:/Mario/Escritorio/Fijaciones/rectangle74.tsv")

ggplot(rectangle74, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle74_fixations <- subset(detect.fixations(rectangle74))

diagnostic.plot(rectangle74, rectangle74_fixations)

diagnostic.plot(rectangle74, rectangle74_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle74 <- calculate.summary(rectangle74_fixations)
round(stats_rectangle74, digits=2)

#Hacer vehicle en 74

vehicle74 <- subset(rawdata_74, Time >= 9754406569 & Time <= 9782380762)

vehicle74$time <- seq.int(nrow(vehicle74))*4
vehicle74 = vehicle74[,-c(1)]
write_tsv(vehicle74,"D:/Mario/Escritorio/Fijaciones/vehicle74.tsv")

ggplot(vehicle74, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed()+
  expand_limits(x = 1920, y = 1080)

vehicle74_fixations <- subset(detect.fixations(vehicle74))

diagnostic.plot(vehicle74, vehicle74_fixations)

diagnostic.plot(vehicle74, vehicle74_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle74 <- calculate.summary(vehicle74_fixations)
round(stats_vehicle74, digits=2)
