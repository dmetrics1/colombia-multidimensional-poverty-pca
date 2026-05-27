# 00_paquetes.R
# Instalar paquetes si no están disponibles
paquetes <- c(
  # Manipulación de datos
  "tidyverse",   # dplyr, tidyr, readr, ggplot2, etc.
  "readxl",      # Leer el diccionario .xlsx
  "janitor",     # Limpieza de nombres de variables
  "glue",        # Pegar strings
  
  # Tablas de resultados
  "gt",          # Tablas publicables
  "gtExtras",    # Extensiones de gt
  "gtsummary",   # Tablas de resumen estadístico
  
  # Análisis con diseño muestral (factores de expansión)
  "survey",      # Estimaciones ponderadas
  "srvyr",       # survey en sintaxis tidyverse
  
  # Visualización
  "ggplot2",
  "scales",
  "ggtext",
  "patchwork",
  
  # Exportación
  "openxlsx",
  
  # PCA y Correlaciones (Artículo)
  "FactoMineR",
  "factoextra",
  "corrplot",
  "ggcorrplot"
)

nuevos <- paquetes[!paquetes %in% installed.packages()[, "Package"]]
if (length(nuevos) > 0) install.packages(nuevos)

# Cargar todos
invisible(lapply(paquetes, library, character.only = TRUE))

message("✅ Paquetes cargados correctamente")
