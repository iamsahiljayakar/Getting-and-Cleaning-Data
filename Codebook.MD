#COURSERA: JHU_DATA SCIENCE SPECIALIZATION
##GETTING AND CLEANING DATA - ASSIGNMENT

###Assignment
Write a script that reads data from "Human Activity Recognition Using Smartphones dataset and whose output is a new tidy dataset. 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The obtained dataset has been randomly partitioned into two sets. 
More Info: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Study Design
1. Download data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. On unzipping; the data set includes the following files:	
	* README.txt
	* features_info.txt: Shows information about the variables used on the feature vector.
	* features.txt: List of all features
	* activity_labels.txt: Links the class labels with their activity name.
	* train/X_train.txt: Training set.
	* train/y_train.txt: Training labels.
	* test/X_test.txt: Test set.
	* test/y_test.txt: Test labels
	* train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
	* train/Inertial Signals/total_acc_x_train.txt: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
	* train/Inertial Signals/body_acc_x_train.txt: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
	* train/Inertial Signals/body_gyro_x_train.txt: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
3. Read subject_test and subject_train data and store in subjectTest and subjectTrain objects
4. Merge subjectTest and subjectTrain into a new dataframe called subject
5. Read X_test and X_train data and store to XTest and XTrain objects respectively
6. Merge XTest and XTrain objects into a new dataframe called features
7. Read Y_test and Y_train data and store to YTest and YTrain objects respectively
8. Merge YTest and YTrain objects into a new dataframe called activity
9. Use dim() and str() to check the dimensions and structure of data frames
10. Read features.txt file and store the data in a variable called feaList. 
11. Extract the measurements on the mean and standard deviations using the grep(). Also remove symbols to clean the data set
12. Read the activity_labels.txt file and store in actLabel
13. Clean the activityLabel column and convert to character class
14. Merge subject, activity and features to form a new data frame called 'data'
15. Using the dim() function on 'data' there are 66 corresponding columns
16. Using the names() on 'data' column names are displayed which are appear to be untidy
17. Using the Hmsic package and gsub(); label the columns appropriately for ease of understanding
18. Convert the activity variable to factors. The activity variable has 6 levels
19. Load the data.table package to convert 'data' dataframe to a data table for efficient processing
20. Calculate the mean and standard deviations for each group
21. Use the write.table() to generate output to a file called 'tidyData'
9. Merge the test and training data to a form a new data frame called 'data'. Also fix the column names appropriately
10. Use the names() to check the column names
11. Match the activity_label


#### Tidy Data Variables:
	"SubjectId" 
	"TimeBodyAccelerometerelerometerMean X"                 
	"TimeBodyAccelerometerelerometerMean Y"                
 	"TimeBodyAccelerometerelerometerMean-Z"               
	"TimeBodyAccelerometerelerometerSTD X"                 
	"TimeBodyAccelerometerelerometerSTD Y"                 
	"TimeBodyAccelerometerelerometerSTD-Z"                  
	"TimeGravityAccelerometerelerometerMean X"             
	"TimeGravityAccelerometerelerometerMean Y"             
	"TimeGravityAccelerometerelerometerMean-Z" 
        "TimeGravityAccelerometerelerometerSTD X"               
	"TimeGravityAccelerometerelerometerSTD Y"           
	"TimeGravityAccelerometerelerometerSTD-Z"
	"TimeBodyAccelerometerelerometerJerkMean X"
	"TimeBodyAccelerometerelerometerJerkMean Y"         
	"TimeBodyAccelerometerelerometerJerkMean-Z"             
	"TimeBodyAccelerometerelerometerJerkSTD X"              
	"TimeBodyAccelerometerelerometerJerkSTD Y"             
	"TimeBodyAccelerometerelerometerJerkSTD-Z"              
	"TimeBodyGyroscopeMean X"                               
	"TimeBodyGyroscopeMean Y"                              
	"TimeBodyGyroscopeMean-Z"                               
	"TimeBodyGyroscopeSTD X"                                
	"TimeBodyGyroscopeSTD Y"                               
	"TimeBodyGyroscopeSTD-Z"                                
	"TimeBodyGyroscopeJerkMean X"                           
	"TimeBodyGyroscopeJerkMean Y"                          
	"TimeBodyGyroscopeJerkMean-Z"                           
	"TimeBodyGyroscopeJerkSTD X"                            
	"TimeBodyGyroscopeJerkSTD Y"                           
	"TimeBodyGyroscopeJerkSTD-Z"                            
	"TimeBodyAccelerometerelerometerMagnitudeMean"          
	"TimeBodyAccelerometerelerometerMagnitudeSTD"          
	"TimeGravityAccelerometerelerometerMagnitudeMean"       
	"TimeGravityAccelerometerelerometerMagnitudeSTD"        
	"TimeBodyAccelerometerelerometerJerkMagnitudeMean"     
	"TimeBodyAccelerometerelerometerJerkMagnitudeSTD"       
	"TimeBodyGyroscopeMagnitudeMean"                        
	"TimeBodyGyroscopeMagnitudeSTD"                        
	"TimeBodyGyroscopeJerkMagnitudeMean"                    
	"TimeBodyGyroscopeJerkMagnitudeSTD"                     
	"FrequencyBodyAccelerometerelerometerMean X"           
	"FrequencyBodyAccelerometerelerometerMean Y"            
	"FrequencyBodyAccelerometerelerometerMean-Z"            
	"FrequencyBodyAccelerometerelerometerSTD X"            
	"FrequencyBodyAccelerometerelerometerSTD Y"             
	"FrequencyBodyAccelerometerelerometerSTD-Z"             
	"FrequencyBodyAccelerometerelerometerJerkMean X"       
	"FrequencyBodyAccelerometerelerometerJerkMean Y"       
	"FrequencyBodyAccelerometerelerometerJerkMean-Z"        
	"FrequencyBodyAccelerometerelerometerJerkSTD X"        
	"FrequencyBodyAccelerometerelerometerJerkSTD Y"         
	"FrequencyBodyAccelerometerelerometerJerkSTD-Z"         
	"FrequencyBodyGyroscopeMean X"                         
	"FrequencyBodyGyroscopeMean Y"                          
	"FrequencyBodyGyroscopeMean-Z"                          
	"FrequencyBodyGyroscopeSTD X"                          
	"FrequencyBodyGyroscopeSTD Y"                           
	"FrequencyBodyGyroscopeSTD-Z"                           
	"FrequencyBodyAccelerometerelerometerMagnitudeMean"    
	"FrequencyBodyAccelerometerelerometerMagnitudeSTD"      
	"FrequencyBodyAccelerometerelerometerJerkMagnitudeMean" 
	"FrequencyBodyAccelerometerelerometerJerkMagnitudeSTD" 
	"FrequencyBodyGyroscopeMagnitudeMean"                   
	"FrequencyBodyGyroscopeMagnitudeSTD"                   
	"FrequencyBodyGyroscopeJerkMagnitudeMean"              
	"FrequencyBodyGyroscopeJerkMagnitudeSTD"                
	"Activity"  


