# R/06_etiquetas_diccionario.R
# Script para asignar etiquetas a las variables categóricas (Región, Departamento, etc.)

# Función para etiquetar Región (según diccionario oficial DANE)
etiquetar_region <- function(x) {
  factor(x, levels = 1:6, 
         labels = c("Caribe", "Oriental", "Central", "Pacífica", 
                    "Orinoquía-Amazonía", "Bogotá (Cabecera)"))
}

# Función para etiquetar Departamentos (DIVIPOLA)
etiquetar_departamento <- function(x) {
  nombres_deptos <- c(
    "5" = "Antioquia", "8" = "Atlántico", "11" = "Bogotá, D.C.", "13" = "Bolívar", 
    "15" = "Boyacá", "17" = "Caldas", "18" = "Caquetá", "19" = "Cauca", 
    "20" = "Cesar", "23" = "Córdoba", "25" = "Cundinamarca", "27" = "Chocó", 
    "41" = "Huila", "44" = "La Guajira", "47" = "Magdalena", "50" = "Meta", 
    "52" = "Nariño", "54" = "Norte de Santander", "63" = "Quindío", "66" = "Risaralda", 
    "68" = "Santander", "70" = "Sucre", "73" = "Tolima", "76" = "Valle del Cauca", 
    "81" = "Arauca", "85" = "Casanare", "86" = "Putumayo", "88" = "San Andrés", 
    "91" = "Amazonas", "94" = "Guainía", "95" = "Guaviare", "97" = "Vaupés", "99" = "Vichada"
  )
  unname(nombres_deptos[as.character(x)])
}

# Función para etiquetar la Zona (P3)
etiquetar_zona <- function(x) {
  factor(x, levels = 1:3, labels = c("Cabecera", "Centro Poblado", "Rural Disperso"))
}
