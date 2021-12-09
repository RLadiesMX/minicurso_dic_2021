library(dplyr)
library(tidyr)
library(stringr)
library(readxl)
# Importar datos ----------------------------------------------------------####
vehiculos<-read_xlsx("data/vehiculos.xlsx")
# Separar una columna en múltiples filas ----------------------------------####
vehiculos %>%
  separate_rows(transmision, sep=" ")
# Crear una columna nueva basados en otra ---------------------------------####
vehiculos %>%
  separate_rows(transmision, sep=" ") %>%
  filter(transmision == "Automática") %>%
  mutate(Decada =case_when(
    str_detect(anio, "199") ~ "90s",
    str_detect(anio, "198") ~ "80s",
    str_detect(anio, "200") ~ "2000s",
    str_detect(anio, "201") ~ "2010s",
  ))
