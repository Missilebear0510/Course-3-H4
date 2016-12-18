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
