# 02_cargar_datos.R

# Rutas Nacional
ruta_h_nac <- "datos/raw/Hogares_Nacional.csv"
ruta_p_nac <- "datos/raw/Personas_Nacional.csv"
ruta_v_nac <- "datos/raw/Viviendas_Nacional.csv"

# Rutas Departamental
ruta_h_dep <- "datos/raw/Hogares_Departamental.csv"
ruta_p_dep <- "datos/raw/Personas_Departamental.csv"
ruta_v_dep <- "datos/raw/Viviendas_Departamental.csv"

# Cargar Nacional con readr
hogares_nac   <- readr::read_csv(ruta_h_nac, show_col_types = FALSE)
personas_nac  <- readr::read_csv(ruta_p_nac, show_col_types = FALSE)
viviendas_nac <- readr::read_csv(ruta_v_nac, show_col_types = FALSE)

# Cargar Departamental con readr
hogares_dep   <- readr::read_csv(ruta_h_dep, show_col_types = FALSE)
personas_dep  <- readr::read_csv(ruta_p_dep, show_col_types = FALSE)
viviendas_dep <- readr::read_csv(ruta_v_dep, show_col_types = FALSE)

# Dimensiones Nacional
cat(glue::glue("
  --- Nacional ---
  Hogares:   {nrow(hogares_nac)} filas × {ncol(hogares_nac)} columnas
  Personas:  {nrow(personas_nac)} filas × {ncol(personas_nac)} columnas
  Viviendas: {nrow(viviendas_nac)} filas × {ncol(viviendas_nac)} columnas
"))

# Dimensiones Departamental
cat(glue::glue("
  --- Departamental ---
  Hogares:   {nrow(hogares_dep)} filas × {ncol(hogares_dep)} columnas
  Personas:  {nrow(personas_dep)} filas × {ncol(personas_dep)} columnas
  Viviendas: {nrow(viviendas_dep)} filas × {ncol(viviendas_dep)} columnas
"))
