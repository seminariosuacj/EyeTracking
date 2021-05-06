setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_130 <- read_tsv("130_rawdata.tsv", comment = "#")

rawdata_130 <- rename(rawdata_130, trial = Trial)
rawdata_130 <- rename(rawdata_130, x = 'L POR X [px]')
rawdata_130 <- rename(rawdata_130, y = 'L POR Y [px]')

rawdata_130 <- rawdata_130 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 130

vehicle130 <- subset(rawdata_130, Time >= 2408194038 & Time <= 2421848724)

vehicle130$time <- seq.int(nrow(vehicle130))*4
vehicle130 = vehicle130[,-c(1)]

write_tsv(vehicle130,"D:/Mario/Escritorio/Fijaciones/vehicle130.tsv")

ggplot(vehicle130, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle130_fixations <- subset(detect.fixations(vehicle130))

diagnostic.plot(vehicle130, vehicle130_fixations)

diagnostic.plot(vehicle130, vehicle130_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle130 <- calculate.summary(vehicle130_fixations)
round(stats_vehicle130, digits=2)



#Hacer rectangle en 130

rectangle130 <- subset(rawdata_130, Time >= 2439491804 & Time <= 2457392850)

rectangle130$time <- seq.int(nrow(rectangle130))*4
rectangle130 = rectangle130[,-c(1)]

write_tsv(rectangle130,"D:/Mario/Escritorio/Fijaciones/rectangle130.tsv")

ggplot(rectangle130, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle130_fixations <- subset(detect.fixations(rectangle130))

diagnostic.plot(rectangle130, rectangle130_fixations)

diagnostic.plot(rectangle130, rectangle130_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle130 <- calculate.summary(rectangle130_fixations)
round(stats_rectangle130, digits=2)

