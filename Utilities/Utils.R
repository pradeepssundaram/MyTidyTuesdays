library(readr)
library(stringr)
getfilename<- function(url)
{
  splits <- str_split(url,"/")
  splits<-unlist(splits)
  fname <- splits[length(splits)]
  fname
}

DownLoadAndLoadData<- function(datasetdate,surl){

  if (!dir.exists(datasetdate))
  {
    dir.create(datasetdate)
  }
  if (!dir.exists(file.path(datasetdate,"Data")))
  {
    dir.create(file.path(datasetdate,"Data"))
    file.create(file.path(datasetdate,"Data",".gitignore"))
    write("*",file.path(datasetdate,"Data",".gitignore"))
  }
  filename<-file.path(datasetdate,"Data",getfilename(surl))
  if(!file.exists(filename)){
    dframe<-read_csv(surl)
    write_csv(dframe,filename,append = FALSE)
    return (dframe)  
  }else{
    dframe<-read_csv(filename)
    return (dframe)
  }
  
  

}

