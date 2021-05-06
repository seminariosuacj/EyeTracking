setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_146 <- read_tsv("146_rawdata.tsv", comment = "#")

rawdata_146 <- rename(rawdata_146, trial = Trial)
rawdata_146 <- rename(rawdata_146, x = 'L POR X [px]')
rawdata_146 <- rename(rawdata_146, y = 'L POR Y [px]')

rawdata_146 <- rawdata_146 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 146

rectangle146 <- subset(rawdata_146, Time >= 1074083512 & Time <= 1106652730)

rectangle146$time <- seq.int(nrow(rectangle146))*4
rectangle146 = rectangle146[,-c(1)]

write_tsv(rectangle146,"D:/Mario/Escritorio/Fijaciones/rectangle146.tsv")

ggplot(rectangle146, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle146_fixations <- subset(detect.fixations(rectangle146))

diagnostic.plot(rectangle146, rectangle146_fixations)

diagnostic.plot(rectangle146, rectangle146_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle146 <- calculate.summary(rectangle146_fixations)
round(stats_rectangle146, digits=2)



#Hacer vehicle en 146

vehicle146 <- subset(rawdata_146, Time >= 1132210566 & Time <= 1181746381)

vehicle146$time <- seq.int(nrow(vehicle146))*4
vehicle146 = vehicle146[,-c(1)]

write_tsv(vehicle146,"D:/Mario/Escritorio/Fijaciones/vehicle146.tsv")

ggplot(vehicle146, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle146_fixations <- subset(detect.fixations(vehicle146))

diagnostic.plot(vehicle146, vehicle146_fixations)

diagnostic.plot(vehicle146, vehicle146_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle146 <- calculate.summary(vehicle146_fixations)
round(stats_vehicle146, digits=2)





