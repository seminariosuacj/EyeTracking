rawdata_11 <- read_tsv("11_rawdata.tsv", comment = "#")

rawdata_11 <- rename(rawdata_11, trial = Trial)
rawdata_11 <- rename(rawdata_11, x = 'L POR X [px]')
rawdata_11 <- rename(rawdata_11, y = 'L POR Y [px]')

rawdata_11 <- rawdata_11 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 11

rectangle11 <- subset(rawdata_11, Time >= 9556736415 & Time <= 9600044959)

rectangle11$time <- seq.int(nrow(rectangle11))*4
rectangle11 = rectangle11[,-c(1)]

ggplot(rectangle11, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle11_fixations_save <- subset(detect.fixations(rectangle11), event=="fixation")

rectangle11_fixations_save$participant <- 11

#vamos a guardarlo
write_tsv(rectangle11_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/11.tsv")

