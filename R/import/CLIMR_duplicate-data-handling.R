################################################################################

# CLIMR -- Duplicate data handling

################################################################################

# Set up environment -----------------------------------------------------------

# This script assumes all packages specified in the central script have already
# been loaded.

library(lubridate)

# Load data --------------------------------------------------------------------

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
# deidentified. The main CLIMR team never had access to identifiable
# information.

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

# Remove duplicates ------------------------------------------------------------

# Find the closest matches for end and start times

dup_rem <- dup_sel %>%
  mutate(
    case = 1:n()
  ) %>% 
  group_by(case) %>% 
  mutate(
    closest = which(abs(start - raw$end_date) == min(abs(start - raw$end_date)))
  ) %>% 
  ungroup()

# Retain only the closest matches

dup_ident <- raw[dup_rem$closest, ]

# As a way of potentially detecting identification errors, verify that all time
# differences between end and start times are in an appropriate direction
time_differences <- dup_ident$end_date - dup_rem$start

# Remove and replace data ------------------------------------------------------

# Remove AU_04 from the raw loaded data and replace it with the version from
# which duplicate submissions have been removed

raw <- raw %>% 
  filter(lab != "AU_04")

raw <- bind_rows(raw, dup_ident)

# After this point, the rest of the importation script should run.
