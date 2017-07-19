library(dplyr)
library(tidyr)
raw_ss <- read.csv("stdscore_raw.csv")
df <- tbl_df(raw_ss) 

df %>% 
  group_by(gradingPeriod, AYIdentifier, School_Domain, SubjectIdentifier) %>% 
  summarise(AssignCount = n_distinct(AssignmentName)) %>% 
  ungroup() %>%
  summarise(xmin = min(AssignCount), xmax = max(AssignCount), xmedain = median(AssignCount), xmean = mean(AssignCount))
  

df %>% 
  group_by(gradingPeriod, AYIdentifier, School_Domain, SubjectIdentifier) %>% 
  summarise(ScoreCount = n(), amax = max(Score)) 


%>% 
  ungroup() %>%
  select (ScoreCount, amin, amax, xmean, xmedeian)


gp_AssignCount %>% 
  summarise(xmin = min(AssignCount), xmax = max(AssignCount), xmedain = median(AssignCount), xmean = mean(AssignCount))

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

