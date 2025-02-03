################################################################################

# CLIMR -- Central Build Script (The Elder Brain)

################################################################################

# Running this script will build the CLIMR Project. It will check if the 
# necessary packages are installed, and if they are not, it will install them. 
# It will then execute all necessary R scripts and build the reports of results.

# Build parameters -------------------------------------------------------------

# Simulation mode

# When this parameter is set to TRUE, data for the project are simulated, rather
# than loaded from files. This should be set to TRUE for diagnostic purposes and
# for review.

simulation_mode    <- FALSE

# Read and write data

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

# Codebook base

# When this parameter is set to TRUE, it creates the basic structure for the
# data codebook, using the variable names and question text from the online
# survey. This parameter is intended for use by the CLIMR team. It is not likely
# a user reproducing the analyses will need to change this.

codebook_base      <- FALSE

# Validation reports

# When this parameter is set to TRUE, it knits the pretesting and validation
# reports. This is set to FALSE by default, as its primary use is by the main
# CLIMR team.

validation_reports <- FALSE

# Create effect map

# This parameter should be set to TRUE if you want to generate the leaflet map
# of effect sizes, plotted on a map displaying each of the contributing labs.

create_map         <- FALSE

# Generate progress tracker

# This parameter should be set to TRUE if you want to generate the progress
# tracker figure.

progress_tracker   <- TRUE

# Install/restore packages

# This parameter should be set to TRUE if you want to restore the packages for
# the project using the renv package.

restore_renv       <- TRUE

# Set up environment -----------------------------------------------------------

# Install dependencies

if (restore_renv == TRUE) {
  
  if (!("renv" %in% rownames(installed.packages()))) {
    
    install.packages("renv", dependencies = TRUE)
    
  }
  
  renv::restore()
  
}

# Load packages

## Packages required by the CLIMR project

# The CLIMR project uses the renv package to track the version information of
# relevant packages.

