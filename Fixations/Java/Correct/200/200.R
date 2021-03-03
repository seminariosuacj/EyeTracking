rawdata_200 <- read_tsv("200_rawdata.tsv", comment = "#")

rawdata_200 <- rename(rawdata_200, time = Time)
rawdata_200 <- rename(rawdata_200, trial = Trial)
rawdata_200 <- rename(rawdata_200, x = 'L POR X [px]')
rawdata_200 <- rename(rawdata_200, y = 'L POR Y [px]')

rawdata_200 = rawdata_200[,-c(2)]

rawdata_200 = rawdata_200[,-c(3:20)]

rawdata_200 = rawdata_200[,-c(5:26)]

#Hacer vehicle en 200

vehicle200 <- subset(rawdata_200, time >= 1783310400 & time <= 1864279521)

ggplot(vehicle200, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle200_fixations <- subset(detect.fixations(vehicle200))

diagnostic.plot(vehicle200, vehicle200_fixations)

diagnostic.plot(vehicle200, vehicle200_fixations, start.time=1783310400, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle200 <- calculate.summary(vehicle200_fixations)
round(stats_vehicle200, digits=2)

#Hacer rectangle en 200

rectangle200 <- subset(rawdata_200, time >= 1894984953 & time <= 2006107422)

ggplot(rectangle200, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle200_fixations <- subset(detect.fixations(rectangle200))

diagnostic.plot(rectangle200, rectangle200_fixations)

diagnostic.plot(rectangle200, rectangle200_fixations, start.time=1894984953, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle200 <- calculate.summary(rectangle200_fixations)
round(stats_rectangle200, digits=2)

