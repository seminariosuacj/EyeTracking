rawdata_208 <- read_tsv("208_rawdata.tsv", comment = "#")

rawdata_208 <- rename(rawdata_208, trial = Trial)
rawdata_208 <- rename(rawdata_208, x = 'L POR X [px]')
rawdata_208 <- rename(rawdata_208, y = 'L POR Y [px]')

rawdata_208 <- rawdata_208 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 208

rectangle208 <- subset(rawdata_208, Time >= 1852554062 & Time <= 1921896318)

rectangle208$time <- seq.int(nrow(rectangle208))*4
rectangle208 = rectangle208[,-c(1)]

ggplot(rectangle208, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle208_fixations_save <- subset(detect.fixations(rectangle208), event=="fixation")

rectangle208_fixations_save$participant <- 208

#vamos a guardarlo
write_tsv(rectangle208_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/208.tsv")
