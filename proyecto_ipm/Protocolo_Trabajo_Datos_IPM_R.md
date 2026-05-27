# Protocolo de Trabajo con Bases de Datos del IPM en R — DANE 2025

**Fuente:** Encuesta Nacional de Calidad de Vida (ENCV) — DANE  
**Índice:** Índice de Pobreza Multidimensional (IPM) — Metodología Alkire & Foster  
**Diccionario de referencia:** `Diccionariodatos-PMultidimensional-2025.xlsx`  
**Lenguaje:** R (tidyverse)  
**Nivel geográfico disponible:** Nacional y Departamental

---

## 1. Estructura de archivos de datos

El IPM requiere **tres bases CSV separadas**. Existen en dos versiones geográficas:

| Base | CSV Nacional | CSV Departamental |
|---|---|---|
| **Hogares** | `Hogares_Nacional.csv` | `Hogares_Departamental.csv` |
| **Personas** | `Personas_Nacional.csv` | `Personas_Departamental.csv` |
| **Viviendas** | `Viviendas_Nacional.csv` | `Viviendas_Departamental.csv` |

---

## 2. Estructura de carpetas del proyecto

```
proyecto_ipm/
│
├── datos/
│   ├── raw/                          # Datos originales — NO modificar nunca
│   │   ├── Hogares_Nacional.csv
│   │   ├── Personas_Nacional.csv
│   │   ├── Viviendas_Nacional.csv
│   │   ├── Hogares_Departamental.csv
│   │   ├── Personas_Departamental.csv
│   │   └── Viviendas_Departamental.csv
│   └── procesados/                   # Bases limpias y cruzadas (.rds)
│       ├── base_nacional.rds
│       ├── base_departamental.rds
│       ├── base_personas_nacional.rds
│       └── base_personas_departamental.rds
│
├── diccionario/
│   └── Diccionariodatos-PMultidimensional-2025.xlsx
│
├── R/                                # Scripts modulares de R
│   ├── 00_paquetes.R                 # Instalación y carga de paquetes
│   ├── 01_cargar_datos.R             # Carga de los CSV
│   ├── 02_cruce_bases.R              # Cruce y merge de Viviendas/Hogares/Personas
│   ├── 03_validaciones.R          # Validacion de llaves, nulos, IPM y factores
│   ├── 04_estimaciones.R          # Calculo oficial del IPM nacional e intensidad
│   ├── 05_analisis.R              # Analisis adicionales
│   ├── 06_etiquetas_diccionario.R    # Automatización de etiquetas geográficas
│   ├── 07_tablas_dane.R              # Exportación multihoja del DANE a Excel
│   └── 08_replicacion_articulo.R     # Réplica metodológica, gráficos, PCA y 6 regiones
│
├── resultados/                       # Outputs y gráficas finales
│   ├── graficos_articulo/            # Figuras descriptivas de alta calidad
│   └── Tablas_Articulo_2025.xlsx     # Excel con las réplicas tabulares
│
├── main.R                            # Orquestador del pipeline
└── reporte_replicacion_articulo.qmd  # Reporte dinámico Quarto (HTML)
```

---

## 3. Script 00 — Instalación y carga de paquetes

```r
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
  "patchwork"
)

nuevos <- paquetes[!paquetes %in% installed.packages()[, "Package"]]
if (length(nuevos) > 0) install.packages(nuevos)

# Cargar todos
invisible(lapply(paquetes, library, character.only = TRUE))

message("✅ Paquetes cargados correctamente")
```

---

## 4. Script 01 — Leer el diccionario de datos

El diccionario tiene 7 hojas. Los encabezados están en la **fila 9** y los datos desde la **fila 10**.

