dataset=read.csv("Data.csv")
#dataset=dataset[,2:3]

install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased , SplitRatio = 0.8)

train_set=subset(dataset, split == TRUE)

test_set=subset(dataset, split == FALSE)


# train_set[,2:3] = scale(train_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])


