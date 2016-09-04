# JHU_Course3_Assignment1
JHU_Course3_Assignment1 Getting and Cleaning Data
Name: Nicholas Trigg
Course: Getting and Cleaning Data
Original study background: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
FILE: README.md
This file needs to contain an explanation of how all of the scripts work and how they are connected.

All scripting takes place within the r script named "run_analysis.R"

These are the criteria for this file:
#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement.
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names.
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The following is an explanation of the "run_analysis.R" file:
--------------------------------
This R file uses both the tidyr and the dplyr libraries.

# importation of study data
Importing ./StudyData/features.txt to a table named LABELData then priming LABELNames with the V2 label
Importing ./StudyData/activity_labels.txt to a table named activityLabels

	Expanding LabelData again:
	Importing ./StudyData/test/X_test.txt to a table named LABELData then priming LABELNames

Selecting mean|std from LABELData into LABELData
Importing ./StudyData/test/subject_test.txt to a table named subjectMap then priming LABELData$Subject with subjectmap V2 label
Importing ./StudyData/test/y_test.txt to a table named activityMap then priming activityMappings by merging activitymap and activityLabels by V1
Aligning  Columns from LABELData$activity with activityMappings$V2 
Importing ./StudyData/train/X_train.txt to a table named trainingLABELData then priming with LABELNames 
Selecting mean|std from trainingLABELData into trainingLABELData

Importing ./StudyData/train/subject_train.txt to a table named trainingSubjectMap then priming trainingLABELData$subject with the V1 label
Importing ./StudyData/train/y_train.txt to a table named trainingActivityMap
Priming trainingActivityMappings by merging activityLabels and trainingActivityMap by V1


Aligning Columns from trainingLABELData$activit with trainingActivityMappings$V2 

Row Bind the X_test (LABELData) and the X_train (trainingLABELData) which has already had the subject data attach to it 

# average for each varible
# this is also grouped by activity
See CodeBook for details of the subject and activity with all the means used in the code below

mergedLABELData %>% 
  group_by(subject, activity) %>%
  summarise(mean(tBodyAcc.mean...X), 
            mean(tBodyAcc.mean...Y),
            mean(tBodyAcc.mean...Z), 
            mean(tBodyAcc.std...X),
            mean(tBodyAcc.std...Y),
            mean(tBodyAcc.std...Z),
            mean(tGravityAcc.mean...X),
            mean(tGravityAcc.mean...Y),
            mean(tGravityAcc.mean...Z),
            mean(tGravityAcc.std...X),
            mean(tGravityAcc.std...Y),
            mean(tGravityAcc.std...Z),
            mean(tBodyAccJerk.mean...X),
            mean(tBodyAccJerk.mean...Y),
            mean(tBodyAccJerk.mean...Z),
            mean(tBodyAccJerk.std...X),
            mean(tBodyAccJerk.std...Y),
            mean(tBodyAccJerk.std...Z),
            mean(tBodyGyro.mean...X),
            mean(tBodyGyro.mean...Y),
            mean(tBodyGyro.mean...Z),
            mean(tBodyGyro.std...X),
            mean(tBodyGyro.std...Y),
            mean(tBodyGyro.std...Z),
            mean(tBodyGyroJerk.mean...X),
            mean(tBodyGyroJerk.mean...Y),
            mean(tBodyGyroJerk.mean...Z),
            mean(tBodyGyroJerk.std...X),
            mean(tBodyGyroJerk.std...Y),
            mean(tBodyGyroJerk.std...Z),
            mean(tBodyAccMag.mean..),
            mean(tBodyAccMag.std..),
            mean(tGravityAccMag.mean..),
            mean(tGravityAccMag.std..),
            mean(tBodyAccJerkMag.mean..),
            mean(tBodyAccJerkMag.std..),
            mean(tBodyGyroMag.mean..),
            mean(tBodyGyroMag.std..),
            mean(tBodyGyroJerkMag.mean..),
            mean(tBodyGyroJerkMag.std..),
            mean(fBodyAcc.mean...X),
            mean(fBodyAcc.mean...Y),
            mean(fBodyAcc.mean...Z),
            mean(fBodyAcc.std...X),
            mean(fBodyAcc.std...Y),
            mean(fBodyAcc.std...Z),
            mean(fBodyAcc.meanFreq...X),
            mean(fBodyAcc.meanFreq...Y),
            mean(fBodyAcc.meanFreq...Z),
            mean(fBodyAccJerk.mean...X),
            mean(fBodyAccJerk.mean...Y),
            mean(fBodyAccJerk.mean...Z),
            mean(fBodyAccJerk.std...X),
            mean(fBodyAccJerk.std...Y),
            mean(fBodyAccJerk.std...Z),
            mean(fBodyAccJerk.meanFreq...X),
            mean(fBodyAccJerk.meanFreq...Y),
            mean(fBodyAccJerk.meanFreq...Z),
            mean(fBodyGyro.mean...X),
            mean(fBodyGyro.mean...Y),
            mean(fBodyGyro.mean...Z),
            mean(fBodyGyro.std...X),
            mean(fBodyGyro.std...Y),
            mean(fBodyGyro.std...Z),
            mean(fBodyGyro.meanFreq...X),
            mean(fBodyGyro.meanFreq...Y),
            mean(fBodyGyro.meanFreq...Z),
            mean(fBodyAccMag.mean..),
            mean(fBodyAccMag.std..),
            mean(fBodyAccMag.meanFreq..),
            mean(fBodyBodyAccJerkMag.mean..),
            mean(fBodyBodyAccJerkMag.std..),
            mean(fBodyBodyAccJerkMag.meanFreq..),
            mean(fBodyBodyGyroMag.mean..),
            mean(fBodyBodyGyroMag.std..),
            mean(fBodyBodyGyroMag.meanFreq..),
            mean(fBodyBodyGyroJerkMag.mean..),
            mean(fBodyBodyGyroJerkMag.std..),
            mean(fBodyBodyGyroJerkMag.meanFreq..),
            mean(angle.tBodyAccMean.gravity.),
            mean(angle.tBodyAccJerkMean..gravityMean.),
            mean(angle.tBodyGyroMean.gravityMean.),
            mean(angle.tBodyGyroJerkMean.gravityMean.),
            mean(angle.X.gravityMean.),
            mean(angle.Y.gravityMean.),
            mean(angle.Z.gravityMean.))




  
