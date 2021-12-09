library(dplyr)
library(tidyr)
library(readr)
library(stringr)
# Importar datos ----------------------------------------------------------####
encuesta<-read_delim("data/encuesta.tsv", delim = "\t")
# Ahora separar filas y columnas ------------------------------------------####
encuesta %>%
  separate(ingreso, sep=" - ", into=c("ingreso_min", "ingreso_max")) 
# Reemplazar los NAs por un carácter --------------------------------------####
encuesta %>%
  separate(ingreso, sep=" - ", into=c("ingreso_min", "ingreso_max"))  %>%
  replace_na(list(ingreso_max = "No aplica")) 
# Arreglar la columna de ingreso mínimo -----------------------------------####
encuesta %>%
  separate(ingreso, sep=" - ", into=c("ingreso_min", "ingreso_max"))  %>%
  replace_na(list(ingreso_max = "No aplica")) %>%
  mutate(ingreso_min=str_replace_all(ingreso_min, " o más", ""))