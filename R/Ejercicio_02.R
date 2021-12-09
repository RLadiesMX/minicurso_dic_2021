library(dplyr)
library(tidyr)
library(readr)
# Importar datos ----------------------------------------------------------####
aviones<-read_csv("data/aviones.csv")
# Supongamos que queremos hacer una matriz --------------------------------#### 
aviones %>%
  pivot_wider(names_from = "modelo", values_from="asientos")
# Más o menos, pero no queremos valores repetidos -------------------------####
aviones %>%
  select(fabricante, modelo, asientos) %>%
  pivot_wider(names_from = "modelo", values_from="asientos")
# Okay ahora hay que quitar los duplicados --------------------------------####
aviones %>%
  select(fabricante, modelo, asientos) %>%
  distinct() %>%
  pivot_wider(names_from = "modelo", values_from="asientos")
# Perfecto, pero ahora queremos que los NA sean 0 -------------------------####
como_matriz_aviones<-aviones %>%
  select(fabricante, modelo, asientos) %>%
  distinct() %>%
  pivot_wider(names_from = "modelo", 
              values_from="asientos", 
              values_fill=0)
# Ahora como la regresamos a su formato largo -----------------------------####
como_matriz_aviones %>%
  pivot_longer(!fabricante, names_to="modelos", values_to="asientos") %>%
  arrange(asientos)
# ¿Cómo ordenas de mayor a menor? -----------------------------------------####
como_matriz_aviones %>%
  pivot_longer(!fabricante, names_to="modelos", values_to="asientos") %>%
  arrange(-asientos)


