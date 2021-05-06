rawdata_102 <- read_tsv("102_rawdata.tsv", comment = "#")

rawdata_102 <- rename(rawdata_102, trial = Trial)
rawdata_102 <- rename(rawdata_102, x = 'L POR X [px]')
rawdata_102 <- rename(rawdata_102, y = 'L POR Y [px]')

rawdata_102 <- rawdata_102 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 102

rectangle102 <- subset(rawdata_102, Time >= 11569737388 & Time <= 11632493852)

rectangle102$time <- seq.int(nrow(rectangle102))*4
rectangle102 = rectangle102[,-c(1)]

ggplot(rectangle102, aes(x, y)) +
  geom_point(alpha=0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle102_fixations_save <- subset(detect.fixations(rectangle102), event=="fixation")

rectangle102_fixations_save$participant <- 102

#vamos a guardarlo
write_tsv(rectangle102_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/102.tsv")

