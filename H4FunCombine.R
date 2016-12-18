Combine<-function()
{
  if(!dir.exists("Combine")){
    dir.create("Combine")
  }
  dir1="UCI HAR Dataset\\train\\Inertial Signals"
  dir2="UCI HAR Dataset\\test\\Inertial Signals"
  Combinefile(dir1,dir2)
  dir1="UCI HAR Dataset\\train"
  dir2="UCI HAR Dataset\\test"
  sf=sprintf("Combine\\SubAct.txt")
  CombineSubAct(dir1,dir2,sf)
}



Combinefile<-function(dir1,dir2){
  
   f1<-dir(dir1)
   f2<-dir(dir2)
  
  for(i in 1:length(f1)){
    head1=gsub("_train","",f1[i])
    for(j in 1:length(f2)){
      head2=gsub("_test","",f2[j])
      if(head1==head2){
        sf=sprintf('Combine\\%s',head1)
        sf1=sprintf('UCI HAR Dataset\\train\\Inertial Signals\\%s',f1[i])
        sf2=sprintf('UCI HAR Dataset\\test\\Inertial Signals\\%s',f2[j])
        a1<-read.table(sf1)
        #print(dim(a1))
        a2<-read.table(sf2)
        #print(dim(a2))
        a=rbind(a1,a2)
        write.table(a, file = sf)
      }

    }
  }
}

CombineSubAct<-function(dir1,dir2,sf){
  a1<-SubAct(dir1)
  a2<-SubAct(dir2)
  a=rbind(a1,a2)
  names(a)=c("Sub","Act")
  write.table(a, file = sf)

}

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



