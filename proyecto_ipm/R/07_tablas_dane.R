# 06_tablas_dane.R
library(tidyverse)
library(srvyr)
library(openxlsx)

# Crear directorio si no existe
if(!dir.exists("resultados/tablas")) dir.create("resultados/tablas", recursive = TRUE)

message("Cargando bases departamentales procesadas...")
base_dep <- readRDS("datos/procesados/base_departamental.rds")
base_per_dep <- readRDS("datos/procesados/base_personas_departamental.rds")

# Filtrar para 2025 (omitido porque toda la base corresponde a 2025 y PERIODO tiene formato 20250731 o NA)
# base_dep <- base_dep |> filter(PERIODO == 2025)
# base_per_dep <- base_per_dep |> filter(PERIODO == 2025)

# Nombres legibles para privaciones
privaciones <- c(
  "logro_educativo", "analfabetismo", "inasistencia_escolar", 
  "rezago_escolar", "atencion_integral", "trabajo_infantil", 
  "aseguramiento_salud", "barreras_acceso_salud", 
  "desempleo_larga_duracion", "empleo_formal", 
  "acueducto", "alcantarillado", "pisos", "paredes", "hacinamiento"
)

# Pesos de cada privación en el índice (M0 y contribuciones)
pesos_priv <- c(
  logro_educativo=0.1, analfabetismo=0.1, inasistencia_escolar=0.05, 
  rezago_escolar=0.05, atencion_integral=0.05, trabajo_infantil=0.05, 
  aseguramiento_salud=0.1, barreras_acceso_salud=0.1, 
  desempleo_larga_duracion=0.1, empleo_formal=0.1, 
  acueducto=0.04, alcantarillado=0.04, pisos=0.04, paredes=0.04, hacinamiento=0.04
)

# Preparación de variables censuradas para M0 y Contribuciones
base_dep <- base_dep |>
  mutate(
    IPM_censurado = ifelse(POBRE == 1, IPM, 0),
    across(all_of(names(pesos_priv)), ~ ifelse(POBRE == 1, ., 0), .names = "cens_{.col}")
  )

# Identificar al Jefe de Hogar
jefes <- base_per_dep |> 
  filter(P6051 == 1) |> 
  select(DIRECTORIO, SECUENCIA_P, Sexo_Jefe = P6020) |> 
  distinct() |>
  group_by(DIRECTORIO, SECUENCIA_P) |>
  slice(1) |>
  ungroup() |>
  mutate(Sexo_Jefe = ifelse(Sexo_Jefe == 1, "Hombre", "Mujer"))

base_dep <- base_dep |> left_join(jefes, by = c("DIRECTORIO", "SECUENCIA_P"))

# Cargar script de etiquetas
source("R/06_etiquetas_diccionario.R")

# Aplicar etiquetas y Filtrar NAs en factores de expansión por seguridad
base_dep <- base_dep |> 
  mutate(
    REGION = etiquetar_region(REGION),
    DEPARTAMENTO = etiquetar_departamento(DEPARTAMENTO)
  ) |> filter(!is.na(FEXP))

base_per_dep <- base_per_dep |> 
  mutate(DEPARTAMENTO = etiquetar_departamento(DEPARTAMENTO)) |> 
  filter(!is.na(FEXP))

ds_dep <- base_dep |> as_survey_design(weights = FEXP)
ds_per <- base_per_dep |> as_survey_design(weights = FEXP)

# -------------------------------------------------------------------------
# CALCULO DE TABLAS
# -------------------------------------------------------------------------
message("Calculando estimaciones...")

# 1. Incidencia de Pobreza Multidimensional y sus IC - Regiones
t_incidencia_reg <- ds_dep |> 
  group_by(REGION) |> 
  summarise(Incidencia = survey_mean(POBRE, na.rm=TRUE, vartype = "ci")) |>
  mutate(Incidencia = Incidencia * 100, Incidencia_low = Incidencia_low * 100, Incidencia_upp = Incidencia_upp * 100) |>
  rename(Limite_Inferior_IC = Incidencia_low, Limite_Superior_IC = Incidencia_upp)

# 2. Incidencia de Pobreza Multidimensional y sus IC - Departamentos
t_incidencia_dep <- ds_dep |> 
  group_by(DEPARTAMENTO) |> 
  summarise(Incidencia = survey_mean(POBRE, na.rm=TRUE, vartype = "ci")) |>
  mutate(Incidencia = Incidencia * 100, Incidencia_low = Incidencia_low * 100, Incidencia_upp = Incidencia_upp * 100) |>
  rename(Limite_Inferior_IC = Incidencia_low, Limite_Superior_IC = Incidencia_upp)

