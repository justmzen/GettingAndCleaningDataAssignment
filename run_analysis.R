# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Data downloading
library('data.table')
library('dplyr')
library('reshape2')

# fileFolder <- setwd('./GettingAndCleaningDataAssignment')
# fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
# download.file(fileUrl, destfile = paste(fileFolder, '/data.zip', sep = ''))
# unzip(zipfile = 'data.zip')
# rm(fileUrl, fileFolder)

## Reading files
# Data table with activity labels
activityLabels <- data.table::fread('./UCI HAR Dataset/activity_labels.txt',
                                    col.names = c('id', 'activityLabel'),
                                    stringsAsFactors = TRUE)

# Data table with variable names and vector with relevant column names
features <- data.table::fread('./UCI HAR Dataset/features.txt',
                              col.names = c('id', 'featureLabel'))
relevantColumns <- grep(pattern = 'mean|std', x = features[, featureLabel],
                        value = TRUE)

# Train data sets
trainSubjects <- data.table::fread('./UCI HAR Dataset/train/subject_train.txt',
                                   col.names = 'subjectNumber')
trainLabels <- data.table::fread('./UCI HAR Dataset/train/y_train.txt',
                                 col.names = 'activityNumber')
train <- data.table::fread('./UCI HAR Dataset/train/X_train.txt',
                           col.names = features[, featureLabel])[, ..relevantColumns]
train <- cbind(trainSubjects, trainLabels, train)
rm(trainSubjects, trainLabels)

# Test data sets
testSubjects <- data.table::fread('./UCI HAR Dataset/test/subject_test.txt',
                                   col.names = 'subjectNumber')
testLabels <- data.table::fread('./UCI HAR Dataset/test/y_test.txt',
                                 col.names = 'activityNumber')
test <- data.table::fread('./UCI HAR Dataset/test/X_test.txt',
                          col.names = features[, featureLabel])[, ..relevantColumns]
test <- cbind(testSubjects, testLabels, test)
rm(testSubjects, testLabels, relevantColumns)
rm(features)

## Merging data sets into MD
MD <- rbind(train, test)
rm(test, train)

## Labelling variables
# Replacing the activity number with the activity label
MD <- merge(x = MD, y = activityLabels, by.x = 'activityNumber', by.y = 'id')
MD <- dplyr::select(MD, -activityNumber)
rm(activityLabels)

# Transforming subjectNumber into a factor variable
MD$subjectNumber <- as.factor(MD$subjectNumber)

## Second independent tidy data set
# Melting of MD
MD2 <- melt(data = MD, id = c('subjectNumber', 'activityLabel'))
rm(MD)

# Calculating the mean value for subsetted groups by activityLabel and variable
MD2 <- MD2[, .(meanValue = mean(value)),
           by = .(subjectNumber, variable, activityLabel)]
MD2 <- arrange(MD2, subjectNumber, variable, activityLabel)

# Writing of MD2
fwrite(x = MD2, file = 'tidy_data.csv', row.names = FALSE)
