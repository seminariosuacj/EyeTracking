rawdata_146 <- read_tsv("146_rawdata.tsv", comment = "#")

rawdata_146 <- rename(rawdata_146, trial = Trial)
rawdata_146 <- rename(rawdata_146, x = 'L POR X [px]')
rawdata_146 <- rename(rawdata_146, y = 'L POR Y [px]')

rawdata_146 <- rawdata_146 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 146

rectangle146 <- subset(rawdata_146, Time >= 1074083512 & Time <= 1106652730)

rectangle146$time <- seq.int(nrow(rectangle146))*4
rectangle146 = rectangle146[,-c(1)]

ggplot(rectangle146, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle146_fixations_save <- subset(detect.fixations(rectangle146), event=="fixation")

rectangle146_fixations_save$participant <- 146

#vamos a guardarlo
write_tsv(rectangle146_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/146.tsv")

