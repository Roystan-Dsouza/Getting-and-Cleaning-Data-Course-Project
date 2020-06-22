## Getting and Cleaning Data Course Project - Peer-graded assignment


## The variables:   
* `activities` contains the names of the activities that were performed by the test subjects.
* `features` contains the correct names for the `X` dataset.
* `subject_test`, `x_test`, `y_test`, `subject_train`, `x_train` and `y_train` contain the data from the downloaded files.
* `X`, `Y` and `Subject` merge the previous datasets to further analysis.
* `MergedData` contains the data after merging `X`, `Y` and `Subject`.
* `TidyData` contains the data after performing steps 3, 4 and 5.
* `FinalData` contains the data after performing step 5.

## The data:
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The original data was transformed by:
1. Merging the training and the test sets to create one data set.
2. Extracting only the measurements on the mean and standard deviation for each measurement. 
3. Using descriptive activity names to name the activities in the data set
4. Appropriately labeling the data set with descriptive activity names. 
5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject. 

## About the R script:
File with R code "run_analysis.R" perform the above 5 steps.
