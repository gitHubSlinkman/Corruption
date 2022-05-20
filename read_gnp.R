# Read gnp data and compute gowth rate

library( tidyverse )                   # I live in the tidyverse.
library( readr )                       # For data input.
library( here )                        # To simplify path management

fp <- file.path( here(),              # Create path to our data.
                 "data",
                 "gnp.csv")

GNP <- read_csv( fp )
GNP



GNP <- 
 GNP %>% 
  arrange( country, year ) %>% 
  group_by( country ) %>% 
  summarise(  newest_year   = last( year ),
              oldest_yearvv = first( year ),
              years         = n(),
              newest_income = last( gnp ),
              oldest_income = first( gnp ) ) %>% 
  mutate( growth_rate     = ( newest_income / oldest_income )^( 1/ years) )

GNP
  