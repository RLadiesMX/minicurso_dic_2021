library(dplyr)
library(tidyr)
library(stringr)
library(readxl)
# Importar datos ----------------------------------------------------------####
vehiculos<-read_xlsx("data/vehiculos.xlsx")
# Importar datos desde otra hoja ------------------------------------------####
vehiculos_2<-read_xlsx("data/vehiculos.xlsx", sheet = "Sheet2")
# Unir las tablas ---------------------------------------------------------####
vehiculos %>%
  left_join(vehiculos_2, by="id")

