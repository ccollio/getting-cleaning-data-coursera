# Getting and Cleaning Data Project - Code Book
- Filename: CodeBook.md
- Author: Clifford Collio
- Purpose: Provides additional information about variables, data and any transformations that have been used in creating the tidy data set.

## The Data Set
The dataset being manipulated represents data collected from the accelerometers from the Samsung Galaxy S. A full description is available at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), and the data is available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

### Data Records
For each record the following was provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

## Data Cleansing Approach
Note: The original project assignment does not specify that the listed steps had to be carried out in that specific order. The approach below accomplishes all required steps.

### Libraries Used
* [dplyr](http://cran.r-project.org/web/packages/dplyr/index.html) - Data manipulation library employed mainly to perform the final grouping and summarization of means for the final tidy data set. 

### Import Data
Read data as tables from the following files:

* X_train.txt
* Y_train.txt
* subject_train.txt
* X_test.txt
* Y_test.txt
* subject_test.txt
* features.txt
* activity_labels.txt

### Use Descriptive Variable Names
* Leverage the current names list found in "./features.txt", but the transformations retain the parts of the name that make it unqiue. 
* Remove distracting characters - parentheses and commas - from the current variable names; use dashes to make the names more readable.
* Use make.names() to make the names syntactically valid.
* Each name remains unique and descriptive per the original features text file.
* Apply the names to BOTH training and test data sets to make merging more seamless. 

### Merge Training and Test Data
* Use the row and column bind functions in dplyr to merge training and test data.
* Clean up variables that are no longer needed after the merge.

### Extract Mean and Standard Deviation Data
* Select from the full_combined data set the columns with names including "mean" or "std".
* Also include the columns for subject and activity.
* Clean up variables no longer needed.

### Use Descriptive Names for Activities
* Employ the match function to replace the activity numerics in full_combined$activity with the actual activity names from "./activity_labels.txt"
* Clean up variables no longer needed.

### Create Tidy Data Set
* Employ the group_by function to build all of the subject and activity combinations for which we will be calculating mean values of the culled out mean/std accelerometer data.
* Pipe the value above to the summarise_each function in order to calculate the mean values for each variable in each of those combinations.
* The resulting tidy_data_set is a table with dimensions 180 X 80, with each row containing an observation and each column containing a specific variable.