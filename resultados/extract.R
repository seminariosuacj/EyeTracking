library(stats)
library(readr)
library(dplyr)
library(ggplot2)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset")

emip <- read_csv("emip_metadata.csv")

onlyJava <- emip %>%
  filter(stimulus_vehicle == 'vehicle_java.jpg' & stimulus_rectangle == 'rectangle_java.jpg' |
         stimulus_vehicle == 'vehicle_java2.jpg' & stimulus_rectangle == 'rectangle_java2.jpg')


emip <- onlyJava %>% 
  select(id, age, gender, mother_tongue, english_level, visual_aid, expertise_experiment_language, time_experiment_language, frequency_experiment_language, expertise_programming, time_programming, frequency_other_language, order_rectangle, order_vehicle, correct_rectangle, correct_vehicle, stimulus_rectangle, stimulus_vehicle)



write_csv(emip,"D:/Mario/Escritorio/emipData.csv")
