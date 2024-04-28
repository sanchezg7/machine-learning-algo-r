# Imports the dataset. You can view it on the right hand side of RStudio
dataset = read.csv("Data.csv")

# Clean up missing data
# Check if value in Age column is missing
dataset$Age = ifelse(
                      is.na(dataset$Age),
                      # calculuate avereage and ask to add missing values
                      ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                      dataset$Age
)