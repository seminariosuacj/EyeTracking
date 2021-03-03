#En esta parte del código se enfoca a dividir a las personas que respondieron bien
#Las preguntas planteadas contra las que las respondieron mal

library(stats)

library(readr)
library(dplyr)

setwd("D:/Mario/Escritorio/dataset/emip_dataset")
getwd

emip <- read_csv("emip_metadata.csv")

head(emip)

#Para ello solo se van a seleccionar las personas que hayan realizado las mismas pruebas

program_python <- emip %>%
  filter(stimulus_rectangle == 'rectangle_python.jpg' & stimulus_vehicle == 'vehicle_python.jpg')

#De esto hay que ver cuales son las personas que contestaron correctamente ambas preguntas

program_python <- program_python %>%
  select(id, english_level, correct_rectangle, correct_vehicle)




