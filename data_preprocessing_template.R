# Imports the dataset. You can view it on the right hand side of RStudio
dataset = read.csv("Data.csv")

# Clean up missing data
# Check if value in Age column is missing
dataset$Age = ifelse(
                  is.na(dataset$Age),
                  # calculate average and ask to add missing values
                  ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                  dataset$Age
)

dataset$Salary = ifelse(
  is.na(dataset$Salary),
  # calculate average and ask to add missing values
  ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
  dataset$Salary
)

# Encoding categorical data to numbers/factors (since text isn't compatible for crunching numbers)
dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'), # c is a vector. This is a vector of 3 elements
                         labels = c(1, 2, 3))

dataset$Purchased = factor(dataset$Purchased,
                         levels = c('No', 'Yes'), # c is a vector. This is a vector of 3 elements
                         labels = c(0, 1))

# Split data into training set and test set. caTools library will be used