#COURSERA: JHU_DATA SCIENCE SPECIALIZATION
##GETTING AND CLEANING DATA - ASSIGNMENT

###Assignment
Write a script that reads data from "Human Activity Recognition Using Smartphones dataset and whose output is a new tidy dataset. 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The obtained dataset has been randomly partitioned into two sets. 
More Info: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Data
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Data set includes the following files:
1. README.txt
2. features_info.txt: Shows information about the variables used on the feature vector
3. features.txt: List of all features
4. activity_labels.txt: Links the class labels with their activity name.
5. train/X_train.txt: Training set.
6. train/y_train.txt: Training labels.
7. test/X_test.txt: Test set.
8. test/y_test.txt: Test labels
9. train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
10. train/Inertial Signals/total_acc_x_train.txt: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
11. train/Inertial Signals/body_acc_x_train.txt: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
12. train/Inertial Signals/body_gyro_x_train.txt: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

###Processing Script
Script Name: run_analysis.R

R Packages:
1. Hmisc
2. data.table

Script Steps:
1. Download the data set to a directory (UCI HAR Dataset)
2. Read and load all the required files (test and training)
3. Merge the training and test data to a single data set 
4. Use grep() to extract only the measurements on the mean and standard deviation for each measurement
5. Name the activities in the data set 
6. Appropriately label the data set with descriptive and readable variable names
7. Output should be a tidy data set (tidyData.txt)

Running Script:
1. Download the data set to a directory (UCI HAR Dataset)
2. Open R Studio and use source("run_analysis.R") in working directory
3. Run R script and tidyData.txt file is generated with tidy data

###Assignment Submission
1. run_analysis.R
2. README.md
3. Codebook.md
4. tidyData.txt

###License
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
