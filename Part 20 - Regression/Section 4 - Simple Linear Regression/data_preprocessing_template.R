# Linear Regression

# We want to know if there is a linear correlation between these two variables (years experience & salary)
# Independent variable is the years experience. Dependent is salary
dataset = read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# Now, we use the regressor to predict what the salary would be based on the test set of yearsexperience
y_pred = predict(regressor, newdata = test_set)