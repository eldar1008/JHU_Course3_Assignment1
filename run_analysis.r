
#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement.
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names.
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(tidyr)
library(dplyr)

# importation of study data

LABELMap <- read.table("./StudyData/features.txt", row.names = NULL)
LABELNames <- LABELMap$V2

activityLabels <- read.table("./StudyData/activity_labels.txt", row.names = NULL)

LABELData <- read.table("./StudyData/test/X_test.txt", col.names = LABELNames, row.names = NULL)
LABELData <- select(LABELData, matches("(mean|std)"))

subjectMap <- read.table("./StudyData/test/subject_test.txt", row.names = NULL)

LABELData$subject = subjectMap$V1

activityMap <- read.table("./StudyData/test/y_test.txt", row.names=NULL)
activityMappings <- merge(activityMap, activityLabels, by.x="V1", by.y="V1")

LABELData$activity = activityMappings$V2

trainingLABELData <- read.table("./StudyData/train/X_train.txt", col.names = LABELNames, row.names = NULL)
trainingLABELData <- select(trainingLABELData, matches("(mean|std)"))

trainingSubjectMap <- read.table("./StudyData/train/subject_train.txt", row.names = NULL)

trainingLABELData$subject = trainingSubjectMap$V1

trainingActivityMap <- read.table("./StudyData/train/y_train.txt", row.names = NULL)
trainingActivityMappings <- merge(trainingActivityMap, activityLabels, by.x="V1", by.y="V1")

trainingLABELData$activity = trainingActivityMappings$V2 


# Row Bind the X_test and the X_train which has already had the subject data attach to it 

mergedLABELData <- rbind(LABELData, trainingLABELData)


# average for each varible
# this is also grouped by activity

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




  
