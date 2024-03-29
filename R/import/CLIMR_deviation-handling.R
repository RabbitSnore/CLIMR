################################################################################

# CLIMR -- Deviation Handling

################################################################################

# The code below handles technical errors and cases where there were
# deviations from the procedures. This code is not optimized for efficiency.
# Rather, it is written to make it easy to add and remove components and to be
# transparent about each step in the process. As a consequence, it may run
# somewhat slowly, but none of the operations are very computationally
# demanding.

# AU_04, AU_01: Known duplicate submissions ------------------------------------

# There are notes about this case of known duplicate submissions included in
# the comments of the script that handles these cases.

source("R/import/CLIMR_duplicate-data-handling.R")

# MY_01: Test cases ------------------------------------------------------------

# Lab MY_01 included a test run case in the data, which should be removed
# prior to analysis. This case is marked with "PILOT" as it ID.

raw <- raw %>% 
  filter(id_subject != "PILOT" | is.na(id_subject))

# NL_02: Test cases ------------------------------------------------------------

# NL_02 reported testing the experiments a few times, flagging their test
# cases using the subject ID variable. These cases should be removed.

raw <- raw %>% 
  filter(!str_detect(id_subject, "test|Test") | is.na(id_subject))

# US_12: Incorrect surveys for some participants and test cases ----------------

# Notes about a technical error are included in the script that is run below

source("R/import/CLIMR_survey-error-handling.R")

# US_12 reported testing the experiments a few times, flagging their test
# cases using the subject ID variable. These cases should be removed.

raw <- raw %>% 
  filter(id_subject != "US_12_9998"  | is.na(id_subject)) %>% 
  filter(id_subject != "US_12_9999"  | is.na(id_subject)) %>% 
  filter(id_subject != "US_12_99999" | is.na(id_subject)) %>% 
  filter(id_subject != "us129999"    | is.na(id_subject))

# US_06: Test cases ------------------------------------------------------------

# US_06 reported testing the experiments a few times, and these test cases are
# evident from their lack of identifiers for the SONA system automation.

raw <- raw %>% 
  filter(id_sona != "%SURVEY_CODE%" | is.na(id_sona)) %>% 
  filter(id_internal != "97400") # This test case was identified manually

# US_19: Test cases ------------------------------------------------------------

# US_19 reported running the experiment to record their procedure video. This
# case is identified by using "CLIMR" in the ID field.

raw <- raw %>% 
  filter(id_subject != "CLIMR" | is.na(id_subject))

# US_08: Repeated participation ------------------------------------------------

# US_08 reported that two participants did the study twice, and they provided us
# with the ID numbers of the second instances of participation. These cases
# should be removed.

raw <- raw %>% 
  filter(!(id_subject == "274" & lab == "US_08") | is.na(id_subject)) %>%
  filter(!(id_subject == "339" & lab == "US_08") | is.na(id_subject))

# DE_01: Test cases ------------------------------------------------------------

# DE_01 tested the experiments a few times and identified these cases by
# entering "climr" or "climbr" in the ID field or the ethnicity field. These
# cases should be removed.

raw <- raw %>% 
  filter(id_subject != "climr"  | is.na(id_subject)) %>% 
  filter(id_subject != "climbr" | is.na(id_subject)) %>% 
  filter(ethnicity  != "climr"  | is.na(ethnicity))

# Duplicated participant IDs ---------------------------------------------------

# Some labs reported accidentally reusing some participant ID values These
# values are not used in any analysis, so these non-unique cases are retained.
# They don't seem to pose any practical issue, since the Qualtrics response ID
# still identifies each unique response.

# Removal of known invalid or incomplete cases ---------------------------------

# There are some cases that should be removed because of their missing or
# invalid demographic information. In these rows of data, there are no
# responses to the experimental questions, since the session was terminated
# prior to responding to any items or because the would-be participant entered
# invalid information (e.g., being under 18) and was thus prevented from
# proceeding. These cases should be removed.

raw <- raw %>% 
  filter(age >= 18 & !is.na(age))
