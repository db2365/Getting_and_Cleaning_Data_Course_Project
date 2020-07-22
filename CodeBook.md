Code Book
---------

This is the code book for the TidyData set created when the
run\_analysis\_R script is run

Data Source
-----------

The source data for the project is the ’Human Activity Recognition Using
Smartphones Data Set which was built from the recordings of 30 subjects
performing activities of daily living (ADL) while carrying a
waist-mounted smartphone with embedded inertial sensors. Each person
(subject) performed six activities (WALKING, WALKING\_UPSTAIRS,
WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING)) wearing a smartphone
(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and
gyroscope, 3-axial linear acceleration and 3-axial angular velocity
measurements at a constant rate of 50Hz were captured.

The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
signals (prefix ‘t’ to denote time) were captured at a constant rate of
50 Hz. Then they were filtered using a median filter and a 3rd order low
pass Butterworth filter with a corner frequency of 20 Hz to remove
noise. Similarly, the acceleration signal was then separated into body
and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3
Hz.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the ‘f’ to
indicate frequency domain signals).

The raw source data files can be found here: Data

Citation: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity
Recognition Using Smartphones. 21th European Symposium on Artificial
Neural Networks, Computational Intelligence and Machine Learning, ESANN
2013. Bruges, Belgium 24-26 April 2013.

Variables
---------

tidy\_data contains 180 rows and 68 columns. Each row has averaged
variables for each subject and each activity.

Generated Fields
================

SubjectID - ID of subject performing the activity. Ranges from 1-30

Activity - Activity the subject is performing. 6 values: WALKING,
WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING.

Measurement Variables
=====================

timeBodyAccelerometer-mean()-X timeBodyAccelerometer-mean()-Y
timeBodyAccelerometer-mean()-Z timeBodyAccelerometer-std()-X
timeBodyAccelerometer-std()-Y timeBodyAccelerometer-std()-Z
timeGravityAccelerometer-mean()-X timeGravityAccelerometer-mean()-Y
timeGravityAccelerometer-mean()-Z timeGravityAccelerometer-std()-X
timeGravityAccelerometer-std()-Y timeGravityAccelerometer-std()-Z
timeBodyAccelerometerJerk-mean()-X timeBodyAccelerometerJerk-mean()-Y
timeBodyAccelerometerJerk-mean()-Z timeBodyAccelerometerJerk-std()-X
timeBodyAccelerometerJerk-std()-Y timeBodyAccelerometerJerk-std()-Z
timeBodyGyroscope-mean()-X timeBodyGyroscope-mean()-Y
timeBodyGyroscope-mean()-Z timeBodyGyroscope-std()-X
timeBodyGyroscope-std()-Y timeBodyGyroscope-std()-Z
timeBodyGyroscopeJerk-mean()-X timeBodyGyroscopeJerk-mean()-Y
timeBodyGyroscopeJerk-mean()-Z timeBodyGyroscopeJerk-std()-X
timeBodyGyroscopeJerk-std()-Y timeBodyGyroscopeJerk-std()-Z
timeBodyAccelerometerMagnitude-mean()
timeBodyAccelerometerMagnitude-std()
timeGravityAccelerometerMagnitude-mean()
timeGravityAccelerometerMagnitude-std()
timeBodyAccelerometerJerkMagnitude-mean()
timeBodyAccelerometerJerkMagnitude-std()
timeBodyGyroscopeMagnitude-mean() timeBodyGyroscopeMagnitude-std()
timeBodyGyroscopeJerkMagnitude-mean()
timeBodyGyroscopeJerkMagnitude-std() frequencyBodyAccelerometer-mean()-X
frequencyBodyAccelerometer-mean()-Y frequencyBodyAccelerometer-mean()-Z
frequencyBodyAccelerometer-std()-X frequencyBodyAccelerometer-std()-Y
frequencyBodyAccelerometer-std()-Z
frequencyBodyAccelerometerJerk-mean()-X
frequencyBodyAccelerometerJerk-mean()-Y
frequencyBodyAccelerometerJerk-mean()-Z
frequencyBodyAccelerometerJerk-std()-X
frequencyBodyAccelerometerJerk-std()-Y
frequencyBodyAccelerometerJerk-std()-Z frequencyBodyGyroscope-mean()-X
frequencyBodyGyroscope-mean()-Y frequencyBodyGyroscope-mean()-Z
frequencyBodyGyroscope-std()-X frequencyBodyGyroscope-std()-Y
frequencyBodyGyroscope-std()-Z
frequencyBodyAccelerometerMagnitude-mean()
frequencyBodyAccelerometerMagnitude-std()
frequencyBodyAccelerometerJerkMagnitude-mean()
frequencyBodyAccelerometerJerkMagnitude-std()
frequencyBodyGyroscopeMagnitude-mean()
frequencyBodyGyroscopeMagnitude-std()
frequencyBodyGyroscopeJerkMagnitude-mean()
frequencyBodyGyroscopeJerkMagnitude-std()

Transformations Carried Out through run\_analysis.R
---------------------------------------------------

After the raw data sets were downloaded and loaded into tables and
assigned variable names, the following transformations were carried out
to generate the tidy data set.

1 - The training and test data sets were merged into one data set,
“mergedata” (source files = X\_train and X\_test).

2 - The activity reference tables for the training and test data sets
were merged into a single table, “mergeactivity” (source files =
y\_train and y\_test).

3 - The subject reference tables for the training and test data sets
were merged into a single table, “mergesubs” (source files =
subject\_train and subject\_test).

4 - Descriptive labels detailing the measurement type were added to the
column variables in the merged data set using the features file. The
measurements are now clearly labelled in the datset.

5 - The activity and subject reference tables created in transformations
2 and 3 were used to add an activty ID and subject ID to each row of the
merged data set.

6 - Only measurements relating to mean and standard deviation
calculations were extracted from the merged data set. These were
identified where the measurement name had either mean() or std() in the
description. Remaining columns were excluded.

7 - The activty IDs were replaced with the appropriate descriptors
e.g. WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING,
LAYING)

8 - Other descriptors in the table variable names were replaced to be
more clear and descriptive (eg. “^t” became “time”)

9 - A ‘wide’ tidy data set was created where there is a single row for
each activty and subject combination and a single column for each
selected measurement average (mean) value. The data set is ordered by
subject in ascending order.