```r
# 01_leer_diccionario.R

ruta_dic <- "diccionario/Diccionariodatos-PMultidimensional-2025.xlsx"

# Función para leer cualquier hoja del diccionario
leer_diccionario <- function(hoja) {
  readxl::read_excel(
    path      = ruta_dic,
    sheet     = hoja,
    skip      = 8,          # Saltar filas 1-8; encabezados en fila 9
    col_names = TRUE
  ) |>
    # Renombrar columnas estándar
    rename_with(~ c("campo", "nombre", "descripcion", "valores")[seq_along(.)],
                .cols = everything()) |>
    # Conservar solo filas con número de campo (eliminar notas al pie)
    filter(!is.na(campo), is.numeric(campo))
}

# Leer las hojas de nivel nacional
dic_hogares   <- leer_diccionario("Hogares(Nacional)")
dic_personas  <- leer_diccionario("Personas(Nacional)")
dic_viviendas <- leer_diccionario("Viviendas(Nacional)")

# Ver un resumen rápido
dic_hogares |> select(campo, nombre, descripcion) |> print(n = 40)
```

---

## 5. Script 02 — Cargar los CSV

```r
# 02_cargar_datos.R

# Rutas
ruta_h <- "datos/raw/Hogares_Nacional.csv"
ruta_p <- "datos/raw/Personas_Nacional.csv"
ruta_v <- "datos/raw/Viviendas_Nacional.csv"

# Cargar con readr (más rápido que read.csv base)
hogares   <- readr::read_csv(ruta_h, show_col_types = FALSE)
personas  <- readr::read_csv(ruta_p, show_col_types = FALSE)
viviendas <- readr::read_csv(ruta_v, show_col_types = FALSE)

# Vista rápida de cada base
glimpse(hogares)
glimpse(personas)
glimpse(viviendas)

# Dimensiones
cat(glue::glue("
  Hogares:   {nrow(hogares):>8,} filas × {ncol(hogares)} columnas
  Personas:  {nrow(personas):>8,} filas × {ncol(personas)} columnas
  Viviendas: {nrow(viviendas):>8,} filas × {ncol(viviendas)} columnas
"))
```

> **Nota sobre encodings:** Si los CSV tienen tildes mal leídas, agregar `locale = locale(encoding = "latin1")` dentro de `read_csv()`.

---

## 6. Script 03 — Cruce de las tres bases

### 6.1 Llaves de identificación

| Variable | Descripción | Presente en |
|---|---|---|
| `DIRECTORIO` | ID único de la vivienda | Hogares, Personas, Viviendas |
| `SECUENCIA_P` | Número del hogar en la vivienda | Hogares, Personas, Viviendas |
| `SECUENCIA_ENCUESTA` | Número de encuesta | Personas, Viviendas |
| `ORDEN` | Número de persona dentro del hogar | Solo Personas |

### 6.2 Diagrama del cruce

```
VIVIENDAS  ──(DIRECTORIO + SECUENCIA_ENCUESTA + SECUENCIA_P)──►  HOGARES
                                                                       │
                                                    (DIRECTORIO + SECUENCIA_P)
                                                                       │
                                                                       ▼
                                                                   PERSONAS
                                              (+ ORDEN para identificar cada individuo)
```

### 6.3 Código del cruce

```r
# 03_cruce_bases.R

# Llaves de cruce
llave_vh <- c("DIRECTORIO", "SECUENCIA_ENCUESTA", "SECUENCIA_P")
llave_hp <- c("DIRECTORIO", "SECUENCIA_P")

# Paso 1: pegar Viviendas → Hogares
# left_join: todos los hogares se conservan
base <- hogares |>
  left_join(viviendas, by = llave_vh, suffix = c("", "_viv"))

# Paso 2: pegar base anterior → Personas
# Si se necesita análisis a nivel de persona:
base_personas <- personas |>
  left_join(base, by = llave_hp, suffix = c("_per", ""))

# Verificar que no se perdieron hogares
stopifnot(nrow(base) == nrow(hogares))

# Guardar en formato .rds (más rápido que CSV para R)
saveRDS(base,          "datos/procesados/base_nacional.rds")
saveRDS(base_personas, "datos/procesados/base_personas_nacional.rds")

message("✅ Cruce completado. Filas base hogares: ", nrow(base))
```

---

## 7. Script 04 — Validaciones de calidad

