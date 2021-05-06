#En esta parte del código se enfoca a dividir a las personas que respondieron bien
#Las preguntas planteadas contra las que las respondieron mal

library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset")

emip <- read_csv("emip_metadata.csv")

head(emip)


#Para ello solo se van a seleccionar las personas que hayan realizado las mismas pruebas

program_java <- emip %>%
  filter(stimulus_vehicle == 'vehicle_java2.jpg' & stimulus_rectangle == 'rectangle_java2.jpg')

#De esto hay que ver cuales son las personas que contestaron correctamente ambas preguntas

javaExperts <- program_java %>%
  filter(correct_vehicle == 1 & correct_rectangle == 1 )
#24 personas

javaNoobs <- program_java %>%
  filter(correct_vehicle == 0 & correct_rectangle == 0 )
#28 personas

java2rectangle <- program_java %>%
  filter(correct_vehicle == 0 & correct_rectangle == 1 )

java2vehicle <- program_java %>%
  filter(correct_vehicle == 1 & correct_rectangle == 0 )













