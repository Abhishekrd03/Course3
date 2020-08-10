---
title: "Getting and Cleaning Data Course Project"
output: word_document
---

# Dataset
The dataset can be downloaded from here:

[Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

# Files
- "README.md"
- "CodeBook.md" describes the variables and any transformation work that I performed on the dataset to clean up the data.
- "run_analysis.R" performs the 5 steps required in the course project's definition. The steps are:
  + Merges the training and the test sets to create one data set.
  + Extracts only the measurements on the mean and standard deviation for each measurements.
  + Uses descriptive activity names to name the activities in the data set.
  + Appropriately labels the data set with descriptive variable names.
  + From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- "FinalData.txt" is the final tidy data obtained after running run_analysis.R
