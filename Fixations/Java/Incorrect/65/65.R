rawdata_65 <- read_tsv("65_rawdata.tsv", comment = "#")

rawdata_65 <- rename(rawdata_65, time = Time)
rawdata_65 <- rename(rawdata_65, trial = Trial)
rawdata_65 <- rename(rawdata_65, x = 'L POR X [px]')
rawdata_65 <- rename(rawdata_65, y = 'L POR Y [px]')

rawdata_65 = rawdata_65[,-c(2)]

rawdata_65 = rawdata_65[,-c(3:20)]

rawdata_65 = rawdata_65[,-c(5:26)]

#Hacer rectangle en 65

rectangle65 <- subset(rawdata_65, time >= 3957020951 & time <= 4013827726)

ggplot(rectangle65, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle65_fixations <- subset(detect.fixations(rectangle65))

diagnostic.plot(rectangle65, rectangle65_fixations)

diagnostic.plot(rectangle65, rectangle65_fixations, start.time=3957020951, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle65 <- calculate.summary(rectangle65_fixations)
round(stats_rectangle65, digits=2)

#Hacer vehicle en 65

vehicle65 <- subset(rawdata_65, time >= 4036558159 & time <= 4095070495)

ggplot(vehicle65, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle65_fixations <- subset(detect.fixations(vehicle65))

diagnostic.plot(vehicle65, vehicle65_fixations)

diagnostic.plot(vehicle65, vehicle65_fixations, start.time=4036558159, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle65 <- calculate.summary(vehicle65_fixations)
round(stats_vehicle65, digits=2)
