# Data Cleaning
Danish Salam  
August 7, 2017  



## Data Cleaning  

The purpose of this document is to identify the missing observations in the dataset, remove any extreme values and populate the missing observation with appropriate values. 


### Load capstone project data

Load the capstone project data using following commands.


```r
library(dplyr)
```

```
## Warning: package 'dplyr' was built under R version 3.4.1
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
library(tidyr)
library(readr)

raw_ss <- read.csv("stdscore_raw.csv")
stdscore <- tbl_df(raw_ss) 
```

### Identify the missing observations.
Missing values are denoted as NA (not applicable) or NAN (not a number) in R language. There are some functions to identify the missing values in the observations. 

#### complete.cases()
The function complete.cases() returns a logical vector indicating which cases are complete. By using Not operator (!), you will get the missing observations. For example:

```r
miss_stdscore <-stdscore[!complete.cases(stdscore),]
```
#### is.na(x)
is.na(x) function returns if x is missing/null/NA.


### Populate the missing values 
In stdscore dataset, ispassed variable has some missing values. Let's populate them. According to the school policy, if assignment's score is greater than and equal to 70, the assignment is considered Passed(1) otherwise failed(0). 


```r
stdscore %>% 
  mutate(ispassed = if_else(is.na(ispassed) & score<70, 0, 1))
```

```
## Warning: package 'bindrcpp' was built under R version 3.4.1
```

```
## # A tibble: 3,720 x 20
##    student_id subject_id subjectidentifier SubjectArea ayidentifier
##         <int>      <int>             <int>      <fctr>        <int>
##  1        417     272406             11080        SPED         1314
##  2        417     272406             11080        SPED         1314
##  3        417     272406             11080        SPED         1314
##  4        417     272406             11080        SPED         1314
##  5        417     272406             11080        SPED         1314
##  6        417     272406             11080        SPED         1314
##  7        417     272406             11080        SPED         1314
##  8        417     272406             11080        SPED         1314
##  9        417     272406             11080        SPED         1314
## 10        417     272406             11080        SPED         1314
## # ... with 3,710 more rows, and 15 more variables: school_domain <int>,
## #   dbsc_id <int>, gradingPeriod <fctr>, cat_id <int>, cat_name <fctr>,
## #   cw_id <int>, assign_name <fctr>, score <int>, ispassed <dbl>,
## #   gpfinalgrade <int>, gpfinalscore <int>, intervene_type <fctr>,
## #   gp_intervene <int>, gp_dayspresent <int>, gp_daysabsent <int>
```

In addition to that, interven_type variable also has some missing values and dirty values. To populate the correct and missing values, I have used case_when statement using %in% operator. Use toUpper() function to make this logical statement case-insensitive.


```r
stdscore %>% 
  mutate(intervene_type = case_when(
    toupper(.$intervene_type) %in% toupper(c("PH", "Pcall", "Phone", "P/called", "call phone")) ~ "PhoneCall",
    toupper(.$intervene_type) %in% toupper(c("PC", "ParentConf", "parentconference", "parentconferrence")) ~ "parent Conference",
    TRUE ~ "Other"
  ))
```

```
## # A tibble: 3,720 x 20
##    student_id subject_id subjectidentifier SubjectArea ayidentifier
##         <int>      <int>             <int>      <fctr>        <int>
##  1        417     272406             11080        SPED         1314
##  2        417     272406             11080        SPED         1314
##  3        417     272406             11080        SPED         1314
##  4        417     272406             11080        SPED         1314
##  5        417     272406             11080        SPED         1314
##  6        417     272406             11080        SPED         1314
##  7        417     272406             11080        SPED         1314
##  8        417     272406             11080        SPED         1314
##  9        417     272406             11080        SPED         1314
## 10        417     272406             11080        SPED         1314
## # ... with 3,710 more rows, and 15 more variables: school_domain <int>,
## #   dbsc_id <int>, gradingPeriod <fctr>, cat_id <int>, cat_name <fctr>,
## #   cw_id <int>, assign_name <fctr>, score <int>, ispassed <int>,
## #   gpfinalgrade <int>, gpfinalscore <int>, intervene_type <chr>,
## #   gp_intervene <int>, gp_dayspresent <int>, gp_daysabsent <int>
```

