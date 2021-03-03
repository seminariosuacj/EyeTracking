rawdata_118 <- read_tsv("118_rawdata.tsv", comment = "#")

rawdata_118 <- rename(rawdata_118, time = Time)
rawdata_118 <- rename(rawdata_118, trial = Trial)
rawdata_118 <- rename(rawdata_118, x = 'L POR X [px]')
rawdata_118 <- rename(rawdata_118, y = 'L POR Y [px]')

rawdata_118 = rawdata_118[,-c(2)]

rawdata_118 = rawdata_118[,-c(3:20)]

rawdata_118 = rawdata_118[,-c(5:26)]

#Hacer rectangle en 118

rectangle118 <- subset(rawdata_118, time >= 7527215114 & time <= 7589226731)

ggplot(rectangle118, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle118_fixations <- subset(detect.fixations(rectangle118))

diagnostic.plot(rectangle118, rectangle118_fixations)

diagnostic.plot(rectangle118, rectangle118_fixations, start.time=7527215114, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle118 <- calculate.summary(rectangle118_fixations)
round(stats_rectangle118, digits=2)

#Hacer vehicle en 118

vehicle118 <- subset(rawdata_118, time >= 7605217727 & time <= 7639023352)

ggplot(vehicle118, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle118_fixations <- subset(detect.fixations(vehicle118))

diagnostic.plot(vehicle118, vehicle118_fixations)

diagnostic.plot(vehicle118, vehicle118_fixations, start.time=7605217727, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle118 <- calculate.summary(vehicle118_fixations)
round(stats_vehicle118, digits=2)
