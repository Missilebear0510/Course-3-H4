cat("\014")

source("F:\\DataScience\\Course 3\\H4FunCombine.R")
source("F:\\DataScience\\Course 3\\H4FunExtract.R")
source("F:\\DataScience\\Course 3\\H4FunTidyData.R")

dir="Combine"
Combine(dir)
sExtract="Extract.txt"
Extract(dir,sExtract)
sTidy="TidyData.txt"
GenTiday(sExtract,sTidy)
# dat<-read.table(sExtract)
# 
# dat1=split(dat,as.factor(dat[,1]))
# 
# lsub=length(dat1)
# nrec=0
# Dat=data.frame()
# dat3=matrix()
# ldat=length(dat[1,])
# for(i in 1:lsub){
#   s=sprintf("%d",i)
#   print(s)
#   dat2=split(dat1[[s]],dat1[[s]][,2])
#   for(j in 1:length(dat2)){
#     print(names(dat2)[j])
#     dat3=dat2[[j]][,3:ldat]
#     nrec=nrec+1
#     Dat[nrec,1]=i
#     Dat[nrec,2]=names(dat2)[j]
#     d<-colMeans(dat3, na.rm = TRUE)
#     for(k in 3:ldat){
#       Dat[nrec,k]<-d[k-2]
#     } 
#    
#   }
# }
# 
# colnames(Dat)<-colnames(dat)
# 
# stidy="TidyData.txt"
# write.table(Dat,stidy,row.name=FALSE)
