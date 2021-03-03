rawdata_36 <- read_tsv("36_rawdata.tsv", comment = "#")

rawdata_36 <- rename(rawdata_36, time = Time)
rawdata_36 <- rename(rawdata_36, trial = Trial)
rawdata_36 <- rename(rawdata_36, x = 'L POR X [px]')
rawdata_36 <- rename(rawdata_36, y = 'L POR Y [px]')

rawdata_36 = rawdata_36[,-c(2)]

rawdata_36 = rawdata_36[,-c(3:20)]

rawdata_36 = rawdata_36[,-c(5:26)]

#Hacer rectangle en 36

rectangle36 <- subset(rawdata_36, time >= 6681894908 & time <= 6708080627)

ggplot(rectangle36, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle36_fixations <- subset(detect.fixations(rectangle36))

diagnostic.plot(rectangle36, rectangle36_fixations)

diagnostic.plot(rectangle36, rectangle36_fixations, start.time=6681894908, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle36 <- calculate.summary(rectangle36_fixations)
round(stats_rectangle36, digits=2)

#Hacer vehicle en 36

vehicle36 <- subset(rawdata_36, time >= 6722687440 & time <= 6763059989)

ggplot(vehicle36, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle36_fixations <- subset(detect.fixations(vehicle36))

diagnostic.plot(vehicle36, vehicle36_fixations)

diagnostic.plot(vehicle36, vehicle36_fixations, start.time=6722687440, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle36 <- calculate.summary(vehicle36_fixations)
round(stats_vehicle36, digits=2)
