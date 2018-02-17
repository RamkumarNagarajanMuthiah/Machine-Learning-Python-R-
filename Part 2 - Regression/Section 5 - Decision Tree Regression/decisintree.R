#Importing_the_dataset
Dataset = read.csv("Position_Salaries.csv")

Dataset=Dataset[2:3]

#Fitting Decisiontree to regressor
# install.packages('rpart')
regressor = rpart(formula = Salary ~ . ,
                  data=Dataset,
                  control = rpart.control(minsplit = 1))

#Visualising the result
ggplot()+
  geom_point(aes(x=Dataset$Level , y=Dataset$Salary , color='red'))+
  geom_line(aes(x=Dataset$Level , y=predict(regressor , newdata =Dataset)))+
  xlab('Levels')+
  ylab('Salary')+
  ggtitle('Truth or Bluff (Decision Tree)')

#Since it is  non linear and non contiuous use the X_grid for more accurate result
X_grid = seq(min(Dataset$Level),max(Dataset$Level),0.01)
ggplot()+
  geom_point(aes(x=Dataset$Level , y=Dataset$Salary , color='red'))+
  geom_line(aes(x=X_grid , y=predict(regressor , data.frame(Level=X_grid))))+
  xlab('Levels')+
  ylab('Salary')+
  ggtitle('Truth or Bluff (Decision Tree)')

#Predicting the result
y_pred = predict(regressor , data.frame(Level = 6.5))
