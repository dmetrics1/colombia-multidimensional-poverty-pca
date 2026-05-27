# 04_validaciones.R

# Vamos a realizar las validaciones sobre la base Nacional como ejemplo
# Si se desea usar la departamental, cambiar por hogares_dep, etc.
hogares_val   <- hogares_nac
personas_val  <- personas_nac
viviendas_val <- viviendas_nac

# ── 1. Duplicados en llaves ───────────────────────────────────────────────────
dup_h <- hogares_val |> janitor::get_dupes(DIRECTORIO, SECUENCIA_P)
dup_v <- viviendas_val |> janitor::get_dupes(DIRECTORIO, SECUENCIA_ENCUESTA, SECUENCIA_P)
dup_p <- personas_val |> janitor::get_dupes(DIRECTORIO, SECUENCIA_P, ORDEN)

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

hogares_val |>
  summarise(across(all_of(privaciones), ~ mean(is.na(.)))) |>
  tidyr::pivot_longer(everything(), names_to = "variable", values_to = "pct_nulos") |>
  filter(pct_nulos > 0) |>
  mutate(pct_nulos = scales::percent(pct_nulos, accuracy = 0.01)) |>
  print()

# ── 3. Verificar que POBRE coincide con IPM >= 5/15 ──────────────────────────
umbral <- 5 / 15

inconsistencias <- hogares_val |>
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
hogares_val |>
  summarise(
    FEX_C_min = min(FEX_C, na.rm = TRUE),
    FEX_C_max = max(FEX_C, na.rm = TRUE),
    FEXP_min  = min(FEXP,  na.rm = TRUE),
    FEXP_max  = max(FEXP,  na.rm = TRUE)
  ) |>
  print()
