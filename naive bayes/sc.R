#Crear dataset

setwd("D:/Mario/Escritorio/bayesian/data")

library(tidyverse)


bayesianData <-
  list.files(pattern = "*.csv") %>% 
  map_df(~read_csv(.))

write_csv(bayesianData,"D:/Mario/Escritorio/bayesian/bayesianGeneral.csv")










