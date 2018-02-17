#Importing_libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

dataset = pd.read_csv('Position_Salaries.csv')
X=dataset.iloc[:,1:2].values
y=dataset.iloc[:,2].values

#Remember SVR dont have Feature scaling concept !!!
from sklearn.preprocessing import StandardScaler
sc_X=StandardScaler()
X=sc_X.fit_transform(X)
sc_y=StandardScaler()
y=sc_y.fit_transform(y)

#Fitting SVR to the dataset
from sklearn.svm import SVR
regressor = SVR(kernel = 'rbf')
regressor.fit(X,y)

#Visualising_the_SVR result
plt.scatter(X,y,color='red')
plt.plot(X,regressor.predict(X))
plt.xlabel('Position of Levels')
plt.ylabel('Salary')
plt.title('Truth or Bluff (SVR)')
plt.show()

#Predicting_the_output
y_pred = sc_y.inverse_transform(regressor.predict(sc_X.transform(np.array([[6.5]]))))
