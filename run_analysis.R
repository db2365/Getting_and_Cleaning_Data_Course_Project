library(dplyr)
## Get the data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip", method = "curl")


#Unzip
unzip(zipfile = "./data/Dataset.zip", exdir = "./data")


#define path where the new folder has been unzipped
pathdata <- file.path("./data", "UCI HAR Dataset")
#create file with the 28 file names
files <- list.files(pathdata, recursive=TRUE)
#show the files
files


## Read Data from targeted files into variables

## Read features data:
features = read.table(file.path(pathdata, "features.txt"),header = FALSE)
## Read activity data:
activity = read.table(file.path(pathdata, "activity_labels.txt"),header = FALSE)
##Create variable names for the activity labels value
colnames(activity) <- c('ActivityID','ActivityType')


## Read Training tables:
xtrain <- read.table(file.path(pathdata, "train", "X_train.txt"),header = FALSE)
ytrain <- read.table(file.path(pathdata, "train", "y_train.txt"),header = FALSE)
subjecttrain <- read.table(file.path(pathdata, "train", "subject_train.txt"),header = FALSE)
## Read testing tables:
xtest <- read.table(file.path(pathdata, "test", "X_test.txt"),header = FALSE)
ytest = read.table(file.path(pathdata, "test", "y_test.txt"),header = FALSE)
subjecttest = read.table(file.path(pathdata, "test", "subject_test.txt"),header = FALSE)


## Merge training and test data sets to create one data set
##Merge training and test data set
mergedata <- rbind(xtrain, xtest)
#Merge activity and subject data into single reference tables
mergeactivity <- rbind(ytrain, ytest)
mergesubs <- rbind(subjecttrain, subjecttest)


#Add labels to column variables in merged dataset using the features vector  
#Add column labels to activity and subject tables
colnames(mergedata) = features[,2]
colnames(mergeactivity) = "ActivityID"
colnames(mergesubs) = "SubjectID"


#Create the main data table merging all tables
mergetotal <- cbind(mergesubs, mergeactivity, mergedata)


# Extract measurements of mean and standard deviation from dataset
sel_columns <- grepl("*mean\\(\\)|*std\\(\\)|ActivityID|SubjectID", names(mergetotal))
sel_data <- mergetotal[ , sel_columns]

# Replace actvity IDs w/ descriptive names
com_data <- merge(sel_data, activity, by="ActivityID") 
com_data <- com_data[, c(2,ncol(com_data), 3:(ncol(com_data)-1))]

## Label data set w/ descriptive names
##prefix t is replaced by time
##Acc is replaced by Accelerometer
##Gyro is replaced by Gyroscope
##prefix f is replaced by frequency
##Mag is replaced by Magnitude
##BodyBody is replaced by Body
names(com_data)<-gsub("^t", "time", names(com_data))
names(com_data)<-gsub("^f", "frequency", names(com_data))
names(com_data)<-gsub("Acc", "Accelerometer", names(com_data))
names(com_data)<-gsub("Gyro", "Gyroscope", names(com_data))
names(com_data)<-gsub("Mag", "Magnitude", names(com_data))
names(com_data)<-gsub("BodyBody", "Body", names(com_data))

# Create a tidy data set w/ average for variables calculated for all activity and subject combination
tidy_data <- aggregate(.~SubjectID + ActivityType, com_data, mean)
tidy_data <- arrange(tidy_data, SubjectID)

# Copy tidy data set to a text file for uploading into GitHub
write.table(tidy_data, "tidy_data.txt", row.names = FALSE, quote = FALSE)

