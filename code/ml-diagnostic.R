# Data Analysis workshop
# http://hotcode.org/speeches/human-motion-recognition/
# Diagnostic script
#

setwd("~/repos/hotcode-r-workshop/")
source("code/data_summarization_and_cleaning.R")
library(nnet)
library(caret)

#
# Learning curve analysis for Neural Network model
# 
nnet_learning_curve <- function(train, test, size, decay=0, lineout=FALSE, maxit=500,
                                na.action=na.omit, trace=FALSE,
                                first_sample=floor(nrow(train)/3), 
                                last_sample=nrow(train), step=1) {
  
  # Split dataset samples into parts
  samples <- seq(first_sample, last_sample, step)
  learning_curve <- matrix(nrow=0, ncol=2)
  
  # Train the model on each iteration and increase the number of samples
  for (i in samples) {
    print(paste(i, "samples of", tail(samples,1))) # Print some progress
    
    model <- nnet(activity ~ . , data=train[1:i,], decay=decay, size=size, 
                  lineout=lineout, trace=trace, maxit=maxit)
    
    train_pred <- predict(model, train[1:i,], type="class")
    test_pred <- predict(model, test, type="class")
    
    # Get errors over the train and test sets
    train_errors <- as.numeric(confusionMatrix(train_pred, train$activity[1:i])$overall[1])
    test_errors <- as.numeric(confusionMatrix(test_pred, test$activity)$overall[1])
    
    # Accumulate them
    learning_curve <- rbind(learning_curve, c(train_errors, test_errors))
  }
  rownames(learning_curve) <- samples
  return(learning_curve)
}

#
# Plot learning curve
#
plot_learning_curve <- function(learning_curve) {
  # Plot train errors and smooth them
  plot(lowess(rownames(learning_curve), 1-learning_curve[,1]), 
       type="l", col="red", ylim=c(0,0.5), 
       xlab="Number of traning examples", 
       ylab="Error", lwd=3)
  
  # Plot test errors and smooth them
  lines(lowess(rownames(learning_curve), 1-learning_curve[,2]), 
        col="blue", lwd=3)
  
  # Plot legend and axis tick markers
  axis(2, at = seq(0,1,0.05), labels=F)
  legend("topright", c("Train Error", "Validation error"), col=c("red","blue"), lty=1)
}

#
# Main 
#

# Does your model suffer from high bias or high varience?
curve <- nnet_learning_curve(train, test, size=8, step=100)
plot_learning_curve(curve)
