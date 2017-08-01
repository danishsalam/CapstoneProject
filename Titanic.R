#load the required libararies.
library(tidyr)
library(dplyr)
#install.packages("ggplot2")
library("ggplot2")

## Project Summar:The purpose of this Code file is to explore the ggplot with different layers.

# remove the untidy data. Clean the surived 
titanic <- titanic %>% 
  filter(!is.na(survived))

#draw the bar plot using titanic dataframe with dodge position and by bar color will be by sex.
ggplot(titanic, aes(x = pclass, fill = sex)) + 
  geom_bar(position = "dodge")


#draw the bar plot using titanic dataframe with dodge position and by bar color will be by sex. Aditionaly, draw each plot for surived value variable.
ggplot(titanic, aes(x = pclass, fill = sex)) + 
  geom_bar(position = "dodge")+
  facet_grid(~survived)

# 4 - Define an object for position jitterdodge, to use below
posn.jd <- position_jitterdodge(0.5, 0, 0.6)

#draw the point plot using titanic dataframe with the jitter dodge position to overcome the overploting and by bar color will be by sex. 
#Aditionaly, draw each plot for surived value variable.
ggplot(titanic, aes(x = pclass, y = age, col = sex)) + 
  geom_point(size = 3, alpha = 0.5, position = posn.jd) +
  facet_grid(.~survived)