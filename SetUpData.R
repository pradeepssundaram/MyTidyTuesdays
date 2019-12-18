library(tidyverse)
library(ggplot2)
library(magrittr)
source("./Utilities/Utils.R")

datasetdate<-"2019-12-17"
dog_moves <- DownLoadAndLoadData(datasetdate,'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-12-17/dog_moves.csv')
dog_travel <- DownLoadAndLoadData(datasetdate,'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-12-17/dog_travel.csv')
dog_descriptions <- DownLoadAndLoadData(datasetdate,'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-12-17/dog_descriptions.csv')
#