```r
# 04_validaciones.R

# ── 1. Duplicados en llaves ───────────────────────────────────────────────────
dup_h <- hogares |> janitor::get_dupes(DIRECTORIO, SECUENCIA_P)
dup_v <- viviendas |> janitor::get_dupes(DIRECTORIO, SECUENCIA_ENCUESTA, SECUENCIA_P)
dup_p <- personas |> janitor::get_dupes(DIRECTORIO, SECUENCIA_P, ORDEN)

cat(glue::glue("
  Duplicados en Hogares:   {nrow(dup_h)}
  Duplicados en Viviendas: {nrow(dup_v)}
  Duplicados en Personas:  {nrow(dup_p)}
"))

# ── 2. Valores nulos en variables de privación ─────────────────────────────────
privaciones <- c(
  "logro_educativo", "analfabetismo", "inasistencia_escolar",
  "rezago_escolar", "atencion_integral", "trabajo_infantil",
  "aseguramiento_salud", "barreras_acceso_salud",
  "desempleo_larga_duracion", "empleo_formal",
  "acueducto", "alcantarillado", "pisos", "paredes", "hacinamiento"
)

hogares |>
  summarise(across(all_of(privaciones), ~ mean(is.na(.)))) |>
  tidyr::pivot_longer(everything(), names_to = "variable", values_to = "pct_nulos") |>
  filter(pct_nulos > 0) |>
  mutate(pct_nulos = scales::percent(pct_nulos, accuracy = 0.01)) |>
  print()

# ── 3. Verificar que POBRE coincide con IPM >= 5/15 ──────────────────────────
umbral <- 5 / 15

inconsistencias <- hogares |>
  filter(!is.na(IPM), !is.na(POBRE)) |>
  mutate(
    pobre_esperado = as.integer(IPM >= umbral),
    coincide       = pobre_esperado == POBRE
  ) |>
  summarise(pct_coincide = mean(coincide))

cat(glue::glue("
  Consistencia IPM vs POBRE: {scales::percent(inconsistencias$pct_coincide)}
"))

# ── 4. Rango de los factores de expansión ────────────────────────────────────
hogares |>
  summarise(
    FEX_C_min = min(FEX_C, na.rm = TRUE),
    FEX_C_max = max(FEX_C, na.rm = TRUE),
    FEXP_min  = min(FEXP,  na.rm = TRUE),
    FEXP_max  = max(FEXP,  na.rm = TRUE)
  ) |>
  print()
```

---

## 8. Script 05 — Estimaciones con factores de expansión

Todos los resultados deben usar el paquete `srvyr` para aplicar correctamente los **factores de expansión**.

```r
# 05_estimaciones.R
library(srvyr)

# ── Definir diseño muestral ───────────────────────────────────────────────────
# FEX_C: factor de expansión de hogares
# FEXP:  factor de expansión de personas

disenio_hogar <- hogares |>
  as_survey_design(weights = FEXP)   # FEXP para representar personas

# ── Incidencia nacional de pobreza multidimensional ──────────────────────────
incidencia <- disenio_hogar |>
  summarise(
    pct_pobre = survey_mean(POBRE, na.rm = TRUE, vartype = "ci")
  )

cat(glue::glue("
  Incidencia IPM: {scales::percent(incidencia$pct_pobre, accuracy = 0.1)}
  IC 95%: [{scales::percent(incidencia$pct_pobre_low, accuracy = 0.1)} —
            {scales::percent(incidencia$pct_pobre_upp, accuracy = 0.1)}]
"))

# ── Tasa de privación por indicador ──────────────────────────────────────────
tasas_privacion <- disenio_hogar |>
  summarise(
    across(
      all_of(privaciones),
      ~ survey_mean(., na.rm = TRUE, vartype = "ci"),
      .names = "{.col}"
    )
  ) |>
  tidyr::pivot_longer(
    cols      = everything(),
    names_to  = "variable",
    values_to = "tasa"
  ) |>
  filter(!grepl("_low|_upp", variable)) |>
  arrange(desc(tasa)) |>
  mutate(tasa_pct = scales::percent(tasa, accuracy = 0.1))

print(tasas_privacion)

# ── Incidencia por zona (cabecera vs. resto) ──────────────────────────────────
# Requiere variable P3 de viviendas (ya incluida tras el cruce)
incidencia_zona <- disenio_hogar |>
  group_by(P3) |>
  summarise(pct_pobre = survey_mean(POBRE, na.rm = TRUE)) |>
  mutate(
    zona = case_when(
      P3 == 1 ~ "Cabecera",
      P3 == 2 ~ "Centro Poblado",
      P3 == 3 ~ "Rural Disperso",
      TRUE    ~ "Sin clasificar"
    ),
    pct_pobre_fmt = scales::percent(pct_pobre, accuracy = 0.1)
  )

print(incidencia_zona)
```

