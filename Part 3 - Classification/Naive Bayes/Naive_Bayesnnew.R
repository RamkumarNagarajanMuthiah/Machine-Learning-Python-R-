#Naive_Bayes
#Import Dataset
dataset = read.csv("Social_Network_Ads.csv")
dataset = dataset[,3:5]

#Encoding the target feature as factor
#Else we will get a error for y_pred as factor(0)
dataset$Purchased = factor(dataset$Purchased,
                           levels = c(0,1))

#Spliting dataset
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased , SplitRatio = 0.75)
training_set = subset(dataset , split == TRUE)
test_set = subset(dataset , split == FALSE)

#Appling scaling
training_set[,1:2]=scale(training_set[,1:2])
test_set[,1:2]=scale(test_set[,1:2])

#Fitting Naive_Bayes to dataset
library(e1071)
classifier = naiveBayes(training_set[-3],
                        training_set$Purchased)



#predicting test set result

y_pred = predict(classifier ,newdata = test_set[,-3])

#Creating confusion matrix
cm = table(test_set[,3],y_pred)

#visualising training set result
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'Classifier (Train set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

#visualising test set result
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'Classifier (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))




