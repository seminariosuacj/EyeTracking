#Este es el SC de los resultados finales

#Primero cargar el dataset
library(stats)
library(readr)
library(dplyr)
library(ggplot2)

setwd("D:/Mario/Documents/Eye Movements In Programming/resultados")

rectangle <- read_csv("emipDataFinal.csv")

#�Qu� l�neas leyeron m�s los participantes?
#Crear factores de las l�neas para identificar r�pidamente

factor(rectangle$line_rectangle)

rectangle$line_rectangle <- factor(rectangle$line_rectangle,
                levels = c("1", "2", "3", "7", "9", "10", "11", "12", "13", "14", "15"))

rectangle %>%
  group_by(line_rectangle) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = line_rectangle, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.15, hjust = 1) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -1.22, hjust = 0.6) +
  labs(x = 'L�neas', y = 'N�mero de observaciones') + 
  theme_minimal() +
  theme(axis.text=element_text(size=14),
        axis.title=element_text(size=14),
        axis.text.x = element_text(size=12, colour = "black"),
        axis.text.y = element_text(size=12, colour = "black")
  )




#Ver por ejemplo que tipo de personas vieron la l�nea 1 y la 7
rectangle %>% 
  filter(line_rectangle == 1)

rectangle %>% 
  filter(line_rectangle == 7)

#�Qu� tipo de l�neas leyeron m�s?
#Aqu� ver primero las variables categoricas

factor(rectangle$type_rectangle) #ver los niveles que hay

rectangle$type_rectangle <- factor(rectangle$type_rectangle,
                                   levels = c("constructor", "functions", "instance", "main", "other"))

rectangle %>%
  group_by(type_rectangle) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = type_rectangle, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Tipo', y = 'N�mero de observaciones') + 
  theme_minimal() +
  theme(axis.text=element_text(size=14),
        axis.title=element_text(size=14),
        axis.text.x = element_text(size=12, colour = "black"),
        axis.text.y = element_text(size=12, colour = "black")
  )




#82 Personas se fijaron m�s en el �rea del constructor, que es representador por
#la l�nea 2 y 3 (Representar)

#Donde constructor incluye a las personas que vieron la declaraci�n de las variables
#y el constructor que se encuentran en la l�nea 2 y 3 respectivamente, se decidi� de esta manera
#ya que dichas l�neas contienen principalmente las variables

constructor <- rectangle %>%
  filter(type_rectangle == "constructor")

constructor %>%
  group_by(correct_rectangle) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = correct_rectangle, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Constructor', y = 'Muestras') + 
  theme_minimal()

#Aqu� se puede ver que la mayor�a de las personas respondieron bien, siendo un 75.6% de las mismas

#Hay que sacar m�s caracter�sticas de estas personas


#ver el nivel de experiencia de los programadores en el elnguaje de prueba
constructor$expertise_experiment_language <- factor(constructor$expertise_experiment_language,
                                            levels = c("none", "low", "medium", "high"))

constructor %>%
  group_by(expertise_experiment_language) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = expertise_experiment_language, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Constructor', y = 'Muestras') + 
  theme_minimal()


#ver el nivel de experiencia de los programadores
constructor$expertise_programming <- factor(constructor$expertise_programming,
                  levels = c("none", "low", "medium", "high"))

constructor %>%
  group_by(expertise_programming) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = expertise_programming, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Constructor', y = 'Muestras') + 
  theme_minimal()



#Ver el nivel de ingl�s de las personas
constructor$english_level <- factor(constructor$english_level,
                                    levels = c("none", "low", "medium", "high"))


constructor %>%
  group_by(english_level) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = english_level, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Nivel de ingl�s', y = 'Muestras') + 
  theme_minimal()


#Sin embargo a comparaci�n del conjunto original no se nota una diferencia en el ingl�s del nivel de las personas

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset")

emipGeneral <- read_csv("emip_metadata.csv")

emipGeneral %>%
  group_by(english_level) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = english_level, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Constructor', y = 'Muestras') + 
  theme_minimal()


#La lengua madre que tienen los que vieron constructor

constructor %>%
  group_by(mother_tongue) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = mother_tongue, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Constructor', y = 'Muestras') + 
  theme_minimal()

#Sin embargo la mayor�a de las personas tienen como lengua madre el ingl�s siendo 28 personas
#Al comparar esto con el conjunto de datos original se tiene

