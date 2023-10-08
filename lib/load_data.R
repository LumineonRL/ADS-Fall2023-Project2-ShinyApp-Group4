library(here)
library(stringr)
library(readr)

load_data <- function() {
  
  CLAIMS_FILE <- "FimaNfipClaims.csv"
  
  claims_df <<- read_csv(str_c(here("data"), "/", CLAIMS_FILE))
}