# R/08_replicacion_articulo.R
# Script para replicar el análisis del artículo: "Perspectiva multidimensional de la pobreza"
# Versión de Alta Calidad Gráfica

source("R/00_paquetes.R")
source("R/06_etiquetas_diccionario.R")

message("\n--- Iniciando Replicación de Artículo (Alta Calidad) ---")

dir.create("resultados/graficos_articulo", showWarnings = FALSE, recursive = TRUE)

# 1. Cargar bases
base_nac <- readRDS("datos/procesados/base_departamental.rds")
base_per_nac <- readRDS("datos/procesados/base_personas_departamental.rds")

# 2. Construir variables
personas_agrupadas <- base_per_nac |>
  group_by(DIRECTORIO, SECUENCIA_P) |>
  summarise(
    PRI = sum(P8587 %in% c(2, 3), na.rm = TRUE),
    SEC = sum(P8587 %in% c(4, 5), na.rm = TRUE),
    SUP = sum(P8587 >= 6, na.rm = TRUE),
    NDE = sum(P8587 == 1 | is.na(P8587), na.rm = TRUE),
    MEN = sum(P6040 < 18, na.rm = TRUE),
    ADJ = sum(P6040 >= 18 & P6040 <= 29, na.rm = TRUE),
    ADT = sum(P6040 >= 30 & P6040 <= 54, na.rm = TRUE),
    MAY = sum(P6040 >= 55, na.rm = TRUE),
    HOM = sum(P6020 == 1, na.rm = TRUE),
    MUJ = sum(P6020 == 2, na.rm = TRUE),
    .groups = "drop"
  )

dataset_articulo <- base_nac |>
  left_join(personas_agrupadas, by = c("DIRECTORIO", "SECUENCIA_P")) |>
  rename(
    REG = REGION,
    CUA = P5010,
    PER = PERSONAS,
    POB = POBRE,
    PAR = paredes, PIS = pisos, ALC = alcantarillado, ACU = acueducto,
    EMF = empleo_formal, DLD = desempleo_larga_duracion, BAS = barreras_acceso_salud,
    ASS = aseguramiento_salud, TRI = trabajo_infantil, ATI = atencion_integral,
    INE = inasistencia_escolar, RES = rezago_escolar, ANA = analfabetismo,
    LOE = logro_educativo, HAC = hacinamiento
  ) |>
  filter(!is.na(FEX_C)) |>
  mutate(REG_label = etiquetar_region(REG))

saveRDS(dataset_articulo, "datos/procesados/dataset_articulo_2025.rds")
ds_art <- dataset_articulo |> as_survey_design(weights = FEX_C)

# ---------------------------------------------------------
# ESTILOS GLOBALES
# ---------------------------------------------------------
tema_articulo <- theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", color = "#333333", size = 16, hjust = 0.5),
    plot.subtitle = element_text(color = "#666666", size = 12, hjust = 0.5),
    plot.caption = element_text(color = "#999999", size = 10, hjust = 1),
    legend.position = "right",
    legend.title = element_text(face = "bold"),
    axis.title = element_text(face = "bold", color = "#555555"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    strip.text = element_text(face = "bold", size = 12)
  )

color_cyan <- "#00a0b0"
color_yellow <- "#f3c533"

# ---------------------------------------------------------
# FASE 2: GRÁFICOS DESCRIPTIVOS
# ---------------------------------------------------------
message("Generando gráficos descriptivos de alto impacto...")

crear_grafico_barras <- function(data_var, titulo, etiquetas_leyenda, nombre_leyenda) {
  df <- ds_art |>
    filter(!is.na(REG_label), !is.na(!!sym(data_var))) |>
    group_by(REG_label, !!sym(data_var)) |>
    summarise(prop = survey_mean(na.rm = TRUE), .groups = "drop") |>
    mutate(!!sym(data_var) := as.factor(!!sym(data_var))) |>
    mutate(!!sym(data_var) := forcats::fct_rev(!!sym(data_var)))
  
  # Si fct_rev, 1 está en la base (yellow) y 0 en el tope (cyan).
  colores <- c("1" = color_yellow, "0" = color_cyan)
  
  ggplot(df, aes(x = REG_label, y = prop, fill = !!sym(data_var))) +
    geom_bar(stat = "identity", position = "fill", width = 0.8) +
    geom_text(aes(label = scales::percent(prop, accuracy = 1)), 
              position = position_stack(vjust = 0.5), color = "white", fontface = "bold") +
    scale_fill_manual(values = colores, labels = rev(etiquetas_leyenda), name = nombre_leyenda) +
    scale_y_continuous(labels = scales::percent_format()) +
    labs(title = titulo, x = "Regiones", y = "Porcentaje de hogares %",
         caption = "Fuente: Elaboración propia en R, datos IPM 2025") +
    tema_articulo +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
}

