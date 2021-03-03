rawdata_204 <- read_tsv("204_rawdata.tsv", comment = "#")

rawdata_204 <- rename(rawdata_204, time = Time)
rawdata_204 <- rename(rawdata_204, trial = Trial)
rawdata_204 <- rename(rawdata_204, x = 'L POR X [px]')
rawdata_204 <- rename(rawdata_204, y = 'L POR Y [px]')

rawdata_204 = rawdata_204[,-c(2)]

rawdata_204 = rawdata_204[,-c(3:20)]

rawdata_204 = rawdata_204[,-c(5:26)]

#Hacer vehicle en 204

vehicle204 <- subset(rawdata_204, time >= 6087824780 & time <= 6111174758)

ggplot(vehicle204, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle204_fixations <- subset(detect.fixations(vehicle204))

diagnostic.plot(vehicle204, vehicle204_fixations)

diagnostic.plot(vehicle204, vehicle204_fixations, start.time=6087824780, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle204 <- calculate.summary(vehicle204_fixations)
round(stats_vehicle204, digits=2)

#Hacer rectangle en 204

rectangle204 <- subset(rawdata_204, time >= 6087824780 & time <= 6111174758)

ggplot(rectangle204, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle204_fixations <- subset(detect.fixations(rectangle204))

diagnostic.plot(rectangle204, rectangle204_fixations)

diagnostic.plot(rectangle204, rectangle204_fixations, start.time=6087824780, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle204 <- calculate.summary(rectangle204_fixations)
round(stats_rectangle204, digits=2)

