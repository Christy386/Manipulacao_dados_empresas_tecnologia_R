library(dplyr)
library(tidyr)

# Get a list of CSV files in the directory
csv_files_allTypes <- list.files(path = "csv", pattern = "Resultados_.*\\.csv", full.names = TRUE)

# Initialize an empty data frame to hold the combined data
combined_data_allTypes <- data.frame()

# Loop through each CSV file and combine them
for (file in csv_files_allTypes) {
  # Extract label from filename
  #label <- gsub("data_(.*)\\.csv", "\\1", basename(file))
  
  # Read the CSV file
  data <- read.csv(file)
  
  # Add label column
  #data$Label <- label
  
  # Append data to the combined_data data frame
  combined_data_allTypes <- rbind(combined_data_allTypes, data)
}
# Get a list of CSV files in the directory
csv_files_tecnology <- list.files(path = "csv", pattern = "ResultadosTecnologia.*\\.csv", full.names = TRUE)

# Initialize an empty data frame to hold the combined data
combined_data_tecnology <- data.frame()

# Loop through each CSV file and combine them
for (file in csv_files_tecnology) {
  # Extract label from filename
  #label <- gsub("data_(.*)\\.csv", "\\1", basename(file))
  
  # Read the CSV file
  data <- read.csv(file)
  
  # Add label column
  #data$Label <- label
  
  # Append data to the combined_data data frame
  combined_data_tecnology <- rbind(combined_data_tecnology, data)
}

#print(combined_data_tecnology)

result_combined_withTypes <- combined_data_allTypes

print(result_combined_withTypes)

result_combined_withTypes %>% 
  mutate(Setor_de_atuação = ifelse(Códigos %in% combined_data_tecnology$Códigos, "Tecnologia da Informação", NA)) %>% 
  

#filteredData <- combined_data %>% 
#  filter(Nome %in% )

# Save the combined data as a new CSV file
#write.csv(result_combined_withTypes, "csv/result_combined.csv", row.names = FALSE)
print(result_combined_withTypes)
