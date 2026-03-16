# Exploring the datasets -------
### Made tables that displayed the count of different variables. Some of the results were saved to 
### use to create visuals in flourish. Graphs were also created so others could quickly look for patterns

## Read in data ----
library(tidyverse)
library(naniar)
library(lubridate)

## Load in data ----
so <- read_csv("data/sex_offenses_clean.csv")
sa <- read_csv("data/sa_with_month.csv") |> 
  janitor::clean_names()


# Analyzing location
location <- so |> 
  count(location_description) 


## Analyzing by year ---- 
so_by_year <- so |>
  group_by(year) |> 
  count(month)

sa_by_year <- sa |>
  count(year)

# group by year to get count of each year 

ggplot(by_year, aes(x = year, y = n)) + 
  geom_line() +
  labs(
    y = "Count of sexual offenses"
  )  +
  facet_wrap(~year)


## Analyzing by month 

sa_year_counts <- sa |> 
  count(year)

sa_year <- sa |> 
  group_by(year) |> 
  count(month)

ggplot(sa_year, aes(x = month, y = n)) + 
  geom_line() +
  labs(
    y = "Count of sexual assualts"
  ) +
  facet_wrap(~year)



# Fixing data format for Flourish
sa_month <- sa |> 
  count(year, month_name) |> 
  pivot_wider(
    names_from = year,
    values_from = n, 
    values_fill = 0
  )


sa_month <- sa_month |> 
  mutate(month = factor(
    month_name,
    levels = c("Jan","Feb","Mar","Apr","May","Jun",
               "Jul","Aug","Sep","Oct","Nov","Dec")
  )) |> 
  arrange(month)
  
write.csv(sa_month, file = "data/sa_month_count.csv")


# number of arrests

arrests <- so |>
  count(arrest)

arrests_sa <- sa |>
  count(arrest)


# location 

so_loaction <- so |> 
  count(location_description)

write.csv(so_loaction, file = "data/so_loaction.csv")

sa_loaction <- sa |> 
  count(location_description)

write.csv(sa_loaction, file = "data/sa_loaction.csv")

so |> 
  ggplot(aes(x = location_description)) + 
  geom_bar()


