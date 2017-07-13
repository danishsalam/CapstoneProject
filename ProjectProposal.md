# Capstone Project Proposal
Danish Salam  
July 12, 2017  

## Predict student grade

The goal of this project is to identify the students who are likely to have lower grades in the benchmark assessments, and therefore taking action to expedite their progress to achieving their desired grades.

### The Problem:
Typically, on the school-wide level, benchmark testing couples student performance with extensive reporting systems in order to break down test results by the same student categories required under the federal No Child Left Behind Act (i.e. race, income, disability, and English proficiency) in addition to providing individual progress reports at the district, school, classroom, and student levels.

According to the California Department of Education, benchmark assessments often include performance tasks, but more frequently use “standardized administration and scoring procedures to help maintain validity, reliability, and fairness. Teachers usually administer common benchmark assessments to all students in the same course and grade level in the district at prescribed intervals — most often at the end of a unit of study or at the end of an academic year. 

However, It is highly possible that students who are identified as being mediocre after the benchmark assessment, could have been identified prior the assessment and expedite their progress after having some discussion.

This project will help to identify the key early warning signs for students at risk of having lower grades and not reaching at the benchmark, and therefore taking action to expedite their progress to achieving their desired grades.

### Client:
District school will be the potential client.

It will be added feature for the school to identify the risky students beforehand, so that school can take appropriate action to identify the potential cause and fix it by communicating with student, their parents or counselors. So the earlier risky students are identified the better they could be assisted to improve their progress to achieving their desired grades.

### Data:
Data of this project has been imported from a district school. The data is already cleaned.

Sample data can been seen [here](https://docs.google.com/spreadsheets/d/1CA4ZEcCyxxwZpAFJ0Q69NCLpijnFiwEF4aG24j5VBpQ/edit?usp=sharing).

Here are the some explorations of the data.

Exploration                             | Numbers
----------------------------------------| ------------- 
Avg number of assignment score per student  | 1604
Avg number of assignment score per student per academic year  | 450
Avg number of assignment per course | 1628
Avg number of assignment per course per academic year |416
Avg number of students per course | 863
Avg number of students per course per academic year | 212
Avg number of course per student  | 55
Avg number of course per student per academic year  | 14
Avg number of students per type of intervention | 1735


### Approach:
As this project will predict the numeric grades, so the regression model will be used to predict the grades during or after the 1st grading period.

### Deliverables:
A full report detailing the process undertaken to complete this analysis will be uploaded to GitHub with R code included.
