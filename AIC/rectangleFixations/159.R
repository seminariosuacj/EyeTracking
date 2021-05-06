rawdata_159 <- read_tsv("159_rawdata.tsv", comment = "#")

rawdata_159 <- rename(rawdata_159, trial = Trial)
rawdata_159 <- rename(rawdata_159, x = 'L POR X [px]')
rawdata_159 <- rename(rawdata_159, y = 'L POR Y [px]')

rawdata_159 <- rawdata_159 %>%
  select('Time','trial','x','y','L Validity')




#Hacer rectangle en 159

rectangle159 <- subset(rawdata_159, Time >= 32507811659 & Time <= 32532182111)

rectangle159$time <- seq.int(nrow(rectangle159))*4
rectangle159 = rectangle159[,-c(1)]

ggplot(rectangle159, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle159_fixations_save <- subset(detect.fixations(rectangle159), event=="fixation")

rectangle159_fixations_save$participant <- 159

#vamos a guardarlo
write_tsv(rectangle159_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/159.tsv")


