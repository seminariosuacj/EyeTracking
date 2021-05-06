rawdata_206 <- read_tsv("206_rawdata.tsv", comment = "#")

rawdata_206 <- rename(rawdata_206, trial = Trial)
rawdata_206 <- rename(rawdata_206, x = 'L POR X [px]')
rawdata_206 <- rename(rawdata_206, y = 'L POR Y [px]')

rawdata_206 <- rawdata_206 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 206

rectangle206 <- subset(rawdata_206, Time >= 1656988222 & Time <= 1731877891)

rectangle206$time <- seq.int(nrow(rectangle206))*4
rectangle206 = rectangle206[,-c(1)]

ggplot(rectangle206, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle206_fixations_save <- subset(detect.fixations(rectangle206), event=="fixation")

rectangle206_fixations_save$participant <- 206

#vamos a guardarlo
write_tsv(rectangle206_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/206.tsv")

