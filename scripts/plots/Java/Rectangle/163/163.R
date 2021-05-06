setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_163 <- read_tsv("163_rawdata.tsv", comment = "#")

rawdata_163 <- rename(rawdata_163, trial = Trial)
rawdata_163 <- rename(rawdata_163, x = 'L POR X [px]')
rawdata_163 <- rename(rawdata_163, y = 'L POR Y [px]')

rawdata_163 <- rawdata_163 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 163

vehicle163 <- subset(rawdata_163, Time >= 16415626375 & Time <= 16487404258)

vehicle163$time <- seq.int(nrow(vehicle163))*4
vehicle163 = vehicle163[,-c(1)]

write_tsv(vehicle163,"D:/Mario/Escritorio/Fijaciones/vehicle163.tsv")

ggplot(vehicle163, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle163_fixations <- subset(detect.fixations(vehicle163))

diagnostic.plot(vehicle163, vehicle163_fixations)

diagnostic.plot(vehicle163, vehicle163_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle163 <- calculate.summary(vehicle163_fixations)
round(stats_vehicle163, digits=2)



#Hacer rectangle en 163

rectangle163 <- subset(rawdata_163, Time >= 16518281635 & Time <= 16562620473)

rectangle163$time <- seq.int(nrow(rectangle163))*4
rectangle163 = rectangle163[,-c(1)]

write_tsv(rectangle163,"D:/Mario/Escritorio/Fijaciones/rectangle163.tsv")

ggplot(rectangle163, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle163_fixations <- subset(detect.fixations(rectangle163))

diagnostic.plot(rectangle163, rectangle163_fixations)

diagnostic.plot(rectangle163, rectangle163_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle163 <- calculate.summary(rectangle163_fixations)
round(stats_rectangle163, digits=2)

