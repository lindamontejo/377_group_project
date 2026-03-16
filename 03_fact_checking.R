

## Read in data ----
library(tidyverse)
library(naniar)
library(lubridate)



## Fact checking P4
sa_arrested <- sa_year |> 
  filter(arrest == "TRUE")

sa_arrested_count <- sa_arrested |> 
  group_by(year) |> 
  count(month)

ggplot(sa_arrested_count, aes(x = month, y = n)) + 
  geom_line() +
  facet_wrap(~year)


so_arrested <- so |> 
  filter(arrest == "TRUE")

so_arrested_count <- so_arrested |> 
  group_by(year) |> 
  count(month)

ggplot(so_arrested_count, aes(x = month, y = n)) + 
  geom_line() +
  facet_wrap(~year)



## Checking slide 2 (presentation) ---- 
so_by_year <- sa |>
  group_by(year) |> 
  count(month)
