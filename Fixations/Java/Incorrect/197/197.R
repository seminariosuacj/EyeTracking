rawdata_197 <- read_tsv("197_rawdata.tsv", comment = "#")

rawdata_197 <- rename(rawdata_197, time = Time)
rawdata_197 <- rename(rawdata_197, trial = Trial)
rawdata_197 <- rename(rawdata_197, x = 'L POR X [px]')
rawdata_197 <- rename(rawdata_197, y = 'L POR Y [px]')

rawdata_197 = rawdata_197[,-c(2)]

rawdata_197 = rawdata_197[,-c(3:20)]

rawdata_197 = rawdata_197[,-c(5:26)]

#Hacer vehicle en 197

vehicle197 <- subset(rawdata_197, time >= 13005490453 & time <= 13077304359)

ggplot(vehicle197, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle197_fixations <- subset(detect.fixations(vehicle197))

diagnostic.plot(vehicle197, vehicle197_fixations)

diagnostic.plot(vehicle197, vehicle197_fixations, start.time=13005490453, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle197 <- calculate.summary(vehicle197_fixations)
round(stats_vehicle197, digits=2)

#Hacer rectangle en 197

rectangle197 <- subset(rawdata_197, time >= 13088147336 & time <= 13128372156)

ggplot(rectangle197, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle197_fixations <- subset(detect.fixations(rectangle197))

diagnostic.plot(rectangle197, rectangle197_fixations)

diagnostic.plot(rectangle197, rectangle197_fixations, start.time=13088147336, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle197 <- calculate.summary(rectangle197_fixations)
round(stats_rectangle197, digits=2)

