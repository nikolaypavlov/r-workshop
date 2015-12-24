# Data Analysis workshop
# http://hotcode.org/speeches/human-motion-recognition/
#
# Statistical modeling and prediction script
#
setwd("~/repos/r-workshop/")
source("code/data_summarization_and_cleaning.R")

# Load additional libraries
library(tree)
library(randomForest)
library(nnet)
library(caret)
library(e1071)

# Which model to choose from?

#
# Make a data prediction model using Random Forest
#
set.seed(123) # To make it reproducible 
model <- randomForest(activity ~ ., data=train, na.action=na.omit)

#
# Make a data prediction model using MLP Neural Network
#
# set.seed(23112) # To make it reproducible
# model <- nnet(activity ~ ., data=train, maxit=1000, size=8, 
#               linout=FALSE, trace=TRUE, na.action=na.omit)

#
# Make a data prediction model using Support Vector Machine 
#
# set.seed(7231) # To make it reproducible
# model <- svm(activity ~ ., data=train, na.action=na.omit)

#
# Predict test activities
#
predictions <- predict(model, newdata=test, type="class")

#
# Print confusion matrix
# Which activity classes is harder to predict?
#
print(confusionMatrix(predictions, test$activity))

# What is you benchmark model and accuracy?
benchmark_model <- tree(activity ~ ., data = train)
benchmark_pred <- predict(benchmark_model, newdata=test, type="class")
benchmark <- confusionMatrix(benchmark_pred, test$activity)$overall[1]
