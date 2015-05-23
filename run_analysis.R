##Get the Librarys

library("reshape2")
library("data.table")

## -1- Merges the training and the test sets to create one data set

  ##Take the data to make a table with data test and 2 new colums than identify the activity and the subject asociate  
        x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
        label_test <- read.table("./UCI HAR Dataset/test/y_test.txt",col.names="activity")
        subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",col.names="subject")

  ##Take the data to maka a table with data train and 2 new colums than identify the activity and the subject asociate 
        x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
        label_train <- read.table("./UCI HAR Dataset/train/y_train.txt",col.names="activity")
        subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",col.names="subject")

  ## Merging train and test sets into one table
        dat <- rbind(cbind(subject_test, label_test, x_test),cbind(subject_train, label_train, x_train)) 

## -2- Extracts only the measurements on the mean and standard deviation for each measurement

  ##Take the data with features avoiding the subject
        features <- read.table("./UCI HAR Dataset/features.txt")
        features <- features[,2]

  ##Get only columns with mean() or std() in their names and select this in the initial table (dat)
  ##the features_ms correspond to column's dat except to the first two: subject and activity
        
        features_ms <- grepl("mean|std", features)
        dat <- dat[,c(TRUE,TRUE,features_ms)]

## -3- es descriptive activity names to name the activities in the data set
        
  ##Use the activity_labels.txt to fill the data. 
        labels_act <- read.table("./UCI HAR Dataset/activity_labels.txt")
        dat$activity <- labels_act[dat$activity,2]

## -4- Appropriately labels the data set with descriptive variable names. 
   
  ##Got the first two names asignated and the rest are into our variable features( with features_ms=logical var)
        rest_names <- as.character(features[features_ms])
        names <- c(names(dat[1:2]), rest_names)
        colnames(dat) = names

        print("End: You got the tidy data in 'dat'")

## -5- From the data set in step 4, creates a second, independent tidy data set with the average of each
##     variable for each activity and each subject.
        
  ##Use melt to set the variables to dat_set,  id and mesure. Then use dcast for mean by id.
        dat_set = melt(dat, id = c(names(dat[1:2])) , measure.vars = rest_names)
        dat_mean <- dcast(dat_set, subject + activity ~ variable, mean)

        print("End 2: You got the tidy data independent 'dat_mean'")

## This part is only to upload at github the file, is not a part of the script for cleanning data.
        write.table(dat_mean, file = "./tidy_data2.txt")