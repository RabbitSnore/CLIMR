#######################################################################

# CLIMR -- Central Build Script (The Elder Brain)

#######################################################################

# Running this script will build the CLIMR Project. It will check if the necessary packages are installed, and if they are not, it will install them. It will then execute all necessary R scripts and build the reports of results.

# Set up environment --------------------------------------------------

## Check and install necessary packages for the project

### Packages required by the Many Legal Labs project

dependencies <- c("dplyr", "tidyr", "stringr", "metafor", "lme4", "ggplot2", "cowplot", "rmarkdown", "ggbeeswarm", "ggstance", "simr")

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

## Simulation # TO BE REPLACED WITH DATA IMPORTATION AND CLEANING

source("./R/simulate/CLIMR_simulation.R")

## Effect calculation

source("./R/calculate/CLIMR_calculate_effects.R")

## Meta-analysis

source("./R/analyze/CLIMR_main_analyses.R")

## Supplementary analyses

### Poisson regression approach

source("./R/calculate/CLIMR_poisson_regression.R")
source("./R/analyze/CLIMR_poisson_meta_analyses.R")

# Reports -------------------------------------------------------------

## Main project report

climr_report("CLIMR_main_analysis_report.Rmd")

## Supplemental reports

### Comprehension check report

climr_report("CLIMR_comprehension_check_supplement.Rmd")

### Poisson regression approach report

climr_report("CLIMR_poisson_regression_supplement.Rmd")

