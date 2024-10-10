################################################################################

# CLIMR -- Duplicate data handling, AU_04, AU_01, AU_03

################################################################################

# This script handles the removal of known repeat submissions by the same
# participants. The code is not written to prioritize efficiency. Rather, it
# prioritizes modularity. If parts of it need to be edited or removed, it is
# relatively easy to do so.

# Set up environment -----------------------------------------------------------

# This script assumes all packages specified in the central script have already
# been loaded.

# AU_04 ------------------------------------------------------------------------

# AU_04: Load data

# AU_04 reported that they detected that some participants submitted more than
# one response to the online survey and requested course credit more than once.
# These additional cases must be removed, though the first submissions can be
# retained as valid data.

# Extract data from AU_04

raw_dup <- raw %>% 
  filter(lab == "AU_04")

# Load credit completion data

# The general approach for removing duplicates is to identify the cases in the
# experiment data with a completion time closest to the start time in the survey
# that AU_04 used to collect participants' information for issuing course
# credit. The known valid cases from the credit survey will be retained in the
# experimental data (based on the closest time match), and all others will be
# discarded.

# These data files came from AU_04's survey for collecting participants'
# information so that course credit could be assigned. The data have been
# deidentified. The CLIMR team never had access to identifiable information.

# This data file contains information about which cases are from the same
# person.
dup_data <- read_csv("data/utility/climr_AU_04_duplicate-data_deidentified.csv")

# This data file contains more precise information about the start time 
dup_sup  <- read_csv("data/utility/climr_AU_04_duplicate-data-supplement.csv") %>% 
  slice(-1, -2) %>% 
  type_convert()

dup_data <- dup_data %>% 
  select(-StartDate) %>% # Remove less precise start dates from data set
  left_join(dup_sup, by = "ResponseId") # Combine with more precise times

dup_sel  <- dup_data %>% 
  filter(granted_credit == 1) %>% # Remove known invalid cases
  select(
    subject = name,
    start   = StartDate
  ) %>%
  group_by(subject) %>% 
  mutate(
    record = 1:n()
  ) %>% 
  filter(record < 2) %>% # Retain only first recorded case for each participant
  ungroup()

# AU_04: Remove duplicates

# Find the closest matches for end and start times

dup_rem <- dup_sel %>%
  mutate(
    case = 1:n()
  ) %>% 
  group_by(case) %>% 
  mutate(
    closest = which(abs(start - raw_dup$end_date) == min(abs(start - raw_dup$end_date)))
  ) %>% 
  ungroup()

# Retain only the closest matches

dup_ident <- raw_dup[dup_rem$closest, ]

# As a way of potentially detecting identification errors, verify that all time
# differences between end and start times are in an appropriate direction
time_differences <- dup_ident$end_date - dup_rem$start

# AU_04: Remove and replace data

# Remove AU_04 from the raw loaded data and replace it with the version from
# which duplicate submissions have been removed

raw <- raw %>% 
  filter(lab != "AU_04")

raw <- bind_rows(raw, dup_ident)

# AU_01 ------------------------------------------------------------------------

# AU_01: Load data

# AU_01 reported that they detected that some participants submitted more than
# one response to the online survey and requested course credit more than once.
# These additional cases must be removed, though the first submissions can be
# retained as valid data.

# Extract data from AU_01

raw_dup <- raw %>% 
  filter(lab == "AU_01")

# Load credit completion data

# The general approach for removing duplicates is to identify the cases in the
# experiment data with a completion time closest to the start time in the survey
# that AU_01 used to collect participants' information for issuing course
# credit. The known valid cases from the credit survey will be retained in the
# experimental data (based on the closest time match), and all others will be
# discarded.

# These data files came from AU_01's survey for collecting participants'
# information so that course credit could be assigned. The data have been
# deidentified. The CLIMR team never had access to identifiable information.

# This data file contains information about which cases are from the same
# person.
dup_data <- read_csv("data/utility/climr_AU_01_duplicate-data_deidentified.csv")

# Identify and remove cases with repeated submissions

dup_sel  <- dup_data %>% 
  group_by(pseudo_id) %>% 
  mutate(
    record = 1:n()
  ) %>% 
  filter(record < 2) %>% # Retain only first recorded case for each participant
  ungroup()

# AU_01: Remove duplicates

# The time records in the main experiment data seem to be behaving strangely,
# possibly due to timezoning. This code is hacky, but it should correct the
# issue.
raw_dup$end_date   <- as_datetime(as.character(raw_dup$end_date))

# Add one hour to the duplicate data to correct for difference in recording time
dup_sel$start_time <- as_datetime(as.character(dup_sel$start_time)) + (60 * 60)

# Remove the first three cases from the data, since these are known to be test
# cases (i.e., researchers testing the functions of the survey)
dup_sel <- dup_sel %>% 
  slice(4:nrow(dup_sel))

# Find the closest matches for end and start times

dup_rem <- dup_sel %>%
  group_by(pseudo_id) %>% 
  mutate(
    closest = which(abs(start_time - raw_dup$end_date) == min(abs(start_time - raw_dup$end_date)))
  ) %>% 
  ungroup()

# Manually remove one case that was misidentified as the same as another case.
# The case labeled with the ID 166 was closest to the same experimental data as
# another case, but 166 had a much larger time discrepancy (94 seconds vs. 1
# second). We are therefore removing it. There is no credit survey start time
# that closely matches case 166. To err on the side of safety, we are excluding
# this case.
dup_rem <- dup_rem %>% 
  filter(pseudo_id != 166)

# Retain only the closest matches

dup_ident <- raw_dup[dup_rem$closest, ]

# As a way of potentially detecting identification errors, verify that all time
# differences between end and start times are in an appropriate direction
time_differences <- dup_ident$end_date - dup_rem$start_time

