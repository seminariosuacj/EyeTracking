rawdata_192 <- read_tsv("192_rawdata.tsv", comment = "#")

rawdata_192 <- rename(rawdata_192, time = Time)
rawdata_192 <- rename(rawdata_192, trial = Trial)
rawdata_192 <- rename(rawdata_192, x = 'L POR X [px]')
rawdata_192 <- rename(rawdata_192, y = 'L POR Y [px]')

rawdata_192 = rawdata_192[,-c(2)]

rawdata_192 = rawdata_192[,-c(3:20)]

rawdata_192 = rawdata_192[,-c(5:26)]

#Hacer rectangle en 192

rectangle192 <- subset(rawdata_192, time >= 8333322962 & time <= 8422037319)

ggplot(rectangle192, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle192_fixations <- subset(detect.fixations(rectangle192))

diagnostic.plot(rectangle192, rectangle192_fixations)

diagnostic.plot(rectangle192, rectangle192_fixations, start.time=8333322962, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle192 <- calculate.summary(rectangle192_fixations)
round(stats_rectangle192, digits=2)

#Hacer vehicle en 192

vehicle192 <- subset(rawdata_192, time >= 8460428246 & time <= 8503950733)

ggplot(vehicle192, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle192_fixations <- subset(detect.fixations(vehicle192))

diagnostic.plot(vehicle192, vehicle192_fixations)

diagnostic.plot(vehicle192, vehicle192_fixations, start.time=8460428246, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle192 <- calculate.summary(vehicle192_fixations)
round(stats_vehicle192, digits=2)
