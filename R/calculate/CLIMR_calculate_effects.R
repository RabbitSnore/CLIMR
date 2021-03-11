#######################################################################

# CLIMR -- Effect Size Calculation

#######################################################################

# Set up environment --------------------------------------------------

packages_simulation <- c("dplyr")

lapply(packages_simulation, library, character.only = TRUE)

## Load general functions

source("./R/functions/CLIMR_effect_size_functions.R")

## Load data

# Calculate each lab's effect sizes -----------------------------------

## Liberman et al. (2002, Study 1): Temporal Distance -----------------

## Henderson et al. (2006, Study 1): Spatial Distance -----------------

## Wakslak et al. (2006, Study 1): Likelihood Distance ----------------

## Liberman & Trope (1998, Study 1): Temporal Distance ----------------

## Tversky & Kahneman (1981, Study 10): Active Control ----------------