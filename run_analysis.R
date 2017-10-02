analyzeSamsungData <- function(){
    # Extract the data from the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    # to the working directory's UCI_HAR_Dataset folder.
    
    # load the data for test and train
    trainData <- read.delim("UCI_HAR_Dataset/train/X_train.txt",sep = "",header = F)
    testData <- read.delim("UCI_HAR_Dataset/test/X_test.txt",sep = "",header = F)
    
    # load variable names from features.txt
    headers <- read.delim("UCI_HAR_Dataset/features.txt",sep = "",header = F)
    
    # load subject and activity variables for test and train
    trainSubjectData <- read.delim("UCI_HAR_Dataset/train/subject_train.txt",sep = "",header = F)
    testSubjectData <- read.delim("UCI_HAR_Dataset/test/subject_test.txt",sep = "",header = F)
    
    trainActivityData <- read.delim("UCI_HAR_Dataset/train/y_train.txt",sep = "",header = F)
    testActivityData <- read.delim("UCI_HAR_Dataset/test/y_test.txt",sep = "",header = F)
    
    # change column names for both train and test data
    colnames(trainData) <- headers[,2]
    colnames(testData) <- headers[,2]
    
    # change column names for both train and test : subject and activity data
    colnames(trainActivityData) <- "Activity"
    colnames(testActivityData) <- "Activity"
    
    colnames(testSubjectData) <- "Subject"
    colnames(trainSubjectData) <- "Subject"
    
    # add activity and subject to both train and test data as seperate variables [columns]
    trainData <- cbind(trainActivityData, trainSubjectData,trainData)
    testData <- cbind(testActivityData, testSubjectData,testData)
    
    # merge both data to totaldata
    totalData <- rbind(trainData, testData)
    
    # subset only the mean and std variables alsong with activity and subject variables
    totalData <- totalData[,grepl("Activity|Subject|[Mm]ean|[Ss]td",names(totalData))]
    
    # converting activity values to descriptive values
    totalData$Activity <- as.character(totalData$Activity)
    totalData$Activity[totalData$Activity == "1"] <- "WALKING"
    totalData$Activity[totalData$Activity == "2"] <- "WALKING_UPSTAIRS"
    totalData$Activity[totalData$Activity == "3"] <- "WALKING_DOWNSTAIRS"
    totalData$Activity[totalData$Activity == "4"] <- "SITTING"
    totalData$Activity[totalData$Activity == "5"] <- "STANDING"
    totalData$Activity[totalData$Activity == "6"] <- "LAYING"
    
    # getting mean of each variable by activity and by subject, then store it to groupedData 
    groupedData <- aggregate(.~Activity+Subject, totalData, mean)
    
    # writing the data into a file
    write.table(groupedData,file = "SamsungData.txt",row.names = F)
    
    # displaying final grouped data
    groupedData
}
