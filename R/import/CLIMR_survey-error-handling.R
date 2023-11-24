################################################################################

# CLIMR -- Incorrect Survery Version Handling, US_12

################################################################################

# This script addresses a technical issue wherein one lab's (US_12) first 24
# participants were redirected to the incorrect experiment surveys. Because
# these surveys still included placeholder information, some of the data cannot
# be used. The data from the spatial distance experiment (i.e., Fujita et al)
# cannot be used at all because of the placeholder text. For the temporal,
# social, and likelihood experiments, data up to and including the comprehension
# check can be used, but items recorded after that point deviate from the
# procedure such that they should not be used. This script removes the unusable
# portion of the data but retains the usable portion. These issues only apply to
# the lab's first 24 participants. The remainder of their participants completed
# the experiments as intended.

# Set up environment -----------------------------------------------------------

# This script assumes all packages specified in the central script have already
# been loaded.

# US_12 ------------------------------------------------------------------------

# US_12: Extract data

# The portion of the data affected by this error have been loaded under the
# pseudonym US_XX

raw_part <- raw %>% 
  filter(lab == "US_XX")

# US_12: Drop unusable columns

raw_part <- raw_part %>% 
  select(
    -starts_with("panas"),
    -starts_with("ahs"),
    -starts_with("t_mancheck"),
    -starts_with("sp_mancheck"),
    -starts_with("so_mancheck"),
    -starts_with("l_mancheck")
  )

# US_12: Correct lab and modality

raw_part$lab          <- "US_12"
raw_part$lab_modality <- "US_12_lab"

# US_12: Remove and replace data

# Remove US_XX from the raw loaded data and replace it with the version from
# which duplicate submissions have been removed

raw <- raw %>% 
  filter(lab != "US_XX")

raw <- bind_rows(raw, raw_part)
