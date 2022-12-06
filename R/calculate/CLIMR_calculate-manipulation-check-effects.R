################################################################################

# CLIMR -- Effect Size Calculation for Manipulation Checks

################################################################################

# Set up environment -----------------------------------------------------------

## Load general functions

source("./R/functions/CLIMR_effect-size-functions.R")

## Load data

# NOTE
# Insert code here to load the data after importation and wrangling

# Calculate each lab's effect sizes --------------------------------------------

## Liberman & Trope (1998, Study 1): Temporal Distance -------------------------

effects_mc_temporal <- lab_d_calc(
  data       = data_mc_temporal, 
  distance   = "temporal", 
  experiment = "Temporal (Liberman & Trope, 1998, Study 1)"
)

## Fujita et al. (2006, Study 1): Spatial Distance -----------------------------

effects_mc_spatial <- lab_d_calc(
  data       = data_mc_spatial, 
  distance   = "spatial", 
  experiment = "Spatial (Fujita et al., 2006, Study 1)"
)

## Social Distance (Paradigmatic Replication) ----------------------------------

effects_mc_social <- lab_d_calc(
  data       = data_mc_social, 
  distance   = "social", 
  experiment = "Social (paradigmatic replication)"
)

## Likelihood Distance (Paradigmatic Replication) ------------------------------

effects_mc_likelihood <- lab_d_calc(
  data       = data_mc_likelihood, 
  distance   = "likelihood", 
  experiment = "Likelihood (paradigmatic replication)"
)
