################################################################################

# CLIMR -- Data Importation and Cleaning, Action Relevance Pretest

################################################################################

# Set up environment -----------------------------------------------------------

## Check and install necessary packages for the project

### Packages required by the CLIMR project

dependencies <- c("dplyr", "tidyr", "stringr", "readr", "metafor", "lme4", "ggplot2", "cowplot", "rmarkdown", "ggbeeswarm", "ggstance", "simr", "viridis", "leaflet", "osfr")

### Check whether packages are installed locally and get list of what needs to be installed

installation_list <- dependencies[!(dependencies %in% rownames(installed.packages()))]

### Install necessary packages

if (length(installation_list) > 0) {
  
  install.packages(installation_list, dependencies = TRUE)
  
}

## Load packages

lapply(dependencies, library, character.only = TRUE)

# Import data ------------------------------------------------------------------

## Create necessary directories and download data from OSF

# The data stored on OSF have been cleaned to rename variables and to remove
# unnecessary metadata from Qualtrics, as well as Prolific IDs.
# No participants have been removed from this data set.

if (!dir.exists("./data/validation/")) {
  
  dir.create("./data/validation/")
  
}

if (!file.exists("./data/validation/CLIMR_action-relevance-pretest.csv")) {
  
  osf_retrieve_file("https://osf.io/umztp/") %>% 
    osf_download(path = "./data/validation/",
                 conflicts = "overwrite")
  
}

raw <- read.csv("./data/validation/CLIMR_action-relevance-pretest.csv")

# Basic cleaning ---------------------------------------------------------------

## Rename variables
#
# This code was used with the raw data downloaded from Qualtrics, but it is not
# needed with the version of the data stored on OSF.
# 
# raw <- raw %>%
#   select(
#     id = ResponseId,
#     duration = Duration..in.seconds.,
#     finished = Finished,
#     starts_with("relevance")
#   )

## Wrangling

act_rel <- raw %>% 
  filter(finished == 1)

act_rel <- act_rel %>% 
  mutate(
    across(
      starts_with("relevance"),
      ~ .x - 3
    )
  )

