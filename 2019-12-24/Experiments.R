christmas_songs %>% 
  select(performer,songid,song,weeks_on_chart) %>% 
  distinct() %>%
  arrange(desc(weeks_on_chart)) %>%
  group_by(performer) %>%
  summarise(cnt=n()) %>%
  arrange(desc(cnt))


christmas_songs %>% 
  filter(is.na(previous_week_position)) %>% 
  select(songid,week_position,weeks_on_chart) %>% 
  arrange(week_position) %>% 
  filter(week_position<=50)



clyrics<-christmas_lyrics %>% 
  group_by(artist,songid) %>% 
  summarise(cons=reduce(lyric,str_c,sep = "\n"))

