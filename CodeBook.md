# Code Book 

## Data Source Details
* Data https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Background: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Measurements
The following sensor signals were captured using the smartphone's embedded accelerometer and gyroscope:
* three-axial linear acceleration
* three-axial angular velocity at a constant rate of 50Hz

The captured signals were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). From each window, a vector of features was obtained by calculating variables from the time and frequency domain. File 'features_info.txt' has complete details.

## Feature Selection
The features selected for this database come from the accelerometer and gyroscope three-axial raw signals tAcc-XYZ and tGyro-XYZ. 

* The time domain signals were captured at a constant rate of 50 Hz, prefix 't' denotes time
* The signals were then filtered to remove noise
* The acceleration signal was separated into body and gravity acceleration signals: 
  * tBodyAcc-XYZ
  * tGravityAcc-XYZ
* Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals:
  * tBodyAccJerk-XYZ
  * tBodyGyroJerk-XYZ
* Next, the magnitude of these three-dimensional signals were calculated using the Euclidean form:
  * tBodyAccMag
  * tGravityAccMag
  * tBodyAccJerkMag
  * tBodyGyroMag
  * tBodyGyroJerkMag
* Finally a Fast Fourier Transform (FFT) was applied to some of these signals, prefix 'f' indicates frequency domain signals:
  * fBodyAcc-XYZ
  * fBodyAccJerk-XYZ
  * fBodyGyro-XYZ
  * fBodyAccJerkMag
  * fBodyGyroMag
  * fBodyGyroJerkMag

The features were further combined with a variety of estimated variables, such as mean value, standard deviation, and max and min values.

## Transformations
 The training and the test sets were merged to form a single data set, keeping only mean and standard deviation measurements.
