rawdata_172 <- read_tsv("172_rawdata.tsv", comment = "#")

rawdata_172 <- rename(rawdata_172, trial = Trial)
rawdata_172 <- rename(rawdata_172, x = 'L POR X [px]')
rawdata_172 <- rename(rawdata_172, y = 'L POR Y [px]')

rawdata_172 <- rawdata_172 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 172

rectangle172 <- subset(rawdata_172, Time >= 2338649627 & Time <= 2357424221)

rectangle172$time <- seq.int(nrow(rectangle172))*4
rectangle172 = rectangle172[,-c(1)]

ggplot(rectangle172, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle172_fixations_save <- subset(detect.fixations(rectangle172), event=="fixation")

rectangle172_fixations_save$participant <- 172

#vamos a guardarlo
write_tsv(rectangle172_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/172.tsv")
