#Set the downloaded and unzipped folder as the working directory
#In my case the downloaded and unzipped folder is 'getdata_projectfiles_UCI HAR Dataset' and it is in 'D:/RWD'
#setwd("D:/RWD/data/getdata_projectfiles_UCI HAR Dataset")

#If you do not have the dataset follow the below steps :
#In your working directory(mine is 'D:/RWD') create a folder called 'data' if it doesn't exist using the below code : 
#if(!file.exists("./data")){dir.create("./data")}
#Downloading the dataset :
#fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileUrl,destfile="./data/getdata_projectfiles_UCI HAR Dataset.zip")
#Unzipping the dataset :
#unzip(zipfile="./data/getdata_projectfiles_UCI HAR Dataset.zip",exdir="./data/getdata_projectfiles_UCI HAR Dataset")
#Now set the downloaded and unzipped dataset as the working directory
#setwd("D:/RWD/data/getdata_projectfiles_UCI HAR Dataset")

#Load the 'dplyr' package
library(dplyr)

#The initialisation part is done, now comes the real job of the 'run_analysis.R' script
#1.Merging the training and the test sets to create one data set.
#Assining all the data frames to variables
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activity_id", "activity_name"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject_id")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_id")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject_id")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_id")

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

#2.Extracting only the measurements on the mean and standard deviation for each measurement.
TidyData <- Merged_Data %>% select(subject_id, activity_id, contains("mean"), contains("std"))

#3.Using descriptive activity names to name the activities in the data set
TidyData$activity_id <- activities[TidyData$activity_id, 2]

#4.Appropriately labeling the data set with descriptive variable names.
names(TidyData)[2] = "activity_name"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

#5.From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject.
FinalData <- TidyData %>%
    group_by(subject_id, activity_name) %>%
    summarise_all(list(mean=mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)