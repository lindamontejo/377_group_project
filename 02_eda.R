
library(tidyverse)
library(naniar)
library(lubridate)


levels(sa_fct$year)


location <- sa_fct |> 
  count(location_description) 

ggplot(sa_)

save_csv(location, )



## Analyzing by year ---- 
by_year <- sa |> 
  count(year)

group by year to get count of each year 

ggplot(by_year, aes(x = year, y = n))+ 
  geom_line()


## Analyzing by 