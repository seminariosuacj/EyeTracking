rawdata_140 <- read_tsv("140_rawdata.tsv", comment = "#")

rawdata_140 <- rename(rawdata_140, trial = Trial)
rawdata_140 <- rename(rawdata_140, x = 'L POR X [px]')
rawdata_140 <- rename(rawdata_140, y = 'L POR Y [px]')

rawdata_140 <- rawdata_140 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 140

rectangle140 <- subset(rawdata_140, Time >= 1158100094 & Time <= 1184570289)

rectangle140$time <- seq.int(nrow(rectangle140))*4
rectangle140 = rectangle140[,-c(1)]

ggplot(rectangle140, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle140_fixations_save <- subset(detect.fixations(rectangle140), event=="fixation")

rectangle140_fixations_save$participant <- 140

#vamos a guardarlo
write_tsv(rectangle140_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/140.tsv")

