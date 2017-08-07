library(dplyr)
library(tidyr)
library(readr)

raw_ss <- read.csv("stdscore_raw.csv")
df <- tbl_df(raw_ss) 

df$ispassed <- as.logical(df$ispassed)


#Number of assignments per grading period per student
df %>% 
  group_by(dbsc_id, subject_id, student_id) %>% 
  summarise(AssignCount = n())%>% 
  ungroup() %>%
  summarise(count= n(), xmin = min(AssignCount), xmax = max(AssignCount), xmean = mean(AssignCount),  xmedain = median(AssignCount))
  

#Number of assignment score
df %>% 
  summarise(count = n(), xmin = min(score, na.rm=TRUE), xmax = max(score, na.rm=TRUE), xmean = mean(score, na.rm=TRUE), xmedian = median(score, na.rm=TRUE))
  
#Number of absenses
df %>% 
  #group_by(student_id) %>% 
  summarise(count = n(), xmin = min(gp_daysabsent), xmax = max(gp_daysabsent), xmean = mean(gp_daysabsent), xmedain = median(gp_daysabsent))

#Number of interventions
df %>% 
  #group_by(student_id) %>% 
  summarise(count = n(), xmin = min(gp_intervene), xmax = max(gp_intervene), xmean = mean(gp_intervene), xmedain = median(gp_intervene))

df_stdPass <-
  df %>% 
    filter(ispassed == 1) %>% 
    group_by(student_id) %>% 
    summarise(avgpscore = mean(score), avgpabsent = mean(gp_daysabsent), tassign = n_distinct(cw_id))

df_stdFail <-
  df %>% 
    filter(ispassed == 0) %>% 
    group_by(student_id) %>% 
    summarise(avgfscore = mean(score), avgfabsent = mean(gp_daysabsent))

df_stdPass %>% 
  inner_join(df_stdFail, by ="student_id") %>%
  mutate_each(funs(round(. , 2)), -student_id)

df %>% 
  group_by(student_id, ispassed) %>% 
  summarise(avgscore = mean(score), avgpabsent = mean(gp_daysabsent)) %>% 
  group_by(ispassed) %>% 
  summarise(aascore = mean(avgscore), aaabsent = mean(avgpabsent), minAbsent = min(avgpabsent), maxAbsent = max(avgpabsent), stdAbsent = sd(avgpabsent),  n= n())
  



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

