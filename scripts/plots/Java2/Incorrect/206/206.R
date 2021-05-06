setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_206 <- read_tsv("206_rawdata.tsv", comment = "#")

rawdata_206 <- rename(rawdata_206, trial = Trial)
rawdata_206 <- rename(rawdata_206, x = 'L POR X [px]')
rawdata_206 <- rename(rawdata_206, y = 'L POR Y [px]')

rawdata_206 <- rawdata_206 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 206

vehicle206 <- subset(rawdata_206, Time >= 1563448079 & Time <= 1621943190)

vehicle206$time <- seq.int(nrow(vehicle206))*4
vehicle206 = vehicle206[,-c(1)]
write_tsv(vehicle206,"D:/Mario/Escritorio/Fijaciones/vehicle206.tsv")

ggplot(vehicle206, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle206_fixations <- subset(detect.fixations(vehicle206))

diagnostic.plot(vehicle206, vehicle206_fixations)

diagnostic.plot(vehicle206, vehicle206_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle206 <- calculate.summary(vehicle206_fixations)
round(stats_vehicle206, digits=2)


#Hacer rectangle en 206

rectangle206 <- subset(rawdata_206, Time >= 1656988222 & Time <= 1731877891)

rectangle206$time <- seq.int(nrow(rectangle206))*4
rectangle206 = rectangle206[,-c(1)]
write_tsv(rectangle206,"D:/Mario/Escritorio/Fijaciones/rectangle206.tsv")

ggplot(rectangle206, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle206_fixations <- subset(detect.fixations(rectangle206))

diagnostic.plot(rectangle206, rectangle206_fixations)

diagnostic.plot(rectangle206, rectangle206_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle206 <- calculate.summary(rectangle206_fixations)
round(stats_rectangle206, digits=2)

