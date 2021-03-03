#En esta parte del código se enfoca a dividir a las personas que respondieron bien
#Las preguntas planteadas contra las que las respondieron mal

library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset")
getwd

emip <- read_csv("emip_metadata.csv")

head(emip)


#Para ello solo se van a seleccionar las personas que hayan realizado las mismas pruebas

program_java <- emip %>%
  filter(stimulus_vehicle == 'vehicle_java.jpg' & stimulus_rectangle == 'rectangle_java.jpg')

#De esto hay que ver cuales son las personas que contestaron correctamente ambas preguntas

javaExperts <- program_java %>%
  filter(correct_vehicle == 1 & correct_rectangle == 1 )
#39 130 131 146

javaNoobs <- program_java %>%
  filter(correct_vehicle == 0 & correct_rectangle == 0 )
#1 6 10 11 18 27 40 45 54 59 62 63 75 81 85 92 100 104 111 113 125 137 144 160 162 163 169 173 194 198 199 202 209






experts_in_java2 # 24 personas














#De las personas que realizaron la prueba con rectangle_java2.jpg y vehicle_java2.jpg
#Mientras que las personas que se equivocaron en ambas preguntas son las siguientes:

noobs_in_java2 <- program_java2 %>%
  filter(correct_vehicle == 0 & correct_rectangle == 0) # 28 personas
