rawdata_103 <- read_tsv("103_rawdata.tsv", comment = "#")

rawdata_103 <- rename(rawdata_103, time = Time)
rawdata_103 <- rename(rawdata_103, trial = Trial)
rawdata_103 <- rename(rawdata_103, x = 'L POR X [px]')
rawdata_103 <- rename(rawdata_103, y = 'L POR Y [px]')

rawdata_103 = rawdata_103[,-c(2)]

rawdata_103 = rawdata_103[,-c(3:20)]

rawdata_103 = rawdata_103[,-c(5:26)]

#Hacer vehicle en 103

vehicle103 <- subset(rawdata_103, time >= 203797947 & time <= 289208100)

ggplot(vehicle103, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle103_fixations <- subset(detect.fixations(vehicle103))

diagnostic.plot(vehicle103, vehicle103_fixations)

diagnostic.plot(vehicle103, vehicle103_fixations, start.time=203797947, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle103 <- calculate.summary(vehicle103_fixations)
round(stats_vehicle103, digits=2)

#Hacer rectangle en 103

rectangle103 <- subset(rawdata_103, time >= 327064036 & time <= 374334287)

ggplot(rectangle103, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle103_fixations <- subset(detect.fixations(rectangle103))

diagnostic.plot(rectangle103, rectangle103_fixations)

diagnostic.plot(rectangle103, rectangle103_fixations, start.time=327064036, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle103 <- calculate.summary(rectangle103_fixations)
round(stats_rectangle103, digits=2)

