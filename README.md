---
title: "Read Me"
author: "eolaguer"
date: "Saturday, August 16, 2014"
output: html_document
---

###Introduction
Welcome to eolaguer's Programming Assignment for the Getting and Cleaning Data course on https://www.coursera.org. By preparing tidy data that can be used for later analysis, the aim is to demonstrate the ability to collect, work with, and clean a data set.

The input or source data for this project is derived from accelerometer and gyroscope data from a smartphone attached to the waist of 30 subjects performing 6 different activities [1]. The data can be downloaded from http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip.

The target output data lists average values per activity and per subject for selected variables, i.e. the mean and standard deviation of measurements in the above source data. An R script creates this tidy data set from the above source data and saves the data to a file called CleanData.txt.


###File List
This repo contains the following files:

**README.md** summarizes the purpose of this project, explains how the R script works and the purpose of each file in the repo.

**CodeBook.md** describes the variables, the data, and any transformations or work performed to clean up the data.

**run_analysis.R** is the R script that reads the source data, and produces the tidy data output file (CleanData.txt).

**SelectedColumns.csv** is an input file used by the run_analysis.R script. This must be in your R working directory together with the above R script. It lists the column numbers of a subset of the variables in the original data, to be included in the abovementioned tidy data files for later analysis. It also contains descriptive names for each selected variable, as well as the original variable names in the source data set.


###Instructions
The following instructions assume familiarity with the R programming language, and that R is installed in your computer. Before you run the run_analysis.R script, download the source data from http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip, and unzip the contents to your R working directory. Also copy the run_analysis.R and SelectedColumns.csv files to the same working directory.


[1] Original Data Source: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
