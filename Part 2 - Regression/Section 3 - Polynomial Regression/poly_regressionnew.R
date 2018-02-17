#Polinomial_Regression

#Importing_Dataset
dataset=read.csv('Position_Salaries.csv')

dataset=dataset[2:3]

#Fitting Linear_Model to Dataset
linear_regression = lm(formula = Salary ~ Level ,data=dataset)


#Fitting Polynomial_Model to Dataset

dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4

poly_regression = lm(formula=Salary ~ . ,
                     data = dataset)

#Visualising_Linear_Model_Result
ggplot()+
  geom_point(aes(x=dataset$Level , y=dataset$Salary),colour='red')+
  geom_line(aes(x=dataset$Level , y=predict(linear_regression ,newdata=dataset)),colour='blue')+
  xlab("Levels")+
  ylab("Salary")+
  ggtitle("Truth 0r Bluff(Linear Regression")

#Visualising_Polynomial_Result
ggplot()+
  geom_point(aes(x=dataset$Level , y=dataset$Salary),colour='red')+
  geom_line(aes(x=dataset$Level , y=predict(poly_regression ,newdata=dataset)),colour='blue')+
  xlab("Levels")+
  ylab("Salary")+
  ggtitle("Truth 0r Bluff(Polynimal Regression")

#Predicting a new result with Linear Model
y_pred = predict(linear_regression , data.frame(Level = 6.5))

#Predicting a new result with Polynomial Model
y_pred_poly = predict(poly_regression , data.frame(Level = 6.5,
                                                   Level2 = 6.5^2,
                                                   Level3 = 6.5^3,
                                                   Level4 = 6.5^4))


# #X_gride_seq
# x_grid = seq(min(dataset$Level),max(dataset$Level),0.1)
# ggplot()+
#   geom_point(aes(x=dataset$Level , y=dataset$Salary),colour='red')+
#   geom_line(aes(x=x_grid , y=predict(linear_regression ,data.frame(Level = x_grid))),colour='blue')




