setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_18 <- read_tsv("18_rawdata.tsv", comment = "#")

rawdata_18 <- rename(rawdata_18, trial = Trial)
rawdata_18 <- rename(rawdata_18, x = 'L POR X [px]')
rawdata_18 <- rename(rawdata_18, y = 'L POR Y [px]')

rawdata_18 <- rawdata_18 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle18 en 18

vehicle18 <- subset(rawdata_18, Time >= 26131669686 & Time <= 26230873264)

vehicle18$time <- seq.int(nrow(vehicle18))*4
vehicle18 = vehicle18[,-c(1)]

write_tsv(vehicle18,"D:/Mario/Escritorio/Fijaciones/vehicle18.tsv")

ggplot(vehicle18, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle18_fixations <- subset(detect.fixations(vehicle18))

diagnostic.plot(vehicle18, vehicle18_fixations)

diagnostic.plot(vehicle18, vehicle18_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle18 <- calculate.summary(vehicle18_fixations)
round(stats_vehicle18, digits=2)



#Hacer rectangle en 18

rectangle18 <- subset(rawdata_18, Time >= 26253039900 & Time <= 26312438111)

rectangle18$time <- seq.int(nrow(rectangle18))*4
rectangle18 = rectangle18[,-c(1)]

write_tsv(rectangle18,"D:/Mario/Escritorio/Fijaciones/rectangle18.tsv")

ggplot(rectangle18, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle18_fixations <- subset(detect.fixations(rectangle18))

diagnostic.plot(rectangle18, rectangle18_fixations)

diagnostic.plot(rectangle18, rectangle18_fixations, start.time=4, duration=100000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle18 <- calculate.summary(rectangle18_fixations)
round(stats_rectangle18, digits=2)

