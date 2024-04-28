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

# Feature Scaling. Not required since the library used does this for us already
# training_set = scale(training_set)
# test_set = scale(test_set)

regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# Now, we use the regressor to predict what the salary would be based on the test set of yearsexperience
y_pred_test_set = predict(regressor, newdata = test_set)
y_pred_training_set = predict(regressor, newdata = training_set)

library(ggplot2)
# Training set
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), 
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = y_pred_training_set),
            colour = 'blue') + 
  ggtitle("Salary vs Experience(Training set)") +
  xlab("Years of exeperince") +
  ylab("Salary")

# Test set - this reveals that there is statistical significance. We discover it's not 100% correlated, tho. Linearly correlated.
ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary), 
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = y_pred_training_set),
            colour = 'blue') + 
  ggtitle("Salary vs Experience(Test set)") +
  xlab("Years of exeperince") +
  ylab("Salary")