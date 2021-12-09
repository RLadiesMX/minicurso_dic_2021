library(dplyr)
library(tidyr)
library(readr)
# Importar datos ----------------------------------------------------------####
aviones<-read_csv("data/aviones.csv")
# Explorar base de datos  ----------------------------------------------------------####
as_tibble(aviones)
# Uso de Pipe  ----------------------------------------------------------####
aviones%>%
  as_tibble()
# Seleccionar columnas --------------------------------#### 
aviones %>%
  select(fabricante)

aviones %>%
  select(modelo)
# Seleccionar  mas de 2 columna --------------------------------#### 
aviones %>%
  select(fabricante,modelo)
# Filtrar datos --------------------------------#### 
aviones %>%
  filter(tipo=="Ala fija multimotor")

# Filtrar datos y seleccionar columas --------------------------------#### 
aviones %>%
  filter(tipo=="Ala fija multimotor")%>%
  select(modelo)

# Filtrar datos --------------------------------#### 
aviones %>%
  filter(anio>2000)

# Nuevas variables | Generar una variable que una fabricante y modelo  --------------------------------#### 
aviones %>%
  mutate(fabricante_modelo=paste(fabricante,modelo,sep="_"))%>%
  select(fabricante_modelo)

