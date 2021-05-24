#######################################################################

# CLIMR -- Central Build Script (The Elder Brain)

#######################################################################

# Running this script will build the CLIMR Project. It will check if the 
# necessary packages are installed, and if they are not, it will install them. 
# It will then execute all necessary R scripts and build the reports of results.

# Build parameters ----------------------------------------------------

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

# Set up environment --------------------------------------------------

## Check and install necessary packages for the project

### Packages required by the Many Legal Labs project

dependencies <- c("dplyr", "tidyr", "stringr", "readr", "metafor", "lme4", "ggplot2", "cowplot", "rmarkdown", "ggbeeswarm", "ggstance", "simr", "viridis", "leaflet")

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
    output_format = "html_document",
    output_dir = "./reports/",
    clean = TRUE,
    envir = globalenv(),
    run_pandoc = TRUE,
    quiet = FALSE
  )
  
}

# R Scripts -----------------------------------------------------------

## Simulation

if (simulation_mode == TRUE) {
  
  source("./R/simulate/CLIMR_simulation.R")
  
}

## Data importation

if (simulation_mode == FALSE) {
  
  source("./R/import/CLIMR_data_importation")
  
}

## Effect calculation

source("./R/calculate/CLIMR_calculate_effects.R")

## Meta-analysis

source("./R/analyze/CLIMR_main_analyses.R")

## Supplementary analyses

### Manipulation check

source("./R/analyze/CLIMR_manipulation_checks.R")

### Poisson regression approach

source("./R/calculate/CLIMR_poisson_regression.R")
source("./R/analyze/CLIMR_poisson_meta_analyses.R")

### Modality moderation

source("./R/analyze/CLIMR_modality_moderation.R")

# Reports -------------------------------------------------------------

## Main project report

climr_report("CLIMR_main_analysis_report.Rmd")

## Supplemental reports

### Comprehension check report

climr_report("CLIMR_comprehension_check_supplement.Rmd")

### Manipulation check

climr_report("CLIMR_manipulation_check_supplement.Rmd")

### Poisson regression approach report

climr_report("CLIMR_poisson_regression_supplement.Rmd")

### Moderator report

climr_report("CLIMR_modality_moderation_report.Rmd")
