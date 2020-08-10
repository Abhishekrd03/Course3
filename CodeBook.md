---
title: "Code Book"
output: word_document
---

- **Download the dataset**
  + Download the dataset from README.md file and extract it.  
  
- **Assigning data to variables**
  + features <- features.txt (561 rows and 2 columns)  
    features.txt is the list of all features.
  + activities <- activity_labels.txt (6 rows and 2 columns)  
    activity_labels.txt links the class labels with their activity name.
  + x_train <- x_train.txt (7352 rows and 561 columns)  
    x_train.txt is the training dataset.
  + y_train <- y_train.txt (7352 rows and 1 column)  
    y_train.txt is the training labels.
  + subject_train <- subject_train.txt (7352 rows and 1 column)  
    Each row is the subject who performed the activity.
  + x_test <- x_test.txt (2947 rows and 561 columns)  
    x_test.txt is the testing dataset.
  + y_test <- y_test.txt (2947 rows and 1 column)  
    y_test.txt is the testing labels.
  + subject_test <- subject_test.txt (2947 rows and 1 column)  
    Each row is the subject who performed the activity.  

- **Merging train and test datasets**
  + x_data <- rbind(x_train, x_test)
  + y_data <- rbind(y_train, y_test)
  + subject_data <- rbind(subject_train, subject_test)  
  Then column names were named appropriately. Then all the data was merged.
  + data <- cbind(subject_data, y_data, x_data)
  
- **Extracting only the measurements on the mean and standard deviation.**
  + "tidy"(10299 rows and 81 columns) is created by using grep() function. It contains the columns subject, label and the measurements on the mean and standard deviation.
  
- **Using descriptive activity names to name the activities in the data set**
  + The labels from "activities" are matched with the labels in "tidy" and renamed respectively.
  
- **Appropriately labelling the data set with descriptive variable names**
  + label column in "tidy" is renamed to activity.
  + All columns starting with character t is replaced by Time.
  + All columns starting with character f is replaced by Frequency.
  + All columns starting with character t is replaced by Time.
  + All Acc in column’s name replaced by Accelerometer.
  + All Gyro in column’s name replaced by Gyrometer.
  + All Mag in column’s name replaced by Magnitude.
  + All -mean() in column’s name replaced by -mean.
  + All -std() in column’s name replaced by -std.
  + All Freq in column’s name replaced by Frequency.
  + All BodyBody in column’s name replaced by Body.
  
- **From the dataset, create another tidy data set with the average of each variable for each activity and each subject**
  + The dataset is melted using the melt() function and then reshaped using the dcast() function.
  + The final tidy dataset is "final_tidy" having 180 rows and 81 columns.
  + "FinalData.txt" is the output of this script.