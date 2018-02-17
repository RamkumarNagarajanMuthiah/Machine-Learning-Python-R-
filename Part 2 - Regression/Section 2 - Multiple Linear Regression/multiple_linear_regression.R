#Multiple_Linear_Regression

#Importing_Dataset
dataset=read.csv('50_Startups.csv')

#Categorical_values
dataset$State = factor(dataset$State,
                       levels = c('California','Florida','New York'),
                       labels = c(2,3,1))
#spliting_train&test_set
set.seed(123)
split=sample.split(dataset$Profit,SplitRatio = 4/5)
train_set=subset(dataset, split==TRUE)
test_set = subset(dataset, split==FALSE)

#Fitting_model
regressor = lm(formula = Profit ~ . , data = train_set)

#Predictor
y_pred=predict(regressor ,newdata = test_set)

#Building_the_Optimal_model_using_backword_Ellimination

regressor = lm(formula = Profit ~ R.D.Spend, data = dataset)

#Result: Profit is deeply depend on R.D.Spend




