setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_102 <- read_tsv("102_rawdata.tsv", comment = "#")

rawdata_102 <- rename(rawdata_102, trial = Trial)
rawdata_102 <- rename(rawdata_102, x = 'L POR X [px]')
rawdata_102 <- rename(rawdata_102, y = 'L POR Y [px]')

rawdata_102 <- rawdata_102 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 102

vehicle102 <- subset(rawdata_102, Time >= 11464685085 & Time <= 11519154796)

vehicle102$time <- seq.int(nrow(vehicle102))*4
vehicle102 = vehicle102[,-c(1)]

write_tsv(vehicle102,"D:/Mario/Escritorio/Fijaciones/vehicle102.tsv")

ggplot(vehicle102, aes(x, y)) +
  geom_point(alpha=0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080) +
  xlab("Eje X") +
  ylab("Eje Y") +
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12,face="bold"),
        axis.text.x = element_text(size=12, face="bold", colour = "black"), 
        # axis.text.y = element_text(size=12,  colour = "black"), # unbold
        axis.text.y = element_text(size=12, face="bold", colour = "black")
        )
  










vehicle102_fixations <- subset(detect.fixations(vehicle102))

diagnostic.plot(vehicle102, vehicle102_fixations)

diagnostic.plot(vehicle102, vehicle102_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle102 <- calculate.summary(vehicle102_fixations)
round(stats_vehicle102, digits=2)


#Hacer rectangle en 102

rectangle102 <- subset(rawdata_102, Time >= 11569737388 & Time <= 11632493852)

rectangle102$time <- seq.int(nrow(rectangle102))*4
rectangle102 = rectangle102[,-c(1)]

write_tsv(rectangle102,"D:/Mario/Escritorio/Fijaciones/rectangle102.tsv")

ggplot(rectangle102, aes(x, y)) +
  geom_point(alpha=0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle102_fixations <- subset(detect.fixations(rectangle102))

diagnostic.plot(rectangle102, rectangle102_fixations)

diagnostic.plot(rectangle102, rectangle102_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle102 <- calculate.summary(rectangle102_fixations)
round(stats_rectangle102, digits=2)

