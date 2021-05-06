rawdata_130 <- read_tsv("130_rawdata.tsv", comment = "#")

rawdata_130 <- rename(rawdata_130, trial = Trial)
rawdata_130 <- rename(rawdata_130, x = 'L POR X [px]')
rawdata_130 <- rename(rawdata_130, y = 'L POR Y [px]')

rawdata_130 <- rawdata_130 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 130

rectangle130 <- subset(rawdata_130, Time >= 2439491804 & Time <= 2457392850)

rectangle130$time <- seq.int(nrow(rectangle130))*4
rectangle130 = rectangle130[,-c(1)]


ggplot(rectangle130, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle130_fixations_save <- subset(detect.fixations(rectangle130), event=="fixation")

rectangle130_fixations_save$participant <- 130

#vamos a guardarlo
write_tsv(rectangle130_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/130.tsv")