# 3. Privaciones por hogar - Regiones
t_priv_reg <- ds_dep |> 
  group_by(REGION) |> 
  summarise(across(all_of(privaciones), ~ survey_mean(., na.rm=TRUE) * 100)) |>
  select(-ends_with("_se"))

# 4. Privaciones por hogar - Departamentos
t_priv_dep <- ds_dep |> 
  group_by(DEPARTAMENTO) |> 
  summarise(across(all_of(privaciones), ~ survey_mean(., na.rm=TRUE) * 100)) |>
  select(-ends_with("_se"))

# 5. Intensidad de la Pobreza (A) - Departamentos
t_intensidad_dep <- ds_dep |> 
  filter(POBRE == 1) |> 
  group_by(DEPARTAMENTO) |> 
  summarise(Intensidad_A = survey_mean(IPM, na.rm=TRUE) * 100) |>
  select(-ends_with("_se"))

# 6. Incidencia Ajustada (M0) - Departamentos
t_m0_dep <- ds_dep |> 
  group_by(DEPARTAMENTO) |> 
  summarise(Incidencia_Ajustada_M0 = survey_mean(IPM_censurado, na.rm=TRUE) * 100) |>
  select(-ends_with("_se"))

# 7. Contribuciones a M0 - Departamentos
t8_raw <- ds_dep |> 
  group_by(DEPARTAMENTO) |> 
  summarise(
    M0 = survey_mean(IPM_censurado, na.rm=TRUE),
    across(starts_with("cens_"), ~ survey_mean(., na.rm=TRUE))
  ) |> select(-ends_with("_se"))

t_contrib_dep <- t8_raw |> 
  mutate(
    across(starts_with("cens_"), 
           ~ (. * pesos_priv[sub("cens_", "", cur_column())]) / M0 * 100, 
           .names = "contrib_{.col}")
  ) |> select(DEPARTAMENTO, starts_with("contrib_")) |>
  rename_with(~ str_remove(., "contrib_cens_"))

# 8. Incidencia e IC según sexo de la persona - Departamentos
t_sexo_per <- ds_per |> 
  mutate(Sexo = ifelse(P6020 == 1, "Hombre", "Mujer")) |>
  group_by(DEPARTAMENTO, Sexo) |> 
  summarise(Incidencia = survey_mean(POBRE, na.rm=TRUE, vartype="ci")) |> 
  mutate(Incidencia = Incidencia * 100, Incidencia_low = Incidencia_low * 100, Incidencia_upp = Incidencia_upp * 100) |>
  rename(Limite_Inferior_IC = Incidencia_low, Limite_Superior_IC = Incidencia_upp)

# 9. Incidencia e IC según sexo del jefe de hogar - Departamentos
t_sexo_jefe <- ds_dep |> 
  filter(!is.na(Sexo_Jefe)) |>
  group_by(DEPARTAMENTO, Sexo_Jefe) |> 
  summarise(Incidencia = survey_mean(POBRE, na.rm=TRUE, vartype="ci")) |>
  mutate(Incidencia = Incidencia * 100, Incidencia_low = Incidencia_low * 100, Incidencia_upp = Incidencia_upp * 100) |>
  rename(Limite_Inferior_IC = Incidencia_low, Limite_Superior_IC = Incidencia_upp)

# -------------------------------------------------------------------------
# EXPORTAR A EXCEL
# -------------------------------------------------------------------------
message("Exportando a Excel...")
wb <- createWorkbook()

# Añadir hojas
addWorksheet(wb, "Incidencia Región")
addWorksheet(wb, "Incidencia Depto")
addWorksheet(wb, "Privaciones Región")
addWorksheet(wb, "Privaciones Depto")
addWorksheet(wb, "Intensidad y M0 Depto")
addWorksheet(wb, "Contribuciones M0 Depto")
addWorksheet(wb, "Incidencia Sexo Persona")
addWorksheet(wb, "Incidencia Sexo Jefe")

# Consolidar Intensidad y M0
t_int_m0 <- left_join(t_intensidad_dep, t_m0_dep, by = "DEPARTAMENTO")

# Escribir datos
writeData(wb, "Incidencia Región", t_incidencia_reg)
writeData(wb, "Incidencia Depto", t_incidencia_dep)
writeData(wb, "Privaciones Región", t_priv_reg)
writeData(wb, "Privaciones Depto", t_priv_dep)
writeData(wb, "Intensidad y M0 Depto", t_int_m0)
writeData(wb, "Contribuciones M0 Depto", t_contrib_dep)
writeData(wb, "Incidencia Sexo Persona", t_sexo_per)
writeData(wb, "Incidencia Sexo Jefe", t_sexo_jefe)

# Guardar
ruta_excel <- "resultados/tablas/Resultados_IPM_2025.xlsx"
saveWorkbook(wb, ruta_excel, overwrite = TRUE)

message("✅ Tablas generadas con éxito en: ", ruta_excel)
