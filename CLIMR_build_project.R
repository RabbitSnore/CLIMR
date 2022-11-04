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

simulation_mode <- TRUE

## Read and write data

# When this parameter is set to TRUE, the "export version" of the data will be
# loaded. For users reproducing the reported analyses, this parameter should be 
# set to TRUE. Only set this to FALSE if you are loading raw data or are
# simulating data.

read_precleaned <- FALSE

# This parameter controls whether the "export version" of the data should be
# produced after loading and cleaning the raw data. Generally, this parameter
# will only be useful for the main CLIMR team when creating the first build of
# the project. Only set this to TRUE if you know what you are doing.

write_data      <- FALSE

## Codebook base

# When this parameter is set to TRUE, it creates the basic structure for the
# data codebook, using the variable names and question text from the online
# survey. This parameter is intended for use by the CLIMR team. It is not likely
# a user reproducing the analyses will need to change this.

codebook_base   <- FALSE

## Validation reports

# When this parameter is set to TRUE, it knits the pretesting and validation
# reports. This is set to FALSE by default, as its primary use is by the main
# CLIMR team.

validation_reports <- TRUE

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
  
  source("./R/import/CLIMR_data_importation.R")
  
}

## Effect calculation

source("./R/calculate/CLIMR_calculate_effects.R")

## Meta-analysis

source("./R/analyze/CLIMR_main_analyses.R")

## Supplementary analyses

### Modality moderation

source("./R/analyze/CLIMR_modality_moderation.R")

### Smallest effect of interest

source("./R/analyze/CLIMR_seoi.R")

### Validations and pretests

if (validation_reports == TRUE) {
  
  source("./R/validation/CLIMR-validation_data_importation.R")
  source("./R/validation/CLIMR-validation-2_data_importation.R")
  source("./R/validation/CLIMR-validation_effect_calculations.R")
  source("./R/validation/CLIMR-validation-2_effect_calculations.R")
  source("./R/validation/CLIMR-validation_exploration.R")
  source("./R/validation/CLIMR-validation-2_exploration.R")
  source("./R/validation/CLIMR-validation_data_visualization.R")
  source("./R/validation/CLIMR-validation-studies_summary.R")
}

# Reports ----------------------------------------------------------------------

## Main project report

climr_report("CLIMR_main_analysis_report.Rmd")

## Supplemental reports

### Comprehension check report

climr_report("CLIMR_comprehension_check_supplement.Rmd")

### Moderator report

climr_report("CLIMR_modality_moderation_supplement.Rmd")

### Smallest effect of interest

climr_report("CLIMR_seoi_report.Rmd")

## Validation and pretest reports

if (validation_reports == TRUE) {
  
  climr_report("CLIMR_bif_report.Rmd")
  climr_report("CLIMR_validation_report.Rmd")
  climr_report("CLIMR_validation-2_report.Rmd")
  climr_report("CLIMR_bif-valence-pretest_report.Rmd")
  
}
