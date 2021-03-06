# Capstone Project Proposal
Danish Salam  
July 12, 2017  

## Predict student grade

The goal of this project is to identify the students who are likely to have lower grades in the benchmark assessments, and therefore taking action to expedite their progress to achieving their desired grades.

### The Problem:
Typically, on the school-wide level, benchmark testing couples student performance with extensive reporting systems in order to break down test results by the same student categories required under the federal No Child Left Behind Act (i.e. race, income, disability, and English proficiency) in addition to providing individual progress reports at the district, school, classroom, and student levels.

According to the California Department of Education, benchmark assessments often include performance tasks, but more frequently use “standardized administration and scoring procedures to help maintain validity, reliability, and fairness. Teachers usually administer common benchmark assessments to all students in the same course and grade level in the district at prescribed intervals — most often at the end of a unit of study or at the end of an academic year. 

However, It is highly possible that students who are identified as being mediocre after the benchmark assessment, could have been identified prior the assessment and expedite their progress after having some discussion.

This project will help to identify the key early warning signs for students at risk of having lower grades and not reaching the benchmark, and therefore taking action to expedite their progress to achieving their desired grades.

### Client:
District school will be the potential client.

It will be added the feature for the school to identify the risky students beforehand so that school can take appropriate action to identify the potential cause and fix it by communicating with the student, their parents or counselors. So the earlier struggling students are identified the better they could be assisted to improve their progress to achieving their desired grades.

### Data:
Data of this project has been imported from a district school. There are around 3720 observations of 20 variables in the dataset. The dataset contains assignment and grading period scores of around 30 students. 

Sample data can be seen [here](https://github.com/danishsalam/CapstoneProject/blob/master/stdscore_raw.csv).

Following are the descriptions of each variable.

Variable    | Description                                      |
------------| -------------------------------------------------|
student_id        | Student identifier
subject_id        | Subject identifier
subjectidentifier | Subject number. It will be same across the academic year, unlike subject identifier.
SubjectArea     | Subject area. e.g. (math, eng, special ed.)
ayidentifier | Academic year
school_domain | School identifier
dbsc_id | Grading Period identifier
gradingPeriod | Grading period name
cat_id | Assignment category identifier. It used to categorize the assignment.
cat_name | Category name
cw_id | Assignment identifier
assign_name| Assignment name
score | Assignment score of the student
ispassed | Determine whether a student has passed the assignment or not. Student is considered pass if he scored 70%
gpfinalgrade | Final grade of the grading period. It is calculated based on all the assignment score in the grading period.
intervene_type | Student communication type.
gp_intervene | 0: Student has not communicated, 1: Student has communicated in the grading period, 2: Student has communicated in the academic year. 
gp_dayspresent| Number of present in the grading period
gp_daysabsent | Number of absence in the grading period


Here are some explorations of the data.

Exploration                             | Count | Min | Max | Mean | Median
----------------------------------------| ----| ----| -----| --------| -----| 
Number of assignments per grading period per student      | 321 | 1 | 30 | 11.5  | 12|
Number of assignment score                 | 3720 | 1| 105| 77| 85|
Number of absences   | 3720 | 0| 27| 2.9| 2|
Number of interventions per grading period | 3720 | 1| 2| 1.9| 2|


Featurization                                  |   |
-----------------------------------------------| --|
Total number of passing assignment by student   |
Total number of failing assignment by student   |
Final result of each grading period |
Total number of intervention in grading period|
Total number of absent in each grading period|


### Approach:
As this project will predict the numeric grades, so the regression model will be used to predict the grades during or after the 1st grading period.

### Deliverables:
A full report detailing the process undertaken to complete this analysis will be uploaded to GitHub with R code included.
