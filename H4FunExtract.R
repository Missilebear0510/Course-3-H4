Extract<-function(dir,sExtract)

{
 
  sf=sprintf("Combine\\SubAct.txt")
  a<-read.table(sf)
  
  replace=c("WALKING",
            "WALKING_UPSTAIRS",
            "WALKING_DOWNSTAIRS", "SITTING",
            "STANDING",
            "LAYING")
  la=length(a$Act)
  
  for(i in 1:la){
    a$ActLab[i]=replace[a$Act[i]]
  }
  dat=cbind(a$Sub,a$ActLab)
  
  dat<-Extractfile(dir,dat)
  write.table(dat, file = sExtract)
  dat
}



Extractfile<-function(dir,dat){
  f<-dir(dir)
  lf=length(f)
  
   for(i in 1:lf){
       if(length(grep(f[i],"SubAct.txt"))==0){
         print(f[i])
         sf1=sprintf("%s\\%s",dir,f[i])
         s=gsub("body_","",f[i])
         s1=gsub(".txt","_mean",s)
         s2=gsub(".txt","_sd",s)
         a<-read.table(sf1)
         la<-dim(a)[1]
         b=vector()
         c=vector()
         for(j in 1:la){
           dat0=as.numeric(as.character(a[j,]))
           b[j]=mean(dat0)
           c[j]=sd(dat0)
         }
         dat=cbind(dat,b,c)
         colnames(dat)[colnames(dat)=="b"] <- s1
         colnames(dat)[colnames(dat)=="c"] <- s2
         }
   
   }
  colnames(dat)[1]="Subject"
  colnames(dat)[2]="Act"
 
  dat
  
}




