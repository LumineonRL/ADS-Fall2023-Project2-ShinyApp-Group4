library(httr)
library(jsonlite)
library(magrittr)
library(readr)
library(here)
library(stringr)

download_data <- function() {
  DIRECTORY_TO_WRITE <- here("data")
  FILE_TO_WRITE <- "FimaNfipClaims.csv"
  CLAIMS_URL <- "https://www.fema.gov/api/open/v2/FimaNfipClaims"
  
  
  GET(CLAIMS_URL) %>%
    extract2("content") %>%
    rawToChar() %>%
    fromJSON() %>%
    extract2("FimaNfipClaims") %>%
    write_csv(str_c(DIRECTORY_TO_WRITE, "/", FILE_TO_WRITE))
}
