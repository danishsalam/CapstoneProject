library(dplyr)
library(tidyr)
library(readr)

raw_ss <- read.csv("stdscore_raw.csv")
df <- tbl_df(raw_ss) 

df$ispassed <- as.logical(df$ispassed)



df %>% 
  group_by(dbsc_id, subject_id, student_id) %>% 
  summarise(AssignCount = n())%>% 
  ungroup() %>%
  summarise(xmin = min(AssignCount), xmax = max(AssignCount), xmedain = median(AssignCount), xmean = mean(AssignCount),xn= n())
  

df %>% 
  group_by(student_id) %>%
  summarise(xmin = min(score, na.rm=TRUE), xmax = max(score, na.rm=TRUE), xmedian = median(score, na.rm=TRUE), xmean = mean(score, na.rm=TRUE), xn = n())%>% 
  ungroup() %>%
  select (student_id, xmin, xmax, xmean, xmedian,xn)


df %>% 
  group_by(subject_id, ) %>% 
  summarise(stdcount = n_distinct(Student_ID)) %>% 
  ungroup() %>%
  summarise(xmin = min(stdcount), xmax = max(stdcount), xmedain = median(stdcount), xmean = mean(stdcount))


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

