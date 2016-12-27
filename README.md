# Course-3-H4
Project Description:

This project asks to generate a tidy dataset from raw data collected from the accelerometers of Samsung smartphone. 
The practice in this project includes the follwing steps
1) Merging data from traning and test sets;
2) Extracting only measurments on mean and standard deviation;
3) Properbly labling variable names;
4) Generating tidy data set for average values of each variable for each subject and activity.

The details data processing procedure in run_analysis.R script 
# Step 1 Merges the training and the test sets 
1.1 Merge information of subject and activity from training andtest set
1.2 Merge measurement from training andtest set
1.3 Merge information of subject, activity and measuremetn 
1.4 Output combined infomration 

# Step 2 Extracts only the measurements on mean and standard deviation for each measurement
2.1 Reading in data from combined file
2.2 Reading in feature names
2.3 Identify feature names have "mean" and "std"
2.4 Identify variables with feature names having "mean" and "std"

# Step 3 Uses descriptive activity names to name the activities in the data set
# Step 4 Appropriately labels the data set with descriptive variable names
# Output extracted infomration for "mean" and "std" 

# Step 5 Creates an independent tidy data set with the average of each variable for each activity and each subject.
5.1 Reading data from extracted file
5.2 Spliting data based on subject
5.3 Spliting data based on activity
5.4 Processing mean of variables for each subject and activity
5.5 Output clean data set
