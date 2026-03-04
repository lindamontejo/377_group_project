


library(tidyverse)
library(naniar)
library(lubridate)


sa <- read_csv("sexual_assaults.csv") |> 
  janitor::clean_names()

so <- read_csv("sex_o.csv") |> 
  janitor::clean_names()

so <- so |>
  mutate(date = as.POSIXct(date, format = "%m/%d/%Y %H:%M:%S"))


so_year <- so |>
  mutate(
    year = lubridate::year(date),
    month = month(date),
    month_name = month(date, label = TRUE, abbr = FALSE)
  )



write.csv(so_year, file = "sex_offenses_month.csv")





is.factor(sa$description)

is.factor(sa$description)


sa_fct <- sa |> 
  mutate(
    description = factor(description), 
    location_description = factor(location_description)
  )
