rawdata_46 <- read_tsv("46_rawdata.tsv", comment = "#")

rawdata_46 <- rename(rawdata_46, trial = Trial)
rawdata_46 <- rename(rawdata_46, x = 'L POR X [px]')
rawdata_46 <- rename(rawdata_46, y = 'L POR Y [px]')

rawdata_46 <- rawdata_46 %>%
  select('Time','trial','x','y','L Validity')

#Hacer en rectangle

rectangle46 <- subset(rawdata_46, Time >= 473460893 & Time <= 513373929)

rectangle46$time <- seq.int(nrow(rectangle46))*4
rectangle46 = rectangle46[,-c(1)]

ggplot(rectangle46, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle46_fixations_save <- subset(detect.fixations(rectangle46), event=="fixation")

rectangle46_fixations_save$participant <- 46

#vamos a guardarlo
write_tsv(rectangle46_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/46.tsv")


