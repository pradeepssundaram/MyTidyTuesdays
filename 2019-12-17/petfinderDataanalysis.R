library(tidyverse)
source("./Utilities/Utils.R")

datasetdate<-"2019-12-17"
dog_moves <- DownLoadAndLoadData(datasetdate,'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-12-17/dog_moves.csv')
dog_travel <- DownLoadAndLoadData(datasetdate,'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-12-17/dog_travel.csv')
dog_descriptions <- DownLoadAndLoadData(datasetdate,'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-12-17/dog_descriptions.csv')


dog_descriptions <- dog_descriptions %>% 
  filter(str_detect(contact_state,"^[a-zA-Z]+$"))

agedistribution<-dog_descriptions %>% 
  group_by(contact_state,age) %>% 
  summarise(Count=n()) %>%
  rename(State=contact_state,'Age Group'=age,Count=Count)
agedistribution$`Age Group`<- factor(agedistribution$`Age Group`,levels = c('Baby','Young','Adult','Senior'))

ageplot<-ggplot(data = agedistribution) +
          geom_bar(mapping = aes(x=reorder(State,Count),y=Count,fill=`Age Group`),position = "stack",stat = 'identity') +
          coord_flip() +
          theme_classic()+
          theme(legend.direction = "horizontal",legend.position = "top" ,legend.justification = "left") +
          scale_fill_discrete(guide=guide_legend(reverse=T)) +
          scale_y_continuous(limits = c(0, NA),expand =expand_scale(mult = c(0, 0.1))) +
          labs(x="State",y="Total Number of Dogs",fill="Age Group",
               title = "Distribution of Age Group of Dogs Available for Adoption By State",
               caption = "Plots : @deuxlappins | Data : Petfinder Via The Pudding"
               )

ggsave(filename = file.path(datasetdate,"Figures","AgeDist.png"),ageplot)
  ageplot