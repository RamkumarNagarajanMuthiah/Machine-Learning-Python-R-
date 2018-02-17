#Importing_Libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

#Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X=dataset.iloc[:,1:2].values
y=dataset.iloc[:,2].values

#Fitting the decision tree to data
from sklearn.tree import DecisionTreeRegressor
regressor=DecisionTreeRegressor(random_state=0)
regressor.fit(X,y)

#Visualising the result
plt.scatter(X,y,color='red')
plt.plot(X,regressor.predict(X))
plt.xlabel('Position of Levels')
plt.ylabel('Salary')
plt.title('Truth or Bluff (Decision Tree)')
plt.show()

#Since decision tree is non - linear and non-continuous
#Split the data with 0.01 for more accurate result
X_grid=np.arange(min(X),max(X),0.01)
X_grid = np.reshape(X_grid,(len(X_grid),1))
plt.scatter(X,y,color='red')
plt.plot(X_grid,regressor.predict(X_grid))
plt.xlabel('Position of Levels')
plt.ylabel('Salary')
plt.title('Truth or Bluff (Decision Tree)')
plt.show()

#Predicting the result
y_pred = regressor.predict(6.5)