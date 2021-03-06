#Random_Forest_Classifier
#Import Dataset
dataset = read.csv("Social_Network_Ads.csv")
dataset = dataset[,3:5]

#Spliting dataset
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased , SplitRatio = 0.75)
training_set = subset(dataset , split == TRUE)
test_set = subset(dataset , split == FALSE)

#Appling scaling
training_set[,1:2]=scale(training_set[,1:2])
test_set[,1:2]=scale(test_set[,1:2])

#Fitting Random_Forest_Classifier to dataset
#install.packages('randomforest')
library(randomforest)
classifier = randomforest(x=training_set[-3],
                          y=training_set$Purchased,
                          ntree = 10)

#predicting test set result
y_pred = predict(classifier ,newdata = test_set[-3])
y_pred = ifelse(y_pred>0.5 , 1,0)


#Creating confusion matrix
cm = table(test_set[,3],y_pred)

#visualising training set result
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Random_Forest_Classifier  (Train set)',
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
prob_set = predict(classifier, newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Random_Forest_Classifier (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

#Plotting_Decision_Tree

plot(classifier)
text(classifier)