# 1. Figura 1: Pobreza
fig1 <- crear_grafico_barras("POB", "Figura 1. Porcentaje de Hogares pobres y no pobres por regiones", c("No pobre", "Pobre"), "POB")
ggsave("resultados/graficos_articulo/Figura_1_Pobreza_Regiones.png", plot = fig1, width = 10, height = 7, dpi = 300)

# 2. Figura 2: LOE
fig2 <- crear_grafico_barras("LOE", "Figura 2. Privación por logro educativo según regiones", c("No privación", "Privación"), "LOE")
ggsave("resultados/graficos_articulo/Figura_2_LOE_Regiones.png", plot = fig2, width = 10, height = 7, dpi = 300)

# 3. Figura 3: EMF
fig3 <- crear_grafico_barras("EMF", "Figura 3. Privación por condiciones de empleo formal según regiones", c("No privación", "Privación"), "EMF")
ggsave("resultados/graficos_articulo/Figura_3_EMF_Regiones.png", plot = fig3, width = 10, height = 7, dpi = 300)

# 4. Figura 4: SUP
df_sup <- ds_art |>
  filter(!is.na(REG_label), !is.na(SUP)) |>
  mutate(SUP_cat = ifelse(SUP >= 5, 5, SUP)) |>
  group_by(REG_label, SUP_cat) |>
  summarise(prop = survey_mean(na.rm = TRUE), .groups = "drop") |>
  mutate(SUP_cat = as.factor(SUP_cat)) |>
  mutate(SUP_cat = forcats::fct_rev(SUP_cat))

colores_sup <- c("0" = color_cyan, "1" = color_yellow, "2" = "#5cbf54", "3" = "#d3222a", "4" = "#005579", "5" = "#f572a1")

fig4 <- ggplot(df_sup, aes(x = REG_label, y = prop, fill = SUP_cat)) +
  geom_bar(stat = "identity", position = "fill", width = 0.8) +
  geom_text(aes(label = ifelse(prop > 0.03, scales::percent(prop, accuracy = 0.1), "")), 
            position = position_stack(vjust = 0.5), color = "white", fontface = "bold", size=3.5) +
  scale_fill_manual(values = colores_sup, breaks = c("0","1","2","3","4","5"), name = "SUP") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(title = "Figura 4. Porcentaje de personas en el hogar con educación superior por regiones",
       x = "Regiones", y = "Porcentaje de hogares %", caption = "Fuente: Elaboración propia en R") +
  tema_articulo +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("resultados/graficos_articulo/Figura_4_SUP_Regiones.png", plot = fig4, width = 11, height = 7, dpi = 300)


# ---------------------------------------------------------
# FASE 3: MATRICES DE CORRELACIÓN Y PCA
# ---------------------------------------------------------
message("Generando matrices de correlación y PCA...")

# Actualizar para incluir CUA y PER explícitamente en la correlación de hogares (18 variables)
vars_hogar <- c("PAR", "PIS", "ALC", "ACU", "EMF", "DLD", "BAS", "ASS", "TRI", "ATI", "INE", "RES", "ANA", "LOE", "HAC", "CUA", "PER", "IPM")
vars_personas <- c("PRI", "SEC", "SUP", "NDE", "MEN", "ADJ", "ADT", "MAY", "HOM", "MUJ", "IPM")

mat_cor_hogar <- cor(dataset_articulo[, vars_hogar], use = "complete.obs")
mat_cor_personas <- cor(dataset_articulo[, vars_personas], use = "complete.obs")

# Definir una escala de colores suave y continua (200 colores) para la parte superior
col_corr <- colorRampPalette(c("#A50F15", "white", "#08519C"))(200)

# 5. Figura 5: Matriz de Correlación Hogar (Estilo Mixto)
png("resultados/graficos_articulo/Figura_5_Correlacion_Hogar.png", width = 3000, height = 3000, res = 300, type = "cairo")
corrplot.mixed(mat_cor_hogar, lower = "number", upper = "circle", tl.pos = "d", tl.col = "#d3222a", 
               lower.col = "black", upper.col = col_corr, number.cex = 0.75, tl.cex = 0.8)
dev.off()

# 6. Figura 6: Matriz de Correlación Personas (Estilo Mixto)
png("resultados/graficos_articulo/Figura_6_Correlacion_Personas.png", width = 3000, height = 3000, res = 300, type = "cairo")
corrplot.mixed(mat_cor_personas, lower = "number", upper = "circle", tl.pos = "d", tl.col = "#d3222a", 
               lower.col = "black", upper.col = col_corr, number.cex = 0.9, tl.cex = 0.9)
dev.off()

