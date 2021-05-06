rawdata_24 <- read_tsv("24_rawdata.tsv", comment = "#")

rawdata_24 <- rename(rawdata_24, trial = Trial)
rawdata_24 <- rename(rawdata_24, x = 'L POR X [px]')
rawdata_24 <- rename(rawdata_24, y = 'L POR Y [px]')

rawdata_24 <- rawdata_24 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 24

rectangle24 <- subset(rawdata_24, Time >= 2814911657 & Time <= 2859584607)

rectangle24$time <- seq.int(nrow(rectangle24))*4
rectangle24 = rectangle24[,-c(1)]

ggplot(rectangle24, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle24_fixations_save <- subset(detect.fixations(rectangle24), event=="fixation")

rectangle24_fixations_save$participant <- 24

#vamos a guardarlo
write_tsv(rectangle24_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/24.tsv")







