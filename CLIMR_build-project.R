################################################################################

# CLIMR -- Central Build Script (The Elder Brain)

################################################################################

# Running this script will build the CLIMR Project. It will check if the 
# necessary packages are installed, and if they are not, it will install them. 
# It will then execute all necessary R scripts and build the reports of results.

# Build parameters -------------------------------------------------------------

## Simulation mode

# When this parameter is set to TRUE, data for the project are simulated, rather
# than loaded from files. This should be set to TRUE for diagnostic purposes and
# for review.

simulation_mode    <- TRUE

## Read and write data

# When this parameter is set to TRUE, the "export version" of the data will be
# loaded. For users reproducing the reported analyses, this parameter should be 
# set to TRUE. Only set this to FALSE if you are loading raw data or are
# simulating data.

read_precleaned    <- FALSE

# This parameter controls whether the "export version" of the data should be
# produced after loading and cleaning the raw data. Generally, this parameter
# will only be useful for the main CLIMR team when creating the first build of
# the project. Only set this to TRUE if you know what you are doing.

write_data         <- FALSE

## Codebook base

# When this parameter is set to TRUE, it creates the basic structure for the
# data codebook, using the variable names and question text from the online
# survey. This parameter is intended for use by the CLIMR team. It is not likely
# a user reproducing the analyses will need to change this.

codebook_base      <- FALSE

## Validation reports

# When this parameter is set to TRUE, it knits the pretesting and validation
# reports. This is set to FALSE by default, as its primary use is by the main
# CLIMR team.

validation_reports <- FALSE

## Force package updates

# Set this parameter to TRUE if you want to force installation of all required
# packages. This can be useful if you are encountering errors that may be caused
# by outdated packages.

force_update       <- FALSE

## Create effect map

# Set this parameter should be set to TRUE if you want to generate the leaflet
# map of effect sizes, plotted on a map displaying each of the contributing
# labs.

create_map         <- FALSE

# Set up environment -----------------------------------------------------------

## Check and install necessary packages for the project

### Packages required by the CLIMR project

dependencies <- c(
  "dplyr", 
  "tidyr", 
  "stringr", 
  "readr", 
  "metafor", 
  "lme4", 
  "ggplot2", 
  "cowplot", 
  "rmarkdown", 
  "ggbeeswarm", 
  "ggstance", 
  "simr", 
  "viridis", 
  "leaflet",
  "mapview",
  "osfr",
  "purrr")

### Check whether packages are installed locally and get list of what needs to be installed

installation_list <- dependencies[!(dependencies %in% rownames(installed.packages()))]

### Install necessary packages

if (length(installation_list) > 0 & force_update == FALSE) {
  
  install.packages(installation_list, dependencies = TRUE)
  
}

if (force_update == TRUE) {
  
  install.packages(dependencies, dependencies = TRUE)
  
}

## Load packages

lapply(dependencies, library, character.only = TRUE)

## Get version info

version_info <- as.data.frame(installed.packages())[rownames(installed.packages()) %in% loadedNamespaces(), ] %>% 
  select(-LibPath)

write.csv(version_info, "./data/meta/climr_version-info.csv", row.names = FALSE)

version_primary <- version_info %>% 
  filter(Package %in% dependencies) %>%
  select(Version)

## Functions

### Render report

# This function is used to knit the R Markdown reports using the global environment.

climr_report <- function(input) {
  
  require(rmarkdown)
  
  render(
    input = input,
    output_format = github_document(html_preview = FALSE),
    output_dir = "./reports/",
    clean = TRUE,
    envir = globalenv(),
    run_pandoc = TRUE,
    quiet = FALSE
  )
  
}

# R Scripts --------------------------------------------------------------------

## Simulation

if (simulation_mode == TRUE) {
  
  source("./R/simulate/CLIMR_simulation.R")
  
}

## Data importation

if (simulation_mode == FALSE) {
  
  source("./R/import/CLIMR_data-importation.R")
  
}

## Effect calculation

source("./R/calculate/CLIMR_calculate-effects.R")

## Meta-analysis

source("./R/analyze/CLIMR_main-analyses.R")

## Supplementary analyses

### Modality moderation

source("./R/analyze/CLIMR_modality-moderation.R")

### Power analysis

source("./R/analyze/CLIMR_power-analyses.R")

### Smallest effect of interest

if (seoi_analysis == TRUE) {
  
  source("./R/analyze/CLIMR_seoi.R")
  
}

### Manipulation checks

source("./R/calculate/CLIMR_calculate-manipulation-check-effects.R")
source("./R/analyze/CLIMR_manipulation-checks.R")

### Validations and pretests

if (validation_reports == TRUE) {
  
  # Validation of construal level measures
  
  source("./R/validation/CLIMR-validation_data-importation.R")
  source("./R/validation/CLIMR-validation-2_data-importation.R")
  
  source("./R/validation/CLIMR-validation_effect-calculations.R")
  source("./R/validation/CLIMR-validation-2_effect-calculations.R")
  
  source("./R/validation/CLIMR-validation_exploration.R")
  source("./R/validation/CLIMR-validation-2_exploration.R")
  source("./R/validation/CLIMR-validation_data-visualization.R")
  
  source("./R/validation/CLIMR-validation-studies_summary.R")
  
  # BIF item relevance to event in the likelihood replication
  
  source("./R/validation/CLIMR-action-relevance-pretest_data-importation.R")
  source("./R/validation/CLIMR-action-relevance-pretest_analysis.R")
  
  # BIF item response option valence differences
  
  source("./R/validation/CLIMR-bif-valence-separate-pretest_import-analyze.R")
  source("./R/validation/CLIMR-bif-valence-relative-pretest_import-analyze.R")
  source("./R/validation/CLIMR-bif-valence-exploration.R")
  
  # Social distance manipulation pretest
  
  source("./R/validation/CLIMR-social-distance-pretest.R")
  
} else if (validation_reports == FALSE) {
  
  # The BIF response option valence difference data are needed for the
  # robustness checks, but the rest of the validation analyses are not needed
  # for the main results
  source("./R/validation/CLIMR-bif-valence-relative-pretest_import-analyze.R")
  
}

### BIF item response option valence difference robustness check

# Note that these analyses are computationally intensive. They can take several
# minutes to calculate.
source("./R/analyze/CLIMR_valence-analyses.R")

## Leaflet map of effects

if (create_map == TRUE) {
  
  source("./R/analyze/CLIMR_effect-map.R")
  
}

# Reports ----------------------------------------------------------------------

## Main project report

climr_report("CLIMR_main-analysis_report.Rmd")

## Supplemental reports

### Comprehension check report

climr_report("CLIMR_comprehension-check_report.Rmd")

### Moderator report

climr_report("CLIMR_modality-moderation_report.Rmd")

### Power analyses

climr_report("CLIMR_power_report.Rmd")

### Smallest effect of interest

if (seoi_analysis == TRUE){
  
  climr_report("CLIMR_seoi_report.Rmd")
  
}

### Manipulation checks

climr_report("CLIMR_manipulation-check_report.Rmd")

### BIF item response option valence difference robustness check

climr_report("CLIMR_valence-robustness-check_report.Rmd")

## Validation and pretest reports

if (validation_reports == TRUE) {
  
  climr_report("CLIMR_bif_report.Rmd")
  climr_report("CLIMR_validation_report.Rmd")
  climr_report("CLIMR_validation-2_report.Rmd")
  climr_report("CLIMR_action-relevance-pretest_report.Rmd")
  climr_report("CLIMR_bif-valence-pretest_report.Rmd")
  climr_report("CLIMR_social-distance-pretest_report.Rmd")
  
}
