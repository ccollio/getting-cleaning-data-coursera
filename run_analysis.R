#################################################################################
# Course:       Getting and Cleaning Data (Coursera)                            #
# Class:        05-04-2015 to 05-31-2015                                        #
# Filename:     run_analysis.R                                                  #
# Author:       Clifford Collio                                                 #
# Purpose:      Provides script for course project to demonstrate a student's   #
#               ability to collect, work with, and clean a data set.            #
#################################################################################

# Import libraries
library(dplyr)


###############
# IMPORT DATA #
###############
# read in training data
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/Y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

# read in the test data  
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/Y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

# read features and activity labels
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

        
##################################
# USE DESCRIPTIVE VARIABLE NAMES #
##################################
features <- features[,2] %>% gsub("\\()", "", .) %>% gsub(",", "-", .)
feature_headers <- make.names(features, unique = T, allow_ = TRUE); rm(features)

colnames(x_train) <- feature_headers
colnames(y_train)[1] <- "activity"
colnames(subject_train)[1] <- "subject"

colnames(x_test) <- feature_headers
colnames(y_test)[1] <- "activity"
colnames(subject_test)[1] <- "subject"


################################
# MERGE TRAINING AND TEST DATA #
################################
x_combined <- bind_rows(x_train, x_test); 
rm(x_train); rm(x_test)                                         
y_combined <- bind_rows(y_train, y_test)
rm(y_train); rm(y_test)                                         
subject_combined <- bind_rows(subject_train, subject_test)
rm(subject_train); rm(subject_test)                             
full_combined <- bind_cols(subject_combined, y_combined) %>% bind_cols(., x_combined)
rm(subject_combined); rm(y_combined); rm(x_combined)            


#############################
# EXTRACT MEAN AND STD DATA #
#############################
full_combined <- select(full_combined, 
                        contains("subject"),
                        contains("activity"),
                        contains("mean"),
                        contains("std"))


########################################
# USE DESCRIPTIVE NAMES FOR ACTIVITIES #
########################################
activities2 <- activities[match(full_combined$activity, activities$V1),2]
full_combined$activity <- activities2; 
rm(activities); rm(activities2)                         


########################
# CREATE TIDY DATA SET #
########################
# create tidy data set with mean of each variable for each activity and each subject
full_combined_table <- tbl_df(full_combined); rm(full_combined)
tidy_data_set <- group_by(full_combined_table, subject, activity) %>%
                   summarise_each(., funs(mean))
rm(full_combined_table)
