# 03_cruce_bases.R

# Llaves de cruce
llave_vh <- c("DIRECTORIO", "SECUENCIA_ENCUESTA", "SECUENCIA_P")
llave_hp <- c("DIRECTORIO", "SECUENCIA_P")

# ── 1. Cruce Nacional ──────────────────────────────────────────────────────────
# Paso 1: pegar Viviendas → Hogares
base_nac <- hogares_nac |>
  left_join(viviendas_nac, by = llave_vh, suffix = c("", "_viv"))

# Paso 2: pegar base anterior → Personas
base_personas_nac <- personas_nac |>
  left_join(base_nac, by = llave_hp, suffix = c("_per", ""))

stopifnot(nrow(base_nac) == nrow(hogares_nac))

# Guardar en formato .rds
saveRDS(base_nac,          "datos/procesados/base_nacional.rds")
saveRDS(base_personas_nac, "datos/procesados/base_personas_nacional.rds")

# ── 2. Cruce Departamental ─────────────────────────────────────────────────────
# Paso 1: pegar Viviendas → Hogares
base_dep <- hogares_dep |>
  left_join(viviendas_dep, by = llave_vh, suffix = c("", "_viv"))

# Paso 2: pegar base anterior → Personas
base_personas_dep <- personas_dep |>
  left_join(base_dep, by = llave_hp, suffix = c("_per", ""))

stopifnot(nrow(base_dep) == nrow(hogares_dep))

# Guardar en formato .rds
saveRDS(base_dep,          "datos/procesados/base_departamental.rds")
saveRDS(base_personas_dep, "datos/procesados/base_personas_departamental.rds")

message("✅ Cruce completado.")
cat(glue::glue("
  Filas base hogares (Nacional):      {nrow(base_nac)}
  Filas base hogares (Departamental): {nrow(base_dep)}
"))
