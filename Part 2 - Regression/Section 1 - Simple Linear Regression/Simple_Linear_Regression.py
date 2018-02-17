#Simple_Linear_Regression

#Importing_Libraries
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

#Impoting_dataset
dataset=pd.read_csv('Salary_Data.csv')
X=dataset.iloc[:,:-1].values
y=dataset.iloc[:,1].values


from sklearn.cross_validation import train_test_split
X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=1/3,random_state=0)

#Fitting Simple_Linear_Regression _to_training_set
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, y_train)

#Predict_test_set_result
y_pred=regressor.predict(X_test)

#Visualising_the_trainingsetresult
plt.scatter(X_train,y_train, color = 'red')
plt.plot(X_train , regressor.predict(X_train) , color = 'blue')
plt.title('Salary Vs Experiance (Training_set)')
plt.xlabel('Years of Exp')
plt.ylabel('Salary')
plt.show()

#Visualising_the_testsetresult
plt.scatter(X_test,y_test , color='red')
plt.plot(X_train , regressor.predict(X_train) , color = 'blue')
plt.title('Salary Vs Experiance (Test_set)')
plt.xlabel('Years of Exp')
plt.ylabel('Salary')
plt.show()
