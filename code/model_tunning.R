#
# R script for data analysis workshop
# http://hotcode.org/speeches/human-motion-recognition/
#
setwd("~/repos/r-workshop/")
source("code/data_summarization_and_cleaning.R")

# Load additional libraries
library(randomForest)
library(nnet)
library(kernlab)
library(caret)

# Can you find optimal hyperparameters?

# Cross-Validate on the training set
ctrl <- trainControl(method="cv", number=5)

#
# Tune Random Forest Hyper Params
#
set.seed(415)
model <- train(activity ~ ., data=train, tuneGrid=expand.grid(.mtry=c(2,3,4,5)), method="rf", na.action=na.omit, trControl=ctrl)

#
# Tune Neural Network hyperparams
#
# set.seed(14)
# model <- train(activity ~ ., data=train, method="nnet", linout=FALSE,
#                maxit=1000, trace=TRUE, na.action=na.omit, trControl=ctrl)

#
# Tune Support Vector Machine hyperparams
#
# set.seed(1331)
# model <- train(activity ~ ., data=train, method="svmRadial", na.action=na.omit, trControl=ctrl)

#
# Print information about selected model
#
print(model)

#
# Predict train activities
#
predictions <- predict(model, newdata = test)

#
# Print confusion matrix
#
print(confusionMatrix(predictions, test$activity))

#
# Plot Accuracy vs Hyperparameter
# 
plot(model)

