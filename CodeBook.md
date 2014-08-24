---
title: "Code Book"
author: "eolaguer"
date: "Saturday, August 16, 2014"
output: html_document
---

### Source Data Descriptions

The source data in this project comes from an experiment in Human Activity Recognition involving 30 Subjects (numbered 1 to 30) performing six Activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone on the waist [1]. A more detailed description of the source data can be found in http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, and the data can be downloaded from http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip.

The raw, Time domain acceleration data (in gravity units) from the smartphone accelerometer was split into two components: Time_GravityAcceleration (Xaxis, Yaxis, Zaxis) and Time_BodyAcceleration (Xaxis, Yaxis, Zaxis). Time_BodyAcceleration.Jerk was then derived from TIme_BodyAcceleration, in the same 3 dimensions or axes. The Xaxis, Yaxis, and Zaxis components of each variable were also combined via vector addition to derive the Magnitude of each measurement (Time_GravityAcceleration-Magnitude, Time_BodyAcceleration-Magnitude, Time_BodyAcceleration.Jerk-Magnitude).

Similarly, the raw, 3-dimensional Time domain AngularVelocity data (in radians per second) from the smartphone gyroscope (Time_AngularVelocity) was used to derive Time_AngularVelocity.Jerk (Xaxis, Yaxis, Zaxis). Magnitude was also derived from the X,Y,& Z axes of both measures to obtain Time_AngularVelocity-Magnitude and Time_AngularVelocity.Jerk-Magnitude.

Finally, Fourier transformations of the Time domain measures for BodyAcceleration and AngularVelocity were used to create equivalent Frequency domain measures. There are fewer Frequency domain variables, because GravityAcceleration equivalents were not computed. Also, for some reason, the Xaxis, Yaxis, and Zaxis measures of Frequency_AngularVelocity.Jerk are not present in the source data, even if the derived Frequency_AngularVelocity.Jerk-Magnitude is presented.

All variables in the source data set are not recorded in their original units, but are normalized to a standard range between -1 and 1.

The source data was split into two sets: Training and Test. 21 of the Subjects were randomly selected for Training data (7352 observations), and the other 9 Subjects generated the Test data (2947 observations).


### Data Transformations

The Training and Test data sets were merged to consolidate all 10,299 observations covering all 30 Subjects. We also replaced the numerical Activity codes used in the original data with their more descriptive Activity labels.

Of the 561 computed variables in the source data, only the mean and standard deviation of each measurement was extracted and summarized in the output of our R script. See the 2nd column of the SelectedColumns.csv file for a complete list of the 66 computed variables included in the tidy data set.

We replaced the variable names in the original data set with more descriptive, human-readable labels. A list of the original column names from the source data can be found in the 3rd column of the SelectedColumns.csv file.

The summary output data in CleanData.txt contains the average of each selected variable per Activity and Subject, i.e. 6 Activities x 30 Subjects = 180 combinations.


[1] Original Data Source: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
