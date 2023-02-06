# -----------------------------------------------------------------------
# Title: Clean Student Survey Data
# Author: William Murrah
# Description: Import and clean data from student survey given to 
#              introductory statistics class to use in understanding
#              scales of measurement and other measurement and data
#              cleaning issues.
# Created: Sunday, 05 February 2023
# R version: R version 4.2.2 (2022-10-31)
# Project(working) directory: /Users/wmm0017/Projects/Books/AdvancedMeasurementTheory
# -----------------------------------------------------------------------

# Import data from csv file:
student_survey <- read.csv(file = "data/student_survey.csv",
                           header = TRUE)


# Create categorical variables (factors) --------------------------------

# Create temporary labels for course factor.
lbls <- c("ERMA 7200 Basic Methods in Education Research",
          "ERMA 7300 Design and Analysis I",
          "ERMA 7310 Design and Analysis II",
          "ERMA 8340 Advanced Psychometrics")
student_survey$course <- factor(student_survey$course, 
                                levels = c(1,2,3,4),
                                labels = lbls)
rm(lbls) # Remove labels object

student_survey$sem <- factor(student_survey$sem,
                             levels = c(1:3),
                             labels = c("Spring", "Fall", "Summer"))

student_survey$gender <- factor(student_survey$gender)

student_survey$handedness <- factor(student_survey$hand, 
                                    levels = c(1,2),
                                    labels = c("left", "right"))

# Create Ordinal Variables ------------------------------------------------

student_survey$birth <- ordered(student_survey$birth)


lbls <- c("strongly disagree", "disagree", "neither agree/disagree", 
          "agree", "strongly agree")

cols <- 15:31
student_survey[cols] <- lapply(student_survey[cols], 
                               function(x) factor(x, 
                                                  levels = c(1,2,3,4,5),
                                                  labels = lbls, 
                                                  ordered = TRUE))
