library(dplyr)
library(tidyr)
library(purrr)
library(readr)

# Get a list of CSV files in the directory
csv_files_allTypes <- list.files(path = "csv", 
                                 pattern = "Resultados_.*\\.csv", 
                                 full.names = TRUE)

combined_data_allTypes <- map(csv_files_allTypes, function(file){
  read_csv(file, col_types = cols(
    `Vol.` = col_character(),
    Último = col_character()
  ))
    
}) %>% 
  bind_rows() 

combined_data_allTypes$`Var%` <- parse_number(combined_data_allTypes$`Var%`)/100

combined_data_allTypes$`Vol.` <- combined_data_allTypes$`Vol.` %>% 
  case_when()
  parse_number()

View(combined_data_allTypes) 


