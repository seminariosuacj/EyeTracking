rawdata_123 <- read_tsv("123_rawdata.tsv", comment = "#")

rawdata_123 <- rename(rawdata_123, trial = Trial)
rawdata_123 <- rename(rawdata_123, x = 'L POR X [px]')
rawdata_123 <- rename(rawdata_123, y = 'L POR Y [px]')

rawdata_123 <- rawdata_123 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 123

rectangle123 <- subset(rawdata_123, Time >= 1842474019 & Time <= 1882497336)

rectangle123$time <- seq.int(nrow(rectangle123))*4
rectangle123 = rectangle123[,-c(1)]

ggplot(rectangle123, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle123_fixations_save <- subset(detect.fixations(rectangle123), event=="fixation")

rectangle123_fixations_save$participant <- 123

#vamos a guardarlo
write_tsv(rectangle123_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/123.tsv")
