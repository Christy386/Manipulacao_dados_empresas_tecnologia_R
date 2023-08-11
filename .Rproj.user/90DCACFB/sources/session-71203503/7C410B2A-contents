library(dplyr)
library(tidyr)
library(purrr)
library(readr)
library(stringr)
library(openxlsx)

milhao <- 1000000
bilhao <- 1000000000
trilhao <- 1000000000000

# Get the 1st list of CSV files in the directory
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

# Get the 1st list of CSV files in the directory
csv_files_tecnologyType <- list.files(path = "csv", 
                                 pattern = "ResultadosTecnologia.*\\.csv", 
                                 full.names = TRUE)

combined_data_tecnologyType <- map(csv_files_tecnologyType, function(file){
  read_csv(file, col_types = cols(
    `Vol.` = col_character(),
    Último = col_character()
  ))
  
}) %>% 
  bind_rows() 

combined_data_allTypes <- combined_data_allTypes %>% #starting data rectification 
  
  #rectifying `Último`
  mutate(`Último` = case_when(
    str_detect(`Último`, ",") ~ parse_number(`Último`)/100,
    TRUE ~ parse_number(`Último`)
  )) %>% 
  
  #rectifying `Var%`
  mutate(`Var%` = `Var%` %>% 
    parse_number()/100
  ) %>% 
  
  #rectifying `Capitalização`
  mutate(`Capitalização` = str_replace_all(`Capitalização`, "[,]", ".")) %>% 
  
  mutate(`Capitalização` = case_when(
    str_detect(`Capitalização`, "T") ~ `Capitalização` %>% 
      str_replace_all("T", "") %>% 
      parse_number()*trilhao,
    str_detect(`Capitalização`, "B") ~ `Capitalização` %>% 
      str_replace_all("B", "") %>% 
      parse_number()*bilhao,
    TRUE ~ parse_number(`Capitalização`)
  )) %>% 
  
  #rectifying `Vol.`
  mutate(`Vol.` = `Vol.` %>% 
    str_replace_all("[.]", "") %>%
    parse_number()
  ) %>% 
  
  #adding column `Setor de atuação`
  mutate(`Setor de atuação` = case_when(
    Nome %in% combined_data_tecnologyType$Nome ~ "Tecnologia da Informação",
    TRUE ~ NA
  ))

print(combined_data_allTypes)

View(combined_data_allTypes) 

write.xlsx(combined_data_allTypes, "combined_data_allTypes.xlsx", rowNames = FALSE)









