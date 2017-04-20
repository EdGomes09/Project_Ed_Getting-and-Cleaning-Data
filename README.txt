############################################################################################################################
## Coursera Getting and Cleaning Data Course Project
## Edgar dos Santos Gomes
## 2017-19-04

############################################################################################################################
#### 00 - The first step was created one R script called run_analysis.R and clean the workspace.

############################################################################################################################
#Step 01 - Merges the training and the test sets to create one data set.
	#1.1 - Get the link file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip;
	#1.2 - Unzip HAR.zip
	#1.3 - Get the list of the files
	#1.4 - Read the files from the UCI HAR Dataset file
	#1.5 - Read the test suite files
	#1.6 - Read the training set files
	#1.7 - Merging Test Files (x_Test,x_train)
	#1.8 - Merging Training Files (y_Test, y_train)
	#1.9 - Merging Training Files (subject_Test,subject_train)

###########################################################################################################################
#Step 02 - Extracts only the measurements on the mean and standard deviation for each measurement.
	#2.1 - Read the files from the features.txt in the suite UCI HAR Dataset
	#2.2 - Get only as averages (mean) and standard deviation (std) in the column.
	#2.3 - Subset of the data frame selected by the name of the features.
	#2.4 - correct names of the columns  in features
	#2.5 - Checking the structure

###########################################################################################################################
#Step 03 - Uses descriptive activity names to name the activities in the data set
	#3.1 - Read the files from the activity_labels.txt in suite UCI HAR Dataset
	#3.2- update values with correct activity_labels names
	#3.3 - correct names of the columns in activity_labels
	#3.4 - Checking the structure

###########################################################################################################################
#Step 04 - Appropriately labels the data set with descriptive variable names.
	#4.1 - Final merging of all data.frame in only one data set.
	#4.2 - Cleaning up the variable names
	#4.3 - Checking the new Data set
 
###########################################################################################################################
#Step 05 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	#5.1 - Installing and  packages plyr
	#5.2 - Resumindo a tabela para incluir apenas a média de cada variável para cada atividade e cada assunto
	#5.3 - Saving the tidyData set

############################################################################################################################

