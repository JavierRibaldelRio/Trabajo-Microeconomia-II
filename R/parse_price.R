library(tidyverse)

data_price <- read_delim(
  "data/data_price.csv",
  delim = ";",
  locale = locale(encoding = "UTF-8", decimal_mark = ",")
) |>
  rename(
    mes = "Mes",
    empresa = "Empresa",
    tipo_servicio = "Tipo de servicio",
    tipo_producto = "Tipo de producto",
    corredor = "Trayecto"
  ) |>
  rename_with(~ "precio_eur", .cols = starts_with("Precio"))

filtered_data_price <- data_price |>
  filter(
    tipo_producto == "LD AV",
    tipo_servicio == "Comercial",
    empresa != "Total",
    empresa != "Renfe-AVLO"
  ) |>
  mutate(
    empresa = case_when(
      empresa == "Renfe-AVE" ~ "Renfe",
      empresa == "Iryo" ~ "iryo",
      TRUE ~ empresa
    ),
    corredor = stringi::stri_unescape_unicode(corredor),
    corredor = if_else(str_detect(corredor, "laga"), "Madrid-Málaga/Granada", corredor),
    fecha = ym(mes)
  ) |>
  select(fecha, empresa, corredor, precio_eur)

saveRDS(filtered_data_price, "data/filtered_data_price.rds")
