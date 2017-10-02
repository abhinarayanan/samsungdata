# samsungdata markdown file

- We have the raw data downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and available at our R working directory

# run_analysis.R

1. Merges the training and the test sets to create one data set. 
2. The variables activity and source are added to these data sets from corresponding text files.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Replaced descriptive activity names to name the activities in the data set.
5. Variables names are provided from the input text files in raw data.
6. Created an independent tidy data set with the average of each variable for each activity and each subject from the above data set.

