#Importing_the_dataset
Dataset = read.csv("Position_Salaries.csv")

Dataset=Dataset[2:3]

#Fitting SVR to regressor
# install.packages('e1071')
regressor = svm(formula = Salary ~ . ,
                data=Dataset,
                type='eps-regression')

#Visualising_the_result
ggplot()+
  geom_point(aes(x=Dataset$Level , y=Dataset$Salary , color='red'))+
  geom_line(aes(x=Dataset$Level , y=predict(regressor , newdata =Dataset)))+
  xlab('Levels')+
  ylab('Salary')+
  ggtitle('Truth or Bluff (SVR)')

#Predicting_the_result
y_pred = predict(regressor , data.frame(Level = 6.5))