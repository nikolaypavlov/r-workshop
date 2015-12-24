# Data Analysis workshop
# http://hotcode.org/speeches/human-motion-recognition/
# 
# R script for data summarization and cleaning
#
setwd("~/repos/r-workshop/")

# Import data
train <- read.csv("data/train.csv")
test <- read.csv("data/test.csv")

# Was the data written correctly? - dim(), names(), nrow(), ncol(), head(), tail()
print(dim(train))

# Does R recognized the var type correctly? - class(), str(), as.factor(), as.numeric()

# What are the values that qualitative var takes? - unique(), levels()

# How many vars do you have? - length(unique())

# Are the values inside expected ranges? - quantile()

# See if some var is missing or has some logical value (e.g. more than 5)? - any()

# What about missing data? - is.na(), impute()

# Should we fix variable names? - names(), tolower(), sub(), gsub()

# Should we apply the data transformation? - transform()

# Should the new vars be created? - rbind(), cbind()
