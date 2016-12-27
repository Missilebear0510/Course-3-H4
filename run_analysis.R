cat("\014")

# Step 1 Merges the training and the test sets 
# to create one data set
 
# Define function to reading information on
# subject and avtivity for a certain directory
  SubAct<-function(dir){
  f<-dir(dir)
  n1=grep("subject_", f)
  n2=grep("y_", f)
  sf1=sprintf('%s\\%s',dir,f[n1])
  sf2=sprintf('%s\\%s',dir,f[n2])
  
  a1<-read.table(sf1)
  a2<-read.table(sf2)
  cbind(a1,a2)
  
}
 
 # Merge information of subject and activity 
 # from training andtest set
 dir1="UCI HAR Dataset\\train"
 dir2="UCI HAR Dataset\\test"
 a1<-SubAct(dir1)
 a2<-SubAct(dir2)
 Act<-rbind(a1,a2)
 
 # # Merge measurement
 # # from training andtest set
 f1="UCI HAR Dataset\\train\\X_train.txt"
 f2="UCI HAR Dataset\\test\\X_test.txt"
 a1<-read.table(f1)
 a2<-read.table(f2)
 a=rbind(a1,a2)
 dat<-rbind(a1,a2)
 
 # # Merge information of subject, activity and measuremetn 
 # # from training andtest set
  ComDat<-cbind(Act,dat)
 # # Output combined infomration 
  sCombine="Combine.txt"
 write.table(ComDat, file = sCombine)


# Step 2 Extracts only the measurements on the 
# mean and standard deviation for each measurement

# Reading in data from combined file
a<-read.table(sCombine)
# Reading in feature names
sFeaName="UCI HAR Dataset\\features.txt"
b<-read.table(sFeaName)
# Identify feature names have "mean" and "std"
s=as.character(b$V2)
s=c('Sub','Act',s)
n1=grep('mean',s)
n2=grep('std',s)
n=union(n1,n2)
n=union(c(1,2),n)
# Identify variables with feature names
# having "mean" and "std"
dat=a[,n]


# Step 3 Uses descriptive activity names to name 
# the activities in the data set
replace=c("WALKING","WALKING_UPSTAIRS",
          "WALKING_DOWNSTAIRS", "SITTING",
          "STANDING", "LAYING")
la=length(dat[,1])
for(i in 1:la){
  dat[i,2]=replace[as.numeric(dat[i,2])]
}

# Step 4 Appropriately labels the data set 
# with descriptive variable names
names(dat)[1:length(n)]<-s[n]

# Output extracted infomration for "mean" and "std" 
sExtract="Extract.txt"
write.table(dat, file = sExtract,row.names=FALSE)

# Step 5 Creates an independent tidy data set 
# with the average of each variable for 
# each activity and each subject.

# Reading data from extracted file
dat<-read.table(sExtract,header=TRUE)
ldat=length(dat[1,])
# split data based on subject
dat1=split(dat,as.factor(dat[,1]))
lsub=length(dat1)

nrec=0
Dat=data.frame()
for(i in 1:lsub){
  s=sprintf("%d",i)
  # split data based on activity
  dat2=split(dat1[[s]],dat1[[s]][,2])
  lact=length(names(dat2))
  for(j in 1:lact){
    dat3=dat2[[j]][3:ldat]
    
    nrec=nrec+1
    
    # Store processed mean of variables in Dat
    Dat[nrec,1]=i
    Dat[nrec,2]=names(dat2)[j]
    d<-colMeans(dat3, na.rm = TRUE)
    for(k in 3:ldat){
      Dat[nrec,k]=d[k-2]
    }
    
  }
}

# Output clean data set
sTidy="TidyData.txt"
colnames(Dat)<-colnames(dat)
write.table(Dat,sTidy,row.name=FALSE)