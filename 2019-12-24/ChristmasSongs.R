library(tidyverse)
library(ggplot2)
library(magrittr)
source("./Utilities/Utils.R")

datasetdate<-"2019-12-24"
christmas_songs  <- DownLoadAndLoadData(datasetdate,'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-12-24/christmas_songs.csv')
christmas_lyrics  <- DownLoadAndLoadData(datasetdate,'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-12-24/christmas_lyrics.tsv',type="tsv")


myplot<-ggplot(data = christmas_songs %>% 
         group_by(year) %>% 
         summarise(NumSongs=n_distinct(songid))
      ) + 
geom_line(mapping = aes(x=year,y=NumSongs),size=1.5,color="#FF0012") + #FFFBFB") +
  
  #1767FF
  theme_classic() +
theme(panel.grid.major.x = element_blank()) +
theme(panel.grid.minor.x = element_blank()) +
theme(panel.grid.major.y = element_blank()) +
theme(panel.grid.minor.y = element_blank()) +
scale_x_discrete(limit=c(1960,1970,1980,1990,2000,2010),position = "bottom") +
scale_y_discrete(limit=c(2,4,6,8,10,12)) +
#theme(panel.background =   element_rect(fill = "#B3000C"))+
theme(panel.background =   element_rect(fill = "#00B32C"))+
#theme(panel.background =   element_rect(fill = "#EF0B3D"))+
theme(plot.background = element_rect(fill = "#D8D8D8"))+

  labs(title = "Christmas Songs in the Billboard Top 100 over the decades",
     x="Decade",y="Number of Songs in the Top 100")+
  theme(plot.title = element_text(size=20, face="bold", vjust=1, lineheight=0.6,colour = "#00B32C"))+
  theme(
    axis.title.x = element_text(color="#00B32C", vjust=-0.35),
    axis.title.y = element_text(color="#00B32C" , vjust=0.35) ,
    axis.text = element_text(color="#00B32C")
  )

ggsave("./2019-12-24/Figures/ChristmasTrend.png",plot = myplot,dpi = "retina")
