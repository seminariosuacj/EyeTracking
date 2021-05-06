rawdata_129 <- read_tsv("129_rawdata.tsv", comment = "#")

rawdata_129 <- rename(rawdata_129, trial = Trial)
rawdata_129 <- rename(rawdata_129, x = 'L POR X [px]')
rawdata_129 <- rename(rawdata_129, y = 'L POR Y [px]')

rawdata_129 <- rawdata_129 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 129

rectangle129 <- subset(rawdata_129, Time >= 14163056256 & Time <= 14193361076)

rectangle129$time <- seq.int(nrow(rectangle129))*4
rectangle129 = rectangle129[,-c(1)]

ggplot(rectangle129, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle129_fixations_save <- subset(detect.fixations(rectangle129), event=="fixation")

rectangle129_fixations_save$participant <- 129

#vamos a guardarlo
write_tsv(rectangle129_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/129.tsv")
