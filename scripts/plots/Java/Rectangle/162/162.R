setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_162 <- read_tsv("162_rawdata.tsv", comment = "#")

rawdata_162 <- rename(rawdata_162, trial = Trial)
rawdata_162 <- rename(rawdata_162, x = 'L POR X [px]')
rawdata_162 <- rename(rawdata_162, y = 'L POR Y [px]')

rawdata_162 <- rawdata_162 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 162

rectangle162 <- subset(rawdata_162, Time >= 2570047128 & Time <= 2635218646)

rectangle162$time <- seq.int(nrow(rectangle162))*4
rectangle162 = rectangle162[,-c(1)]

write_tsv(rectangle162,"D:/Mario/Escritorio/Fijaciones/rectangle162.tsv")

ggplot(rectangle162, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle162_fixations <- subset(detect.fixations(rectangle162))

diagnostic.plot(rectangle162, rectangle162_fixations)

diagnostic.plot(rectangle162, rectangle162_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle162 <- calculate.summary(rectangle162_fixations)
round(stats_rectangle162, digits=2)



#Hacer vehicle en 162

vehicle162 <- subset(rawdata_162, Time >= 2654729561 & Time <= 2733783727)

vehicle162$time <- seq.int(nrow(vehicle162))*4
vehicle162 = vehicle162[,-c(1)]

write_tsv(vehicle162,"D:/Mario/Escritorio/Fijaciones/vehicle162.tsv")

ggplot(vehicle162, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle162_fixations <- subset(detect.fixations(vehicle162))

diagnostic.plot(vehicle162, vehicle162_fixations)

diagnostic.plot(vehicle162, vehicle162_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle162 <- calculate.summary(vehicle162_fixations)
round(stats_vehicle162, digits=2)





