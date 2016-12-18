# Course-3-H4
run_analysis.R 
Major drive to control analysis

H4FunCombine.R
"Combine(dir)" function
Reading raw data from test and training sets
Merging test sets of training and test in "dir"
"SubAct.txt" stores information on subject and activity for each measurement
Other files are labled by the variables in originl files 

H4FunExtract.R
"Extract(dir,sExtract)" function
Reading data from "dir" to store combined data
Generating file "sExtract" to store extracted mean and standard deviation for each measurement.
Useing descriptive names for activities in the data set
Labeling the data set with descriptive variable names

H4FunTidyData.R
"GenTiday(sExtract,sTidy)" function
Reading data from file "sExtract" for extracted information
Creating file "sTidy" to store the average of each variable for each activity and each subject.
