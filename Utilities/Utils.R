library(readr)
library(stringr)
getfilename<- function(url)
{
  splits <- str_split(url,"/")
  splits<-unlist(splits)
  fname <- splits[length(splits)]
  fname
}

DownLoadAndLoadData<- function(datasetdate,surl,type="csv"){

  if (!dir.exists(datasetdate))
  {
    dir.create(datasetdate)
  }
  if(!dir.exists(file.path(datasetdate,"Figures"))){
    dir.create(file.path(datasetdate,"Figures"))
  }
  if (!dir.exists(file.path(datasetdate,"Data")))
  {
    dir.create(file.path(datasetdate,"Data"))
    file.create(file.path(datasetdate,"Data",".gitignore"))
    write("*",file.path(datasetdate,"Data",".gitignore"))
  }
  filename<-file.path(datasetdate,"Data",getfilename(surl))
  if(!file.exists(filename)){
    if(type=="csv")
    {dframe<-read_csv(surl)
    write_csv(dframe,filename,append = FALSE)
    return (dframe)} else{
      dframe<-read_tsv(surl)
      write_tsv(dframe,filename,append = FALSE)
      return (dframe)
    }
      
  }else{
    if (type=="csv"){
      dframe<-read_csv(filename)
      return (dframe)
    }else{
      dframe<-read_tsv(filename)
      return (dframe)
    }
    
  }
  
  

}

