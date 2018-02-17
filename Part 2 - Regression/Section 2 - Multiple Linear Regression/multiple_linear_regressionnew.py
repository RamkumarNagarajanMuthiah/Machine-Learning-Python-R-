#Multiple_Linear#Regression.

#Importing_Libarires
import numpy as np 
import matplotlib.pyplot as plt
import pandas as pd

#Importing_Dataset_split
dataset = pd.read_csv('50_Startups.csv')
X=dataset.iloc[:,:-1].values
y=dataset.iloc[:,4].values

#Categorical_variables(DUMMY VARIBLE)
from sklearn.preprocessing import LabelEncoder,OneHotEncoder
labelencoder=LabelEncoder()
X[:,3]=labelencoder.fit_transform(X[:,3])

onehot=OneHotEncoder(categorical_features=[3])
X=onehot.fit_transform(X).toarray()

#Avoid_variable_trab
X=X[:,1:]

#Train/test_split
from sklearn.cross_validation import train_test_split
X_train,X_test,y_train,y_test = train_test_split(X,y,test_size=1/5,random_state=0)

#Implementing_the_model
from sklearn.linear_model import LinearRegression
regressor=LinearRegression()
regressor.fit(X_train,y_train)

y_pred=regressor.predict(X_test)

#Building_the_optimal_model_using_Backward_Ellimination
import statsmodels.formula.api as sm
X = np.append(arr=np.ones((50,1)).astype(int) , values= X ,axis=1) #adding ones at first

X_opt= X[:,[0,1,2,3,4,5]]

regressor_ols = sm.OLS(endog=y ,exog=X_opt).fit()

regressor_ols.summary()

#reduced_variables_and_fial_result
X_opt= X[:,[0,3]]

regressor_ols = sm.OLS(endog=y ,exog=X_opt).fit()

regressor_ols.summary()

#Result : R&D has huge impact on profit