# ----------------- PCA -----------------
# Seleccionar exactamente las 28 variables del artículo
vars_pca <- c(
  vars_hogar[1:15], # Las 15 privaciones
  "IPM", "CUA", "PER", # Índices y tamaño
  vars_personas[1:10] # Demografía personas
)

set.seed(2025)
df_pca <- dataset_articulo |> 
  select(all_of(vars_pca), POB, PER, MAY, FEX_C) |>
  drop_na()

res.pca <- PCA(df_pca[, vars_pca], scale.unit = TRUE, graph = FALSE, row.w = df_pca$FEX_C)

# 7. Figura 7: Scree Plot (Varianza explicada)
fig7 <- fviz_eig(res.pca, addlabels = TRUE, ylim = c(0, 30), barfill = color_cyan, barcolor = color_cyan) +
  labs(title = "Scree Plot - Porcentaje de Varianza Explicada", y = "Porcentaje de Varianza", x = "Dimensiones") +
  tema_articulo
ggsave("resultados/graficos_articulo/Figura_7_PCA_Scree.png", plot = fig7, width = 8, height = 6, dpi = 300)

# 8. Figura 8: Biplot por Pobreza (POB)
fig8 <- fviz_pca_biplot(res.pca, 
                        geom.ind = "point", 
                        habillage = as.factor(df_pca$POB),
                        pointsize = 1.5, 
                        col.var = "black", 
                        alpha.ind = 0.7,
                        palette = c("#F8766D", "#00BFC4"), 
                        repel = TRUE, 
                        legend.title = "POB",
                        title = "Figura 8. Plano 1-2 de componentes principales según hogares pobres o no") +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", color = "#00a0b0", size = 16, hjust = 0.5),
    plot.background = element_rect(fill = "white", color = NA),
    legend.position = "right",
    panel.grid.major = element_line(color = "#e5e5e5"),
    panel.grid.minor = element_blank()
  )
ggsave("resultados/graficos_articulo/Figura_8_PCA_Biplot_POB.png", plot = fig8, width = 10, height = 8, dpi = 300, type = "cairo")

# 9. Figura 9: Biplot por Número de Personas (PER)
fig9 <- fviz_pca_biplot(res.pca, 
                        axes = c(1, 2),
                        geom.ind = "point", 
                        habillage = as.factor(df_pca$PER),
                        pointsize = 1.5, 
                        col.var = "black", 
                        alpha.ind = 0.7,
                        repel = TRUE, 
                        title = "Figura 9. Biplot en el plano 1-2 según número de personas en el hogar") +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", color = "#00a0b0", size = 16, hjust = 0.5),
    plot.background = element_rect(fill = "white", color = NA),
    legend.position = "right",
    panel.grid.major = element_line(color = "#e5e5e5"),
    panel.grid.minor = element_blank()
  )
ggsave("resultados/graficos_articulo/Figura_9_PCA_Biplot_PER.png", plot = fig9, width = 12, height = 8, dpi = 300, type = "cairo")

# 10. Figura 10: Biplot por Número de Personas Mayores (MAY) en plano 3-4
fig10 <- fviz_pca_biplot(res.pca, 
                        axes = c(3, 4),
                        geom.ind = "point", 
                        habillage = as.factor(df_pca$MAY),
                        pointsize = 1.5, 
                        col.var = "black", 
                        alpha.ind = 0.7,
                        repel = TRUE, 
                        title = "Figura 10. Biplot en el plano 3-4 según personas mayores en el hogar") +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", color = "#00a0b0", size = 16, hjust = 0.5),
    plot.background = element_rect(fill = "white", color = NA),
    legend.position = "right",
    panel.grid.major = element_line(color = "#e5e5e5"),
    panel.grid.minor = element_blank()
  )
ggsave("resultados/graficos_articulo/Figura_10_PCA_Biplot_MAY.png", plot = fig10, width = 12, height = 8, dpi = 300, type = "cairo")

# ---------------------------------------------------------
# FASE 4: TABLAS DE RESULTADOS (Para Reporte y Excel)
# ---------------------------------------------------------
message("Generando Tablas 2 y 3...")

# Mapeo a 9 regiones de control
# Mapeo a 6 regiones estándar de control del DANE
crear_6_regiones <- function(region, depto) {
  depto <- as.numeric(unlist(depto))
  region <- as.numeric(unlist(region))
  case_when(
    depto == 11 ~ 'Bogotá, D.C. (Cabecera)',
    depto == 88 ~ 'Caribe',              # San Andrés va a Caribe
    depto == 5  ~ 'Central',             # Antioquia va a Central
    depto == 76 ~ 'Pacífica',            # Valle va a Pacífica
    region == 1 ~ 'Caribe',
    region == 2 ~ 'Oriental',
    region == 3 ~ 'Central',
    region == 4 ~ 'Pacífica',
    TRUE ~ 'Amazonía - Orinoquía'
  )
}