# AU_01: Remove and replace data

# Remove AU_01 from the raw loaded data and replace it with the version from
# which duplicate submissions have been removed

raw <- raw %>% 
  filter(lab != "AU_01")

raw <- bind_rows(raw, dup_ident)

# AU_03 ------------------------------------------------------------------------

# AU_03: Load data

# AU_03 reported that they detected that some participants submitted more than
# one response to the online survey and requested course credit more than once.
# These additional cases must be removed, though the first submissions can be
# retained as valid data.

# Extract data from AU_03

raw_dup <- raw %>% 
  filter(lab == "AU_03")

# Load credit completion data

# The general approach for removing duplicates is to identify the cases in the
# experiment data with a completion time closest to the start time in the survey
# that AU_03 used to collect participants' information for issuing course
# credit. The known valid cases from the credit survey will be retained in the
# experimental data (based on the closest time match), and all others will be
# discarded.

# These data files came from AU_03's survey for collecting participants'
# information so that course credit could be assigned. The data have been
# deidentified. The CLIMR team never had access to identifiable information.

# This data file contains information about which cases are from the same
# person.
dup_data <- read_csv("data/utility/climr_AU_03_duplicate-data_deidentified.csv")

# Identify and remove cases with repeated submissions

dup_sel  <- dup_data %>% 
  group_by(pseudo_id) %>% 
  mutate(
    record = 1:n()
  ) %>% 
  filter(record < 2) %>% # Retain only first recorded case for each participant
  ungroup()

# AU_03: Remove duplicates

## Time adjustments

# Add eight hours to the duplicate data to correct for difference in recording
# time
dup_sel$start_time <- as_datetime(as.character(dup_sel$start_time)) + (60 * 60 * 8)

# Account for the discrepancy in when Europe and Australia implement DST
dup_sel <- dup_sel %>% 
  mutate(
    start_time = case_when(
      start_time <  "2023-10-30" | start_time >  "2023-11-06" ~ start_time, 
      start_time >= "2023-10-30" | start_time <= "2023-11-06" ~ start_time - 3600
    )
  )

# Manually remove cases known to be test cases and incorrect information entry
# by the participant
dup_sel <- dup_sel %>% 
  filter(pseudo_id != 1 & pseudo_id != 236 & pseudo_id != 108)

# Find the closest matches for end and start times

dup_rem <- dup_sel %>%
  group_by(pseudo_id) %>% 
  mutate(
    closest = which(abs(start_time - raw_dup$end_date) == min(abs(start_time - raw_dup$end_date)))
  ) %>% 
  ungroup()

# Retain only the closest matches

dup_ident <- raw_dup[dup_rem$closest, ]

# As a way of potentially detecting identification errors, verify that all time
# differences between end and start times are in an appropriate direction
time_differences <- dup_ident$end_date - dup_rem$start_time

# AU_03: Remove and replace data

# Remove AU_03 from the raw loaded data and replace it with the version from
# which duplicate submissions have been removed

raw <- raw %>% 
  filter(lab != "AU_03")

raw <- bind_rows(raw, dup_ident)

# IL_01 ------------------------------------------------------------------------

# IL_01: Load data

# IL_01 reported that they detected that some participants submitted more than
# one response to the online survey. These additional cases must be removed,
# though the first submissions can be retained as valid data.

# Extract data from IL_01

raw_dup <- raw %>% 
  filter(lab == "IL_01")

# Load credit completion data

# The general approach for removing duplicates is to identify the cases in the
# experiment data with a completion time closest to the start time in the survey
# that AU_01 used to collect participants' information for issuing course
# credit. The known valid cases from the credit survey will be retained in the
# experimental data (based on the closest time match), and all others will be
# discarded.

# These data files came from AU_01's survey for collecting participants'
# information so that course credit could be assigned. The data have been
# deidentified.

# This data file contains information about which cases are from the same
# person.
dup_data <- read_csv("data/utility/climr_IL_01_duplicate-data-supplement.csv")

# Identify and remove cases with repeated submissions

dup_sel  <- dup_data %>%
  arrange(StartDate) %>% 
  group_by(ID) %>% 
  mutate(
    record = 1:n()
  ) %>% 
  filter(record < 2) %>% # Retain only first recorded case for each participant
  ungroup()

# IL_01: Remove duplicates

# The time zones in the landing survey data and the main experimental data are
# discrepant by 8 hours
raw_dup$end_date   <- as_datetime(as.character(raw_dup$end_date))

# Add eight hours to the duplicate data to correct for difference in recording time
dup_sel$StartDate <- as_datetime(as.character(dup_sel$StartDate)) + (60 * 60 * 8)

# Find the closest matches for end and start times

dup_rem <- dup_sel %>%
  group_by(ID) %>% 
  mutate(
    closest = which(abs(StartDate - raw_dup$end_date) == min(abs(StartDate - raw_dup$end_date))),
    minimum = min(abs(StartDate - raw_dup$end_date))
  ) %>% 
  ungroup()

# Retain only the closest matches

dup_ident <- raw_dup[unique(dup_rem$closest), ]

# There was one case that was identified as closest to two submissions. Thus, we
# are confident this case should be retained, but we may be removing one case of
# otherwise valid data, to err on the side of caution.

# As a way of potentially detecting identification errors, verify that all time
# differences between end and start times are in an appropriate direction
time_differences <- dup_ident$end_date - dup_rem$StartDate

# IL_01: Remove and replace data

# Remove IL_01 from the raw loaded data and replace it with the version from
# which duplicate submissions have been removed

raw <- raw %>% 
  filter(lab != "IL_01")

raw <- bind_rows(raw, dup_ident)

# The remainder of the deviation handling script should be run at this point.
