#Polynomial_Linear_Regression

#Importing_Library
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

#Importing_dataset
dataset=pd.read_csv('Position_Salaries.csv')
X=dataset.iloc[:,1:2].values
y=dataset.iloc[:,2].values

#Linear_Regression
from sklearn.linear_model import LinearRegression
lin_reg = LinearRegression()
lin_reg.fit(X,y)

#Fitting_polinominal_regression
from sklearn.preprocessing import PolynomialFeatures
pol_reg=PolynomialFeatures(degree=4)
X_poly = pol_reg.fit_transform(X)

lin_reg_2=LinearRegression()
lin_reg_2.fit(X_poly,y)

#Visualising_Linear_Reg_model
plt.scatter(X,y,color='red')
plt.plot(X,lin_reg.predict(X))
plt.title("TRUTH or BLUFF (Linear_regression)")
plt.xlabel("Position_Level")
plt.ylabel("Salary")
plt.show()

#Visualising_Polynomial_Reg_model
X_grid = np.arange(min(X),max(X),0.1)
X_grid = X_grid.reshape(len(X_grid),1)
plt.scatter(X,y,color='red')
plt.plot(X_grid,lin_reg_2.predict(pol_reg.fit_transform(X_grid)))
plt.title("TRUTH or BLUFF (Linear_regression)")
plt.xlabel("Position_Level")
plt.ylabel("Salary")
plt.show()

#Predicting_a_Linear_model_result
lin_reg.predict(6.5)

#Predicting_a_poly_model_result
pol_reg.fit_transform(6.5)