# Calcular conteos de hogares
hog_counts <- base_nac |>
  mutate(
    pob_flat = as.numeric(unlist(POBRE)),
    reg_flat = as.numeric(unlist(REGION)),
    dep_flat = as.numeric(unlist(DEPARTAMENTO)),
    REG9 = crear_6_regiones(reg_flat, dep_flat) # Mantenemos REG9 para compatibilidad con Quarto
  ) |>
  group_by(REG9, pob_flat) |>
  summarise(N = round(sum(as.numeric(unlist(FEX_C)), na.rm = TRUE)), .groups = 'drop') |>
  tidyr::pivot_wider(names_from = pob_flat, values_from = N, names_prefix = 'hog_') |>
  mutate(hog_total = hog_0 + hog_1)

# Calcular conteos de personas (Alineado con metodología oficial DANE)
per_counts <- base_nac |>
  mutate(
    pob_flat = as.numeric(unlist(POBRE)),
    reg_flat = as.numeric(unlist(REGION)),
    dep_flat = as.numeric(unlist(DEPARTAMENTO)),
    REG9 = crear_6_regiones(reg_flat, dep_flat)
  ) |>
  group_by(REG9, pob_flat) |>
  summarise(N = round(sum(as.numeric(unlist(FEXP)), na.rm = TRUE)), .groups = 'drop') |>
  tidyr::pivot_wider(names_from = pob_flat, values_from = N, names_prefix = 'per_') |>
  mutate(per_total = per_0 + per_1)

# Combinar tabla 2
orden_regiones <- c(
  'Bogotá, D.C. (Cabecera)', 'Pacífica', 'Amazonía - Orinoquía', 
  'Central', 'Oriental', 'Caribe'
)

tabla_2 <- hog_counts |>
  left_join(per_counts, by = 'REG9') |>
  mutate(REG9 = factor(REG9, levels = orden_regiones)) |>
  arrange(REG9) |>
  mutate(Incidencia_Pct = round((per_1 / per_total) * 100, 1))

# Calcular el verdadero Total Nacional usando la base_nacional.rds (calibrada para el total país)
base_nacional_true <- readRDS("datos/procesados/base_nacional.rds")

hog_nac <- base_nacional_true |>
  mutate(pob_flat = as.numeric(unlist(POBRE))) |>
  group_by(pob_flat) |>
  summarise(N = round(sum(as.numeric(unlist(FEX_C)), na.rm = TRUE)), .groups = 'drop') |>
  tidyr::pivot_wider(names_from = pob_flat, values_from = N, names_prefix = 'hog_') |>
  mutate(hog_total = hog_0 + hog_1)

per_nac <- base_nacional_true |>
  mutate(pob_flat = as.numeric(unlist(POBRE))) |>
  group_by(pob_flat) |>
  summarise(N = round(sum(as.numeric(unlist(FEXP)), na.rm = TRUE)), .groups = 'drop') |>
  tidyr::pivot_wider(names_from = pob_flat, values_from = N, names_prefix = 'per_') |>
  mutate(per_total = per_0 + per_1)

total_nac <- data.frame(
  REG9 = 'Total nacional',
  hog_0 = hog_nac$hog_0,
  hog_1 = hog_nac$hog_1,
  hog_total = hog_nac$hog_total,
  per_0 = per_nac$per_0,
  per_1 = per_nac$per_1,
  per_total = per_nac$per_total,
  Incidencia_Pct = round((per_nac$per_1 / per_nac$per_total) * 100, 1)
)

tabla_2 <- bind_rows(tabla_2 |> mutate(REG9 = as.character(REG9)), total_nac)

# Tabla 3: Cargas de las variables en las 5 Dimensiones del PCA
tabla_3 <- data.frame(
  Variable = rownames(res.pca$var$coord),
  Dim1 = res.pca$var$coord[, 1],
  Dim2 = res.pca$var$coord[, 2],
  Dim3 = res.pca$var$coord[, 3],
  Dim4 = res.pca$var$coord[, 4],
  Dim5 = res.pca$var$coord[, 5]
)

# Exportar tablas a Excel
wb <- createWorkbook()
addWorksheet(wb, "Tabla_2_Pobreza")
addWorksheet(wb, "Tabla_3_PCA")
writeData(wb, "Tabla_2_Pobreza", tabla_2)
writeData(wb, "Tabla_3_PCA", tabla_3)
saveWorkbook(wb, "resultados/Tablas_Articulo_2025.xlsx", overwrite = TRUE)

message("¡Gráficos de alta calidad y Tablas generados!")
