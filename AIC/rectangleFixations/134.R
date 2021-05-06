rawdata_134 <- read_tsv("134_rawdata.tsv", comment = "#")

rawdata_134 <- rename(rawdata_134, trial = Trial)
rawdata_134 <- rename(rawdata_134, x = 'L POR X [px]')
rawdata_134 <- rename(rawdata_134, y = 'L POR Y [px]')

rawdata_134 <- rawdata_134 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 134

rectangle134 <- subset(rawdata_134, Time >= 1908567132 & Time <= 1928801254)

rectangle134$time <- seq.int(nrow(rectangle134))*4
rectangle134 = rectangle134[,-c(1)]

ggplot(rectangle134, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle134_fixations_save <- subset(detect.fixations(rectangle134), event=="fixation")

rectangle134_fixations_save$participant <- 134

#vamos a guardarlo
write_tsv(rectangle134_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/134.tsv")
