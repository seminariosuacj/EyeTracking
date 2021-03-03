rawdata_195 <- read_tsv("195_rawdata.tsv", comment = "#")

rawdata_195 <- rename(rawdata_195, time = Time)
rawdata_195 <- rename(rawdata_195, trial = Trial)
rawdata_195 <- rename(rawdata_195, x = 'L POR X [px]')
rawdata_195 <- rename(rawdata_195, y = 'L POR Y [px]')

rawdata_195 = rawdata_195[,-c(2)]

rawdata_195 = rawdata_195[,-c(3:20)]

rawdata_195 = rawdata_195[,-c(5:26)]


#Hacer vehicle en 195

vehicle195 <- subset(rawdata_195, time >= 610282307 & time <= 659902866)

ggplot(vehicle195, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle195_fixations <- subset(detect.fixations(vehicle195))

diagnostic.plot(vehicle195, vehicle195_fixations)

diagnostic.plot(vehicle195, vehicle195_fixations, start.time=610282307, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle195 <- calculate.summary(vehicle195_fixations)
round(stats_vehicle195, digits=2)

#Hacer rectangle en 195

rectangle195 <- subset(rawdata_195, time >= 679901935 & time <= 757292016)

ggplot(rectangle195, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle195_fixations <- subset(detect.fixations(rectangle195))

diagnostic.plot(rectangle195, rectangle195_fixations)

diagnostic.plot(rectangle195, rectangle195_fixations, start.time=679901935, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle195 <- calculate.summary(rectangle195_fixations)
round(stats_rectangle195, digits=2)

