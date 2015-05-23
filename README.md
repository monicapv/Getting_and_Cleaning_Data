#Course Project
##Getting and Cleaning Data - Statement

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare 
tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. 
You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing 
the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up 
the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts 
work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example  this article . Companies like 
Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course 
website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site 
where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!


##Explanation

1) GETTING THE RAW DATA

Take the files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and download it.
The files (getdata_projectfiles_UCI HAR Dataset.zip9) must be saved into work directory and unziped there by hand, like this:

/WorkDirectory

 |-->UCI HAR Dataset
 
		|--> test
		
		|		|-->Inertial Signals
		
		|		|		|-->body_acc_x_test.txt
		
		|		|		|-->body_acc_y_test.txt
		
		|		|		|-->body_acc_z_test.txt
		
		|		|		|-->body_gyro_x_test.txt
		
		|		|		|-->body_gyro_y_test.txt
		
		|		|		|-->body_gyro_z_test.txt
		
		|		|		|-->total_acc_x_test.txt
		
		|		|		|-->total_acc_y_test.txt
		
		|		|		|-->total_acc_z_test.txt
		
				|-->subject_test.txt
				
		|		|-->X_test.txt
		
		|		|-->y_test.txt
		
		|--> train
		
				|-->Inertial Signals
				
		|		|		|-->body_acc_x_train.txt
		
		|		|		|-->body_acc_y_train.txt
		
		|		|		|-->body_acc_z_train.txt
		
		|		|		|-->body_gyro_x_train.txt
		
		|		|		|-->body_gyro_y_train.txt
		
		|		|		|-->body_gyro_z_train.txt
		
		|		|		|-->total_acc_x_train.txt
		
		|		|		|-->total_acc_y_train.txt
		
		|		|		|-->total_acc_z_train.txt
		
		|		|-->subject_train.txt
		
		|		|-->X_train.txt
		
		|		|-->y_train.txt
		
		|-->activity_labels.txt
		
		|-->features.txt
		
		|-->features_info.txt
		
		|-->README.txt


Into README.txt you can see the description about set the files to use: 
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt'|'test/subject_test.txt':: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'activity_labels.txt': Links the class labels with their activity name.


2) PROCESSING SCRIPT

First at all, load library("reshape2") and library("data.table") because we are going to use it.

 -1- Merges the training and the test sets to create one data set

 Take the data to make a table with data test and 2 new colums than identify the activity and the subject asociated 
 Take the data to make a table with data train and 2 new colums than identify the activity and the subject asociated 
 Merging train and test sets into one table

 -2- Extracts only the measurements on the mean and standard deviation for each measurement

 Take the data with features avoiding the subject
 Get only columns with mean() or std() in their names and select this in the initial table (dat)
 the features_ms correspond to column's dat except to the first two: subject and activity

 -3- es descriptive activity names to name the activities in the data set

 Use the activity_labels.txt to fill the data. 

 -4- Appropriately labels the data set with descriptive variable names. 

 Got the first two names asignated and the rest are into our variable features( with features_ms=logical var)

 -5- From the data set in step 4, creates a second, independent tidy data set with the average of each
     variable for each activity and each subject.

 Use melt to set the variables to dat_set,  id and mesure. Then use dcast for mean by id.

3) TIDY DATA FOR USE

The result first tidy data is called 'dat' and the second independent data with mesures is 'dat_mean'