emipGeneral %>%
  group_by(mother_tongue) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = mother_tongue, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Constructor', y = 'Muestras') + 
  theme_minimal()
#Se eliminan muchas personas

#�est�s personas usaron lentes o algo?
constructor %>%
  group_by(visual_aid) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = visual_aid, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'visual aid', y = 'Muestras') + 
  theme_minimal()


emipGeneral %>%
  group_by(visual_aid) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = visual_aid, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Constructor', y = 'Muestras') + 
  theme_minimal()


#Frecuencia que dedican al lenguaje
constructor$frequency_experiment_language <- factor(constructor$frequency_experiment_language,
                      levels = c("not at all", "less than 1 hour / day", "less than 1 hour / week", "less than 1 hour / month", "more than 1 hour / day"))

constructor %>%
  group_by(frequency_experiment_language) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = frequency_experiment_language, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'visual aid', y = 'Muestras') + 
  theme_minimal()

#A comparaci�n del original
emipGeneral$frequency_experiment_language <- factor(emipGeneral$frequency_experiment_language,
                            levels = c("not at all", "less than 1 hour / day", "less than 1 hour / week", "less than 1 hour / month", "more than 1 hour / day"))


emipGeneral %>%
  group_by(frequency_experiment_language) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = frequency_experiment_language, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'visual aid', y = 'Muestras') + 
  theme_minimal()

#Frecuencia que dedican al lenguaje
constructor$frequency_other_language <- factor(constructor$frequency_other_language,
                        levels = c("not at all", "less than 1 hour / day", "less than 1 hour / week", "less than 1 hour / month", "more than 1 hour / day"))

constructor %>%
  group_by(frequency_other_language) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = frequency_other_language, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'visual aid', y = 'Muestras') + 
  theme_minimal()


#A comparaci�n del original
emipGeneral$frequency_other_language <- factor(emipGeneral$frequency_other_language,
                      levels = c("not at all", "less than 1 hour / day", "less than 1 hour / week", "less than 1 hour / month", "more than 1 hour / day"))


emipGeneral %>%
  group_by(frequency_other_language) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = frequency_other_language, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'visual aid', y = 'Muestras') + 
  theme_minimal()


#�C�mo se les present� los est�mulos?


constructor %>%
  group_by(order_rectangle) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = order_rectangle, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'visual aid', y = 'Muestras') + 
  theme_minimal()
#el 52.4 personas vieron el rectangulo como segunda opci�n

#ENTONCES, de constructor se puede destacar que la mayor�a de las personas que vieron esas �reas respondieron correctamente

#Ahora de los que vieron los m�todos
functions <- rectangle %>%
  filter(type_rectangle == "functions")


functions %>%
  group_by(correct_rectangle) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = correct_rectangle, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Funciones', y = 'Muestras') + 
  theme_minimal()
#Al igual que en costructor las personas respondieron m�s correctamente en un 65.4%



#Ahora de los que vieron las instancias
instance <- rectangle %>%
  filter(type_rectangle == "instance")


instance %>%
  group_by(correct_rectangle) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = correct_rectangle, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Instancias', y = 'Muestras') + 
  theme_minimal()

#Y para finalizar las personas que vieron el main

main <- rectangle %>%
  filter(type_rectangle == "main")


main %>%
  group_by(correct_rectangle) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = correct_rectangle, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Main', y = 'Muestras') + 
  theme_minimal()

#Aunque solo fue una persona m�s, cambia bastante ya que el 54.5% de personas respondieron mal

#�Y con los desconocidos?
other <- rectangle %>%
  filter(type_rectangle == "other")


other %>%
  group_by(correct_rectangle) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = correct_rectangle, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Otros', y = 'Muestras') + 
  theme_minimal()


#N�mero de personas que respondieron correctamente a las pruebas de java
setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset")

emipGeneral <- read_csv("emip_metadata.csv")


onlyJava <- emipGeneral %>%
  filter(stimulus_rectangle == 'rectangle_java.jpg' | stimulus_rectangle == 'rectangle_java2.jpg')


#�Cu�ntas personas respondieron correctamente de las pruebas hechas en Java?
correctOnlyJava <- onlyJava %>%
  filter(correct_rectangle == '1')

#Un 70.5% respondieron correctamente 
onlyJava %>%
  group_by(correct_rectangle) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = correct_rectangle, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Otros', y = 'Muestras') + 
  theme_minimal()