---

## 9. Variables del IPM — referencia rápida

### Las 15 privaciones (ya calculadas en la base de Hogares)

| Dimensión | Variable | Peso |
|---|---|---|
| **Educación** | `logro_educativo` | 0.10 |
| **Educación** | `analfabetismo` | 0.10 |
| **Niñez y juventud** | `rezago_escolar` | 0.05 |
| **Niñez y juventud** | `inasistencia_escolar` | 0.05 |
| **Niñez y juventud** | `atencion_integral` | 0.05 |
| **Niñez y juventud** | `trabajo_infantil` | 0.05 |
| **Salud** | `aseguramiento_salud` | 0.10 |
| **Salud** | `barreras_acceso_salud` | 0.10 |
| **Trabajo** | `desempleo_larga_duracion` | 0.10 |
| **Trabajo** | `empleo_formal` | 0.10 |
| **Vivienda** | `acueducto` | 0.04 |
| **Vivienda** | `alcantarillado` | 0.04 |
| **Vivienda** | `pisos` | 0.04 |
| **Vivienda** | `paredes` | 0.04 |
| **Vivienda** | `hacinamiento` | 0.04 |

### Variables finales

| Variable | Descripción | Uso |
|---|---|---|
| `IPM` | Valor continuo del índice (0–1) | Umbral: ≥ 5/15 = pobre |
| `POBRE` | 0 = no pobre, 1 = pobre | Estimación de incidencia |
| `FEX_C` | Factor de expansión de hogares | Ponderar análisis de hogar |
| `FEXP` | Factor de expansión de personas | Ponderar análisis de personas |

---

## 10. Errores frecuentes en R y cómo evitarlos

| Error | Causa | Solución |
|---|---|---|
| `read_excel()` no encuentra las variables | Encabezados en fila 9, no en fila 1 | Usar `skip = 8` en `read_excel()` |
| La base combinada tiene más filas que hogares | Duplicados en Viviendas | Verificar con `janitor::get_dupes()` antes del merge |
| Resultados sin expansión | No usar `srvyr` / `survey` | Siempre estimar con `as_survey_design(weights = FEXP)` |
| Confundir `FEX_C` con `FEXP` | Son factores distintos | `FEX_C` → hogares; `FEXP` → personas |
| Comparar cabecera vs. rural sin filtrar | Definiciones distintas de privación por zona | Filtrar por `P3` de Viviendas (1 = Cabecera, 3 = Rural) |
| Tildes o caracteres especiales mal leídos | Encoding del CSV | Agregar `locale = locale(encoding = "latin1")` en `read_csv()` |
| `left_join` genera filas extra | Llaves no únicas | Siempre verificar con `nrow()` antes y después del join |

---

## 11. Flujo completo de trabajo (orden de ejecución)

```r
# Ejecutar en orden desde el orquestador principal (main.R)

source("R/00_paquetes.R")              # 1. Cargar paquetes
source("R/01_cargar_datos.R")          # 2. Cargar los CSV
source("R/02_cruce_bases.R")           # 3. Pegar las bases
source("R/03_validaciones.R")          # 4. Validar llaves, nulos, IPM y factores
source("R/04_estimaciones.R")          # 5. Estimar IPM e incidencia
source("R/05_analisis.R")              # 6. Ejecutar analisis adicionales
source("R/07_tablas_dane.R")           # 7. Exportar tablas oficiales DANE
source("R/08_replicacion_articulo.R")  # 8. Réplica académica y PCA
```

---

*Protocolo elaborado con base en la Metodología IPM — DANE (2014) y el Diccionario de Datos IPM 2025.*  
*Lenguaje: R | Ecosistema: tidyverse + srvyr*  
*Actualizado: mayo 2026*

