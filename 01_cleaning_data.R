
## loading packages ---
library(tidyverse)
library(naniar)
library(lubridate)


## read in data ----
# sexual assualt 
sa <- read_csv("data/sexual_assaults.csv") |> 
  janitor::clean_names()
# sexual offenses 
so <- read_csv("sex_o.csv") |> 
  janitor::clean_names()


## Cleaning data (changing date column) ----
so <- so |>
  mutate(date = as.POSIXct(date, format = "%m/%d/%Y %H:%M:%S"))

so_year <- so |>
  mutate(
    year = lubridate::year(date),
    month = month(date),
    month_name = month(date, label = TRUE, abbr = FALSE)
  )



write.csv(so_year, file = "sex_offenses_month.csv")


is.factor(so$description)
levels (so$description)
cat_vars <- names(so)[sapply(so, function(x) is.factor(x) | is.character(x))]


so <- so |> 
  mutate(across(all_of(cat_vars), ~ tolower(.))) |> 
  mutate(
    description = factor(description), 
    location_description = factor(location_description), 
    arrest = factor(arrest), 
    domestic = factor(domestic)
  )

write.csv(so, file = "data/sex_offenses_clean.csv")