dependencies <- c(
  "dplyr", 
  "tidyr", 
  "stringr", 
  "readr", 
  "lubridate",
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

lapply(dependencies, library, character.only = TRUE)

# Functions

## Render report

# This function is used to knit the RMarkdown reports using the global
# environment.

climr_report <- function(input) {
  
  require(rmarkdown)
  
  render(
    input         = input,
    output_format = github_document(html_preview = FALSE),
    output_dir    = "./reports/",
    clean         = TRUE,
    envir         = globalenv(),
    run_pandoc    = TRUE,
    quiet         = FALSE
  )
  
}

## Manuscript functions

# This function is used to render the main results for the manuscript.

source("R/functions/CLIMR_report-functions.R")

climr_manuscript <- function(input) {
  
  require(rmarkdown)
  
  render(
    input = input,
    output_format = "word_document",
    output_dir    = "./reports/",
    clean         = TRUE,
    envir         = globalenv(),
    run_pandoc    = TRUE,
    quiet         = FALSE
  )
  
}

# R Scripts --------------------------------------------------------------------

# Simulation

if (simulation_mode == TRUE) {
  
  source("./R/simulate/CLIMR_simulation.R")
  
}

# Loading, cleaning, and wrangling

if (simulation_mode == FALSE) {

  ## Data importation  

  source("./R/import/CLIMR_data-importation.R")
  
  ## Data wrangling

  source("./R/import/CLIMR_data-wrangling.R")
  
}

# Progress tracker

if (progress_tracker == TRUE) {
  
  source("./R/analyze/CLIMR_project-tracking.R")
  
}

# Effect calculation

source("./R/calculate/CLIMR_calculate-effects.R")

# Meta-analysis

source("./R/analyze/CLIMR_main-analyses.R")

# Supplementary analyses

## Modality moderation

source("./R/analyze/CLIMR_modality-moderation.R")

## Power analysis

source("./R/analyze/CLIMR_power-analyses.R")

## Manipulation checks

source("./R/calculate/CLIMR_calculate-manipulation-check-effects.R")
source("./R/analyze/CLIMR_manipulation-checks.R")

## Online location checks (spatial experiment)

source("./R/analyze/CLIMR_spatial-robustness.R")

## Validations and pretests

if (validation_reports == TRUE) {
  
  # Validation of construal level measures
  
  source("./R/validation/CLIMR-validation_data-importation.R")
  source("./R/validation/CLIMR-validation-2_data-importation.R")
  
  source("./R/validation/CLIMR-validation_effect-calculations.R")
  source("./R/validation/CLIMR-validation-2_effect-calculations.R")
  
  source("./R/validation/CLIMR-validation_exploration.R")
  source("./R/validation/CLIMR-validation-2_exploration.R")
  source("./R/validation/CLIMR-validation_data-visualization.R")
  
  # BIF item relevance to event in the likelihood replication
  
  source("./R/validation/CLIMR-action-relevance-pretest_data-importation.R")
  source("./R/validation/CLIMR-action-relevance-pretest_analysis.R")
  
  # BIF item response option valence differences
  
  source("./R/validation/CLIMR-bif-valence-separate-pretest_import-analyze.R")
  source("./R/validation/CLIMR-bif-valence-relative-pretest_import-analyze.R")
  source("./R/validation/CLIMR-bif-valence-exploration.R")
  
  # Social distance manipulation pretest
  
  source("./R/validation/CLIMR-social-distance-pretest.R")
  
  # Linguistic measures of concreteness
  
  source("./R/validation/CLIMR-validation_linguistic_analysis.R")
  
  # Summary of validation studies
  
  source("./R/validation/CLIMR-validation-studies_summary.R")
  
} else if (validation_reports == FALSE) {
  
  # The BIF response option valence difference data are needed for the
  # robustness checks, but the rest of the validation analyses are not needed
  # for the main results
  source("./R/validation/CLIMR-bif-valence-relative-pretest_import-analyze.R")
  
}

## BIF item response option valence difference robustness check

# Note that these analyses are computationally intensive. They can take several
# minutes to calculate.
source("./R/analyze/CLIMR_valence-analyses.R")

# Additional exploratory analyses

source("./R/calculate/CLIMR_calculate-descriptives.R")

source("./R/explore/CLIMR_exploratory-data-wrangling.R")

source("./R/explore/CLIMR_exploratory-country-language.R")
source("./R/explore/CLIMR_exploratory-manipulation-checks.R")
# Note that these analyses are computationally intensive. They can take several
# minutes to calculate.
source("./R/explore/CLIMR_exploratory-valence-additional.R")
source("./R/explore/CLIMR_exploratory-reliability.R")
source("./R/explore/CLIMR_exploratory-bif-items.R")
source("./R/explore/CLIMR_exploratory-influence.R")
source("./R/explore/CLIMR_exploratory-past-data.R")
source("./R/explore/CLIMR_exploratory-ahs-panas.R")
source("./R/explore/CLIMR_exploratory-actual-distance.R")
source("./R/explore/CLIMR_exploratory-time.R")
source("./R/explore/CLIMR_exploratory-duration.R")

# Leaflet map of effects

if (create_map == TRUE) {
  
  source("./R/analyze/CLIMR_effect-map.R")
  
}

# Reports ----------------------------------------------------------------------

# Main project report

climr_report("CLIMR_main-analysis_report.Rmd")

# Supplemental reports

## Comprehension check report

climr_report("CLIMR_comprehension-check_report.Rmd")

## Moderator report

climr_report("CLIMR_modality-moderation_report.Rmd")

## Power analyses

climr_report("CLIMR_power_report.Rmd")

## Manipulation checks

climr_report("CLIMR_manipulation-check_report.Rmd")

## Online location checks (spatial experiment)

climr_report("CLIMR_spatial-robustness_report.Rmd")

## BIF item response option valence difference robustness check

climr_report("CLIMR_valence-robustness-check_report.Rmd")

# Exploratory analysis reports

climr_report("CLIMR_exploration-country-language_report.Rmd")
climr_report("CLIMR_exploration-manipulation-checks_report.Rmd")
climr_report("CLIMR_exploration-valence-additional_report.Rmd")
climr_report("CLIMR_exploration-reliability_report.Rmd")
climr_report("CLIMR_exploration-bif-items_report.Rmd")
climr_report("CLIMR_exploration-influence_report.Rmd")
climr_report("CLIMR_exploration-past-data_report.Rmd")
climr_report("CLIMR_exploration-ahs_report.Rmd")
climr_report("CLIMR_exploration-panas_report.Rmd")
climr_report("CLIMR_exploration-actual-distance_report.Rmd")
climr_report("CLIMR_exploration-actual-time_report.Rmd")
climr_report("CLIMR_exploration-duration_report.Rmd")

# Validation and pretest reports

if (validation_reports == TRUE) {
  
  climr_report("CLIMR_bif_report.Rmd")
  climr_report("CLIMR_validation_report.Rmd")
  climr_report("CLIMR_validation-2_report.Rmd")
  climr_report("CLIMR_validation-3_report.Rmd")
  climr_report("CLIMR_action-relevance-pretest_report.Rmd")
  climr_report("CLIMR_bif-valence-pretest_report.Rmd")
  climr_report("CLIMR_social-distance-pretest_report.Rmd")
  
}

# Manuscript results

## Primary results

climr_manuscript("CLIMR_primary-results.qmd")
