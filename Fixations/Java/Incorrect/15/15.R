rawdata_15 <- read_tsv("15_rawdata.tsv", comment = "#")

rawdata_15 <- rename(rawdata_15, time = Time)
rawdata_15 <- rename(rawdata_15, trial = Trial)
rawdata_15 <- rename(rawdata_15, x = 'L POR X [px]')
rawdata_15 <- rename(rawdata_15, y = 'L POR Y [px]')

rawdata_15 = rawdata_15[,-c(2)]

rawdata_15 = rawdata_15[,-c(3:20)]

rawdata_15 = rawdata_15[,-c(5:26)]

#Hacer rectangle en 15

rectangle15 <- subset(rawdata_15, time >= 15493906692 & time <= 15537834882)

ggplot(rectangle15, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle15_fixations <- subset(detect.fixations(rectangle15))

diagnostic.plot(rectangle15, rectangle15_fixations)

diagnostic.plot(rectangle15, rectangle15_fixations, start.time=15493906692, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle15 <- calculate.summary(rectangle15_fixations)
round(stats_rectangle15, digits=2)

#Hacer vehicle en 15

vehicle15 <- subset(rawdata_15, time >= 15553585648 & time <= 15622875608)

ggplot(vehicle15, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle15_fixations <- subset(detect.fixations(vehicle15))

diagnostic.plot(vehicle15, vehicle15_fixations)

diagnostic.plot(vehicle15, vehicle15_fixations, start.time=15553585648, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle15 <- calculate.summary(vehicle15_fixations)
round(stats_vehicle15, digits=2)
