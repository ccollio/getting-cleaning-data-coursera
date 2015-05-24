# Getting and Cleaning Data Project - README
- Filename: README.md
- Author: Clifford Collio
- Purpose: This README provides an overview of the project output for Johns Hopkins [Getting and Cleaning Data](https://class.coursera.org/getdata-014), 05/04/15 to 05/31/15.

## Project Description
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The dataset being manipulated represents data collected from the accelerometers from the Samsung Galaxy S. A full description is available at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), and the data is available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

The specific task was to one R script called run_analysis.R that does the following:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

## Project Files
* run_analysis.R - The main (and only) project script. The script can be run as long as the current working directory is set to the Samsung data directory. 
* CodeBook.md - Contains additional information about variables, data and any transformations that have been used in creating the tidy data set.
* tidy_data_set.txt - The final tidy data set outputted using write.table() with row.name=FALSE

