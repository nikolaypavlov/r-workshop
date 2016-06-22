---
title       : Data Analysis with R
subtitle    : Predictive analytics
author      : Mykola Pavlov
job         : Data Scientist at Azzurro.io
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]     # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

---
## Course Logistic

* Every Wednesday 19:00 - 21:00
* Slides: http://nikolaypavlov.github.io/da-workshops-8/
* Skype Chat: https://join.skype.com/gjN0CfAd4bhg
* Install the following packages: tree, randomForest, nnet, caret, e1071, kernlab

---
## Topics

* Study Design
* Prediction and modeling
* Tricks and Tunning

---
## Study Design

1. Question
2. Define the ideal data set
3. Find the data
4. Clean it
5. Explore the data
6. Prediction and modeling
7. Interpretation of results

---
## Question

Can we use data collected by smartphone to predict human motions?
* Walking
* Walking upstairs
* Walking downstairs
* Sitting
* Standing
* Laying

---
## Ideal Data Set

* Each var forms a column, observation is a row.
* Table stores data about one kind of observation.

<img class=center src=assets/img/dataset.gif height='80%'/>

---
## Find the data

<img class=center src=assets/img/uci-dataset.png height='80%'/>

1. Git: http://github.com/nikolaypavlov/da-workshops-8/
2. Zip archive: http://bit.ly/r-workshop
3. Original: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

---
## Data Sets specs
For each record in the dataset it is provided: 
* 3-axial acceleration from the accelerometer and the estimated body acceleration
* 3-axial Angular velocity from the gyroscope
* A 561-feature vector with time and frequency domain variables
* Activity label
* An identifier of the subject who carried out the experiment. (30 volunteers)

---
## Summarizing and cleaning the data

Open code/data_summarization_and_cleaning.R
* Was the data written correctly?
```
dim(), names(), nrow(), ncol(), head(), tail()
```

* Does R recognized the var type correctly?
```
class(), str(), as.factor(), as.numeric(), options(stringsAsFactors=F)
```

* What are the values that qualitative var takes?
```
unique(), levels()
```
Note: specify a working dir by running `setwd()` command.

---

* How many vars do you have?
```
length()
```

* Are the values inside expected ranges?
```
quantile()
```

* See if some var is missing or has some logical value?
```
any()
```

* What about missing data?
```
is.na(), impute()
```

---

* Shell we fix variable names?
```
names(), tolower(), sub(), gsub()
```

* Shell we apply the data transformation?
```
transform()
```

* Shell the new vars be created?
```
rbind(), cbind()
```

---
## Steps of Prediction Analysis

1. Find the right data
2. Define your error rate
3. Split data into: Training, Testing
4. On the training set pick features
5. On the training set pick prediction function
6. On the training set cross-validate
7. Apply once to test set

---
## Statistical modeling and prediction

Open code/model.R and try Random Forest, Neural Network, SVM models
* What is you benchmark model and error rate?
* Which model to choose from?
* Which activity class is harder to predict?

---
## High Bias vs High Varience tradeoff

You have selected the model, but still not satisfied with the perfomance.
What to do next?

* More training examples?
* Less features?
* More features?
* Less complex model?
* More complex model?

To answer this questions you need to find out if your model suffer from high bias or high varience.
Open code/ml_diagnostic.R

---
## Solutions: High Bias vs High Varience

* More training examples -> Fixes high varience 
* Less features -> Fixes high varience 
* More features -> Fixes high bias
* Less complex model (in terms of regularization parameter) -> Fixes high varience
* More complex model (in terms of regularization parameter) -> Fixes high bias

---
## How well does the model generalize?

### K-fold cross-validation

<img class=center src=assets/img/k-fold-validation.gif />

* Picking variables to include in a model
* Picking the type of prediction function to use
* Picking the parameters in the prediction function
* Comparing different predictors

---
## Hyperparameters tunning and cross-validation

Open code/model_tunning.R and try to tune hyperparams of different models
* Can you find optimal hyperparameters?
* Which model is the best?

---
## Course Logistic

* Every Wednesday 19:00 - 21:00
* Slides: http://nikolaypavlov.github.io/da-workshops-8/
* Skype Chat: https://join.skype.com/gjN0CfAd4bhg
