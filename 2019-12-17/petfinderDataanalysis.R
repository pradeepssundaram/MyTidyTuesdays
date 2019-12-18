library(tidyverse)
library(tidyverse)
library(ggplot2)
library(magrittr)
source("./Utilities/Utils.R")

datasetdate<-"2019-12-17"
dog_moves <- DownLoadAndLoadData(datasetdate,'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-12-17/dog_moves.csv')
dog_travel <- DownLoadAndLoadData(datasetdate,'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-12-17/dog_travel.csv')
dog_descriptions <- DownLoadAndLoadData(datasetdate,'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-12-17/dog_descriptions.csv')
#


top20breeds<-dog_descriptions %>% 
  group_by(breed_primary) %>% 
  summarise(cnt=n()) %>% mutate(sumcnt=sum(cnt)) %>% 
  mutate(Percentage=paste0(round(100*cnt/sumcnt,2),'%')) %>% 
  arrange(desc(cnt)) %>% 
  top_n(20,wt = cnt) %>% 
  select(Breed = breed_primary, Percentage)

top3breedsbystate<-dog_descriptions %>% 
                    group_by(contact_state,breed_primary) %>% 
                    summarise(cnt=n()) %>% 
                    arrange(contact_state,desc(cnt)) %>% 
                    filter(cnt >3) %>% 
                    top_n(3,cnt) 
  
 