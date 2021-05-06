setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_196 <- read_tsv("196_rawdata.tsv", comment = "#")

rawdata_196 <- rename(rawdata_196, trial = Trial)
rawdata_196 <- rename(rawdata_196, x = 'L POR X [px]')
rawdata_196 <- rename(rawdata_196, y = 'L POR Y [px]')

rawdata_196 <- rawdata_196 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 196

vehicle196 <- subset(rawdata_196, Time >= 9364648999 & Time <= 9406906216)

vehicle196$time <- seq.int(nrow(vehicle196))*4
vehicle196 = vehicle196[,-c(1)]
write_tsv(vehicle196,"D:/Mario/Escritorio/Fijaciones/vehicle196.tsv")

ggplot(vehicle196, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle196_fixations <- subset(detect.fixations(vehicle196))

diagnostic.plot(vehicle196, vehicle196_fixations)

diagnostic.plot(vehicle196, vehicle196_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle196 <- calculate.summary(vehicle196_fixations)
round(stats_vehicle196, digits=2)

#Hacer rectangle en 196

rectangle196 <- subset(rawdata_196, Time >= 9430804613 & Time <= 9503239387)

rectangle196$time <- seq.int(nrow(rectangle196))*4
rectangle196 = rectangle196[,-c(1)]
write_tsv(rectangle196,"D:/Mario/Escritorio/Fijaciones/rectangle196.tsv")

ggplot(rectangle196, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed()  +
  expand_limits(x = 1920, y = 1080)

rectangle196_fixations <- subset(detect.fixations(rectangle196))

diagnostic.plot(rectangle196, rectangle196_fixations)

diagnostic.plot(rectangle196, rectangle196_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle196 <- calculate.summary(rectangle196_fixations)
round(stats_rectangle196, digits=2)

