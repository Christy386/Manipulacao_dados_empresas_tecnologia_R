library(readr)

# Example data frame with mixed data types
data <- data.frame(
  ID = 1:4,
  Value = c("$100", "200 EUR", "300.50", "ABC")
)

# Using parse_number() to extract numeric values from character strings
numeric_values <- parse_number(data$Value)

# Print the extracted numeric values
print(numeric_values)