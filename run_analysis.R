###Cleaning the workspace
rm(list = ls())

#######################################################################################################################
#Step 01 - Merges the training and the test sets to create one data set.
#1.1 - Get the link's file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip;
ArqHAR<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destHAR<-file.path("~/HAR.zip")
download.file(ArqHAR,destHAR, mode = "wb")

#1.2 - Unzip HAR.zip
unzip("~/HAR.zip")

#1.3 - Get the list of the files
ArqUCIHAR<-list.files("~/UCI HAR Dataset", recursive=TRUE)
ArqUCIHAR

#1.4 - Read the files from the UCI HAR Dataset file
activity_labels<- read.table("~/UCI HAR Dataset/activity_labels.txt")
features<- read.table("~/UCI HAR Dataset/features.txt")

#1.5 - Read the test suite files
subject_Test <- read.table('~/UCI HAR Dataset/test/subject_test.txt') #imports subject_test.txt
x_Test<- read.table('~/UCI HAR Dataset/test/x_test.txt') #imports x_test.txt
y_Test<- read.table('~/UCI HAR Dataset/test/y_test.txt') #imports y_test.txt


#1.6 - Read the training set files
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt") #imports subject_train.txt
x_train <- read.table("~/UCI HAR Dataset/train/X_train.txt") #imports X_train.txt
y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt") #imports y_train.txt

#1.7 - Merging Test Files (x_Test,x_train)
x_Data<-rbind(x_Test,x_train)

#1.8 - Merging Training Files (y_Test, y_train)
y_Data<- rbind(y_Test, y_train)

#1.9 - Merging Training Files (subject_Test,subject_train)
Subject_Data<- rbind(subject_Test,subject_train)


#######################################################################################################################
#Step 02 - Extracts only the measurements on the mean and standard deviation for each measurement.
#2.1 - Read the files from the features.txt in suite UCI HAR Dataset

features<- read.table("~/UCI HAR Dataset/features.txt")

#2.2 - Get only as averages (mean) and standard deviation (std) in the column
features_Mean_std <- grep("-(mean|std)\\(\\)", features[, 2])

#2.3 - Subset of the data frame selected by the name of the features
x_Data <- x_Data[, features_Mean_std]

#2.4 - correct names of the columns  in features
names(x_Data) <- features[features_Mean_std, 2]

#2.5 - Checking the structure
str(x_Data)

#######################################################################################################################
#Step 03 - Uses descriptive activity names to name the activities in the data set
#3.1 - Read the files from the activity_labels.txt in suite UCI HAR Dataset

activity_labels<- read.table("~/UCI HAR Dataset/activity_labels.txt")

#3.2- update values with correct activity_labels names
y_Data[, 1] <- activity_labels[y_Data[, 1], 2]

#3.3 - correct names of the columns in activity_labels
names(y_Data) <- "activity_labels"

#3.4 - Checking the structure
str(y_Data)
names(Data)

######################################################################################################################
#Step 04 - Appropriately labels the data set with descriptive variable names.
#4.1 - Final merging of all data.frame in only one data set.
Data<-cbind(x_Data,y_Data,Subject_Data)
Data

#4.2 - Cleaning up the variable names
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(Data)<-gsub("V1", "subject", names(Data))
names(Data)<-gsub("activity_labels", "activity", names(Data))               
                  
                  
#4.3 - Checking the new Data set
names(Data)

######################################################################################################################
#Step 05 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable
#for each activity and each subject.
#5.1 - Installing and  packages plyr
install.packages("plyr")
library(plyr)

#5.2 - Resumindo a tabela para incluir apenas a média de cada variável para cada atividade e cada assunto
tidyData<-aggregate(. ~subject + activity, Data, mean)
tidyData<-tidyData[order(tidyData$subject,tidyData$activity),]

#5.3 - Saving the tidyData set
write.table(tidyData, file = "tidydata.txt",row.name=FALSE)
