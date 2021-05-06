setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_81 <- read_tsv("81_rawdata.tsv", comment = "#")

rawdata_81 <- rename(rawdata_81, trial = Trial)
rawdata_81 <- rename(rawdata_81, x = 'L POR X [px]')
rawdata_81 <- rename(rawdata_81, y = 'L POR Y [px]')

rawdata_81 <- rawdata_81 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 81

vehicle81 <- subset(rawdata_81, Time >= 1851930598 & Time <= 1926456514)

vehicle81$time <- seq.int(nrow(vehicle81))*4
vehicle81 = vehicle81[,-c(1)]

write_tsv(vehicle81,"D:/Mario/Escritorio/Fijaciones/vehicle81.tsv")

ggplot(vehicle81, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle81_fixations <- subset(detect.fixations(vehicle81))

diagnostic.plot(vehicle81, vehicle81_fixations)

diagnostic.plot(vehicle81, vehicle81_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle81 <- calculate.summary(vehicle81_fixations)
round(stats_vehicle81, digits=2)


#Hacer rectangle en 81

rectangle81 <- subset(rawdata_81, Time >= 1957553773 & Time <= 1989583134)

rectangle81$time <- seq.int(nrow(rectangle81))*4
rectangle81 = rectangle81[,-c(1)]

write_tsv(rectangle81,"D:/Mario/Escritorio/Fijaciones/rectangle81.tsv")

ggplot(rectangle81, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle81_fixations <- subset(detect.fixations(rectangle81))

diagnostic.plot(rectangle81, rectangle81_fixations)

diagnostic.plot(rectangle81, rectangle81_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle81 <- calculate.summary(rectangle81_fixations)
round(stats_rectangle81, digits=2)

