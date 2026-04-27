library(tidyverse)

data_train <- read_delim(
  "data/data_train.csv",
  delim = ";",
  locale = locale(encoding = "UTF-8")
) |>
  rename(
    trimestre = "Trimestre",
    tipo_producto = "Tipo de producto",
    corredor = "Corredor",
    empresa = "Empresa",
    tipo_servicio = "Tipo de servicio",
    ingresos_eur = "Ingresos por venta de billetes",
    plazas_ofertadas = "Plazas Ofertadas",
    plazas_km = "Plazas.km Ofertadas (Plazas.km)",
    tren_km = "Tren.km (Tren.km)",
    viajeros = "Viajeros",
    viajeros_km = "Viajeros.km (Viajeros.km)"
  )


filtered_data_train <- data_train |>
  filter(
    tipo_producto == "LD AV",
    empresa != "Total"
  ) |>
  # Correct names & dates
  mutate(
    empresa = case_when(
      empresa == "Renfe Viajeros" ~ "Renfe",
      empresa == "Iryo" ~ "iryo",
      TRUE ~ empresa
    ),
    corredor = stringi::stri_unescape_unicode(corredor),
    fecha = ymd(paste0(
      str_sub(trimestre, 1, 4),
      "-",
      (as.integer(str_sub(trimestre, -1)) - 1) * 3 + 1,
      "-01"
    ))
  ) |>
  # select and order
  select(
    fecha,
    empresa,
    corredor,
    plazas_ofertadas,
    plazas_km,
    tren_km,
    viajeros,
    viajeros_km
  )

# Todos los corredores con los que trabajaremos
corredores <- filtered_data_train |> distinct(corredor)

# agregate of every company

total_data_train <- filtered_data_train |>
  group_by(fecha, corredor) |>
  summarise(
    plazas_ofertadas = if (all(is.na(plazas_ofertadas))) NA_real_ else sum(plazas_ofertadas, na.rm = TRUE),
    plazas_km = sum(plazas_km, na.rm = TRUE),
    tren_km = sum(tren_km, na.rm = TRUE),
    viajeros = sum(viajeros, na.rm = TRUE),
    viajeros_km = sum(viajeros_km, na.rm = TRUE),
    .groups = "drop"
  )



print(corredores)

saveRDS(filtered_data_train, "data/filtered_data_train.rds")
saveRDS(total_data_train, "data/total_data_train.rds")
