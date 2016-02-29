##################################################################################################################
###   COURSERA: JOHN HOPKINS UNIVERSITY - DATA SCIENCE SPECIALIZATION
###   COURSE 3: GETTING AND CLEANING DATA

### Assignment 1:
### 


###Step 1: Set working directory
  setwd("c:\\R Programming\\JHU_DS_C3_W4\\UCI HAR Dataset\\")

###Step 2: Check if directory exists. If not, create Directory
  if(!file.exists("UCI HAR Dataset")) {
    dir.create("UCI HAR Dataset")
  }

###Step 3: Download Files
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile = ".\\UCI HAR Dataset.zip")
  downloadDate <- date()

###Step 4: Load data into R using read.table(). Check the dimensions, structure of table 
  ##Load test and train data files:
    subjectTest <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
      dim(subjectTest)
    subjectTrain <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
      dim(subjectTrain)
      str(subjectTrain)
    XTest <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
      dim(XTest)
    XTrain <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
      dim(XTrain)
      str(XTrain)
    YTest <- read.table(".\\UCI HAR Dataset\\test\\Y_test.txt")
      dim(YTest); names(YTest)
      str(YTest)
    YTrain <- read.table(".\\UCI HAR Dataset\\train\\Y_train.txt")
      dim(YTrain) names(YTrain)
      str(YTrain)
  ##Load features data file. 
      feaList <- read.table(".\\UCI HAR Dataset\\features.txt", col.names = c("featureId", "featureLabel"));
      ##Part 2: Extract columns referring to mean() and std():
        feaMeanStd <- grep("-mean\\(\\)|-std\\(\\)", feaList$featureLabel)
  ##Load activites file:
      actLabel <- read.table(".\\UCI HAR Dataset\\activity_labels.txt", col.names = c("activityId", "activityLabel" )) 
      actLabel$activityLabel <- as.character(actLabel$activityLabel)  
  
###Step 5: 
  #Part 1: Merge test and training data
    subject <- rbind(subjectTest,subjectTrain)
      #Fix columname
        colnames(subject) <- "subjectId"
        dim(subject)
    features <- rbind(XTest,XTrain)
      #Fix columname
        features <- features[,feaMeanStd]
        colnames(features) <- gsub("\\(|\\)", "", feaList$featureLabel[feaMeanStd])
        dim(features)
    activityCol <- rbind(YTest,YTrain)
      #Fix columname
        colnames(activityCol) <- "activityId"
        activity <- merge(activityCol, actLabel, by = "activityId")$activityLabel
        dim(activity)
    #Merge data
      data <- cbind(subject, features, activity)
      dim(data)
      #List all column names
        names(data)
  #Part 2: Completed above
  #Part 3:
        #Read descriptive activity names from activity_labels.txt. Already matched above. 
          head(unique(actLabel)) #6 levels 
  #Part 4: Appropriately label the dataset with descriptive variable names. 
        #Rules followed:
          #1. variable names should be complete and easy to read
          #2. Variables wich character values should be factors
          #3. variables should not have underscores or dots or white spaces
        #Load 'Hmisc' R package. Use the capitalize() for initcap functionality. Install Hmisc package if not installed. 
          library(Hmisc)
          names(data) <- capitalize(names(data))
        #Changes to the labels as per the rules:
          names(data)
          names(data) <- gsub("Acc","Accelerometer", names(data))
          names(data) <- capitalize(names(data))
          names(data) <- gsub("Acc","Accelerometer", names(data))
          names(data) <- gsub("Gyro","Gyroscope", names(data))
          names(data) <- gsub("BodyBody","Body", names(data))
          names(data) <- gsub("Mag","Magnitude", names(data))
          names(data) <- gsub("^t","Time", names(data))
          names(data) <- gsub("^f","Frequency", names(data))
          names(data) <- gsub("-mean()","Mean", names(data))
          names(data) <- gsub("-std()","STD",names(data))
          names(data) <- gsub("-freq()","Frequency", names(data))
          names(data) <- gsub("angle","Angle", names(data))
          names(data) <- gsub("gravit","Gravity", names(data))
          names(data) <- gsub("-X", " X", names(data))
          names(data) <- gsub("-Y", " Y", names(data))
          names(data) <- gsub("-Z", " Z", names(data))
        #Convert variables with character values as factor:
          data$Activity <- as.factor(data$Activity)
  #Part 5:  Create a independent tidy data set with the average of each variable for each activity and each subject
        #Load data.table R package. Package needs to be installed to load.  
           library(data.table)
           processedData <- data.table(data)
           dim(processedData)
           tidyData <- processedData[, lapply(.SD, mean), by=c("subjectId", "activity")]
           dim(tidyData) 
           write.table(tidyData, "tidyData.txt")
            

  