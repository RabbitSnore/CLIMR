################################################################################

# CLIMR -- Deviation Handling

################################################################################

# The code below handles technical errors and cases where there were
# deviations from the procedures. This code is not optimized for efficiency.
# Rather, it is written to make it easy to add and remove components and to be
# transparent about each step in the process. As a consequence, it may run
# somewhat slowly, but none of the operations are very computationally
# demanding.

### AU_04, AU_01: Known duplicate submissions

# There are notes about this case of known duplicate submissions included in
# the comments of the script that handles these cases.

source("R/import/CLIMR_duplicate-data-handling.R")

### MY_01: Test cases

# Lab MY_01 included a test run case in the data, which should be removed
# prior to analysis. This case is marked with "PILOT" as it ID.

raw <- raw %>% 
  filter(id_subject != "PILOT" | is.na(id_subject))

### NL_02: Test cases

# NL_02 reported testing the experiments a few times, flagging their test
# cases using the subject ID variable. These cases should be removed.

raw <- raw %>% 
  filter(!str_detect(id_subject, "test|Test") | is.na(id_subject))

### US_12: Incorrect surveys for some participants and test cases

# Notes about a technical error are included in the script that is run below

source("R/import/CLIMR_survey-error-handling.R")

# US_12 reported testing the experiments a few times, flagging their test
# cases using the subject ID variable. These cases should be removed.

raw <- raw %>% 
  filter(id_subject != "US_12_9998"  | is.na(id_subject)) %>% 
  filter(id_subject != "US_12_9999"  | is.na(id_subject)) %>% 
  filter(id_subject != "US_12_99999" | is.na(id_subject)) %>% 
  filter(id_subject != "us129999"    | is.na(id_subject))

### Duplicated participant IDs

# Some labs reported accidentally reusing some participant ID values These
# values are not used in any analysis, so these non-unique cases are retained.
# They don't seem to pose any practical issue, since the Qualtrics response ID
# still identifies each unique response.

### Removal of known invalid or incomplete cases 

# There are some cases that should be removed because of their missing or
# invalid demographic information. In these rows of data, there are no
# responses to the experimental questions, since the session was terminated
# prior to responding to any items or because the would-be participant entered
# invalid information (e.g., being under 18) and was thus prevented from
# proceeding. These cases should be removed.

raw <- raw %>% 
  filter(age >= 18 & !is.na(age))
