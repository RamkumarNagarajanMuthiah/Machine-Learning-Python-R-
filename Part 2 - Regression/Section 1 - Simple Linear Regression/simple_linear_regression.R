#Simple_Linear_Regression

#importing_Data
dataset = read.csv("Salary_Data.csv")

#Training&Test_test_separation
set.seed(123)
split = sample.split(dataset$YearsExperience , SplitRatio = 2/3)
training_set = subset(dataset , split == TRUE)
test_set = subset(dataset , split == FALSE)

#Fitting_Simple_Linear_Regression_to_Traningset

regressor = lm(formula = Salary ~ YearsExperience ,data = training_set)

#Predict_with_test_set

y_pred = predict(regressor,newdata = test_set)

#Visualising_the_result_training_set
ggplot() +
  geom_point(aes(x = training_set$YearsExperience , y=training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience , y=predict(regressor,newdata=training_set)),
            colour = 'blue') +
  ggtitle('Salary Vs YearsExperiance (Training_set)') +
  xlab('YearsofExperiance') +
  ylab('Salary')


#Visualising_the_result_test_set
ggplot() +
  geom_point(aes(x = test_set$YearsExperience , y=test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience , y=predict(regressor,newdata=training_set)),
            colour = 'blue') +
  ggtitle('Salary Vs YearsExperiance (Test_set)') +
  xlab('YearsofExperiance') +
  ylab('Salary')
