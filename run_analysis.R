library(reshape2)

dir <- "C:/Users/Pooja/Documents/datasciencecoursera/Assignments/C3W4/UCI HAR Dataset/"

#reading features and activity data
features <- read.table(paste0(dir,"features.txt"), col.names = c("no", "functions"))
activities <- read.table(paste0(dir,"activity_labels.txt"), col.names = c("label", "activity"))
activities[,2] <- tolower(activities[,2])

#reading training data
x_train <- read.table(paste0(dir,"train/x_train.txt"))
y_train <- read.table(paste0(dir,"train/y_train.txt"))
subject_train <- read.table(paste0(dir,"train/subject_train.txt"))

#reading testing data
x_test <- read.table(paste0(dir,"test/x_test.txt"))
y_test <- read.table(paste0(dir,"test/y_test.txt"))
subject_test <- read.table(paste0(dir,"test/subject_test.txt"))

#1: Merge the training and the test sets to create one data set
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
names(subject_data) <- "subject"
names(y_data) <- "label"
names(x_data) <- features$functions
data <- cbind(subject_data, y_data, x_data)

#2: Extract only the measurements on the mean and standard deviation for each measurement
col_names <- grep("-(mean|std)", features[,2], value = TRUE)
tidy <- data[ , c("subject", "label", col_names)]

#3: Use descriptive activity names to name the activities in the data set
tidy$label <- activities[tidy$label, 2]

#4: Appropriately label the data set with descriptive variable names
names(tidy)[2] <- "activity"
names(tidy) <- gsub("^t", "Time", names(tidy))
names(tidy) <- gsub("^f", "Frequency", names(tidy))
names(tidy) <- gsub("Acc", "Accelerometer", names(tidy))
names(tidy) <- gsub("Gyro", "Gyrometer", names(tidy))
names(tidy) <- gsub("Mag", "Magnitude", names(tidy))
names(tidy) <- gsub("-mean\\(\\)", "-mean", names(tidy))
names(tidy) <- gsub("-std\\(\\)", "-std", names(tidy))
names(tidy) <- gsub("Freq\\(\\)", "Frequency", names(tidy))
names(tidy) <- gsub("BodyBody", "Body", names(tidy))

#5: From the dataset in step 4, create another tidy data set with the average of each variable for each activity and each subject
col_names <- names(tidy[3:ncol(tidy)])
data_melt <- melt(tidy, id = c("subject", "activity"), measure.vars = col_names)
final_tidy <- dcast(data_melt, subject + activity ~ variable, mean)

write.table(final_tidy, "C:/Users/Pooja/Documents/datasciencecoursera/Assignments/C3W4/FinalData.txt", row.name=FALSE)
