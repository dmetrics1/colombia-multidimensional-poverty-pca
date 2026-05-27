# 05_estimaciones.R
library(srvyr)

# ── Definir diseño muestral ───────────────────────────────────────────────────
# Usaremos la base Nacional cruzada (base_nac) para las estimaciones
# ya que contiene las variables de viviendas como P3 (Zona)
disenio_hogar <- base_nac |>
  as_survey_design(weights = FEXP)   # FEXP para representar personas

# ── Incidencia y Puntaje nacional de pobreza multidimensional ─────────────────
incidencia <- disenio_hogar |>
  summarise(
    pct_pobre = survey_mean(POBRE, na.rm = TRUE, vartype = "ci"),
    ipm_promedio = survey_mean(IPM, na.rm = TRUE, vartype = "ci")
  )

cat(glue::glue("
  Incidencia IPM (Nacional): {scales::percent(incidencia$pct_pobre, accuracy = 0.1)}
  IC 95% Incidencia: [{scales::percent(incidencia$pct_pobre_low, accuracy = 0.1)} — {scales::percent(incidencia$pct_pobre_upp, accuracy = 0.1)}]
  
  Puntaje IPM Promedio: {round(incidencia$ipm_promedio, 3)}
  IC 95% Puntaje: [{round(incidencia$ipm_promedio_low, 3)} — {round(incidencia$ipm_promedio_upp, 3)}]
"))

# ── Tasa de privación por indicador ──────────────────────────────────────────
privaciones <- c(
  "logro_educativo", "analfabetismo", "inasistencia_escolar",
  "rezago_escolar", "atencion_integral", "trabajo_infantil",
  "aseguramiento_salud", "barreras_acceso_salud",
  "desempleo_larga_duracion", "empleo_formal",
  "acueducto", "alcantarillado", "pisos", "paredes", "hacinamiento"
)

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
# Requiere variable P3 de viviendas (ya incluida en base_nac)
incidencia_zona <- disenio_hogar |>
  group_by(P3) |>
  summarise(
    pct_pobre = survey_mean(POBRE, na.rm = TRUE),
    ipm_promedio = survey_mean(IPM, na.rm = TRUE)
  ) |>
  mutate(
    zona = case_when(
      P3 == 1 ~ "Cabecera",
      P3 == 2 ~ "Centro Poblado",
      P3 == 3 ~ "Rural Disperso",
      TRUE    ~ "Sin clasificar"
    ),
    pct_pobre_fmt = scales::percent(pct_pobre, accuracy = 0.1),
    ipm_promedio_fmt = round(ipm_promedio, 3)
  ) |>
  select(zona, P3, pct_pobre_fmt, ipm_promedio_fmt, everything())

print(incidencia_zona)
