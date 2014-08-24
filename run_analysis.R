## Make sure that the "UCI HAR Dataset" directory is in the current working 
## directory. If not, download the zip file and unzip it
if(!file.exists("UCI HAR Dataset")) {
  fileURL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip"
  download.file(fileURL, destfile = "UCI HAR Dataset.zip")
  dateDownloaded <- date()
  unzip("UCI HAR Dataset.zip")
}

## "SelectedColumns.csv" contains list of variables to include in tidy data file,
## including column number and revised variable name.
## If "SelectedColumns.csv" is not in working directory, download the file.
if(!file.exists("SelectedColumns.csv")) {
  fileURL2 <- "https://github.com/eolaguer/DataCleaningAssignment/blob/master/SelectedColumns.csv"
  download.file(fileURL2, destfile = "SelectedColumns.csv")
}
SelectedColumns <- read.csv("SelectedColumns.csv")


## Merge coded Activity data from the Training and Test data sets
TrainingActivity <- read.table("UCI HAR Dataset/train/y_train.txt")
TestActivity <- read.table("UCI HAR Dataset/test/y_test.txt")
Activity <- rbind(TrainingActivity, TestActivity)
## load descriptive Activity names to replace numerical Activity codes
ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")


## Merge Subject data from the Training and Test data sets
TrainingSubject <- read.table("UCI HAR Dataset/train/subject_train.txt", 
                              colClasses="numeric")
TestSubject <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                          colClasses="numeric")
Subject <- rbind(TrainingSubject, TestSubject)


## Merge measurement data from the Training and Test data sets,
## retaining only selected columns (i.e. mean & standard deviation of variables)
## and assigning more descriptive column names
TrainingSet <- read.table("UCI HAR Dataset/train/X_train.txt")
TestSet <- read.table("UCI HAR Dataset/test/X_test.txt")
CleanData <- rbind(TrainingSet[,SelectedColumns[,1]], TestSet[,SelectedColumns[,1]])
names(CleanData) <- SelectedColumns[,2]


## Calculate mean of each selected variable by Activity & Subject
CleanData <- aggregate(CleanData, by=list(Activity[,1], Subject[,1]), FUN=mean)

## Add column of descriptive Activity names, label the Activity & Subject columns,
## sort table by numeric Activity code and Subject, then delete numeric Activity
## codes and row names, which are not needed in final output
CleanData <- merge(ActivityLabels, CleanData, by.x="V1", by.y="Group.1")
names(CleanData)[2] <- "Activity"
names(CleanData)[3] <- "Subject"
CleanData <- CleanData[order(CleanData[,1], CleanData[,3]),]
CleanData[,1] <- NULL
rownames(CleanData) <- NULL

## Write cleaned, summarized data to output file
write.csv(CleanData, "CleanData.txt", row.names = FALSE)
