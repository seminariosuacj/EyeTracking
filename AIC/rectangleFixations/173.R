rawdata_173 <- read_tsv("173_rawdata.tsv", comment = "#")

rawdata_173 <- rename(rawdata_173, trial = Trial)
rawdata_173 <- rename(rawdata_173, x = 'L POR X [px]')
rawdata_173 <- rename(rawdata_173, y = 'L POR Y [px]')

rawdata_173 <- rawdata_173 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 173

rectangle173 <- subset(rawdata_173, Time >= 10020683188 & Time <= 10063946045)

rectangle173$time <- seq.int(nrow(rectangle173))*4
rectangle173 = rectangle173[,-c(1)]

ggplot(rectangle173, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle173_fixations_save <- subset(detect.fixations(rectangle173))

rectangle173_fixations_save$participant <- 173

#vamos a guardarlo
write_tsv(rectangle173_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/173.tsv")
