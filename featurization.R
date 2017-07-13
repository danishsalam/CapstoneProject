raw_ss <- read.csv("stdscore_raw.csv")
df <- tbl_df(rafw_ss)

df %>% 
  filter(SubjectIdentifier=="1110") %>% 
  group_by(SubjectIdentifier) %>% 
  summarise(stdCount = n()) %>% 
  summarise(avg = mean(stdCount))

df %>% 
  filter(SubjectIdentifier=="1110") %>% 
  group_by(SubjectIdentifier, AYIdentifier) %>% 
  summarise(stdCount = n()) %>% 
  group_by(SubjectIdentifier) %>% 
  summarise(stdavg = mean(stdCount)) %>% 
  select(stdavg)



avg_subject_ay <- df %>% 
  filter(SubjectIdentifier=="1110") %>% 
  group_by(SubjectIdentifier, AYIdentifier) %>% 
  summarise(stdCount = n()) 

mean(avg_subject_ay$stdCount)

