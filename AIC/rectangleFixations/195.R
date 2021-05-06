rawdata_195 <- read_tsv("195_rawdata.tsv", comment = "#")

rawdata_195 <- rename(rawdata_195, trial = Trial)
rawdata_195 <- rename(rawdata_195, x = 'L POR X [px]')
rawdata_195 <- rename(rawdata_195, y = 'L POR Y [px]')

rawdata_195 <- rawdata_195 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 195

rectangle195 <- subset(rawdata_195, Time >= 679901935 & Time <= 757292016)

rectangle195$time <- seq.int(nrow(rectangle195))*4
rectangle195 = rectangle195[,-c(1)]


ggplot(rectangle195, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle195_fixations_save <- subset(detect.fixations(rectangle195), event=="fixation")

rectangle195_fixations_save$participant <- 195

#vamos a guardarlo
write_tsv(rectangle195_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/195.tsv")
