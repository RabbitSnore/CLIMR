################################################################################

# CLIMR -- Meta-Analytic Models for Manipulation Checks

################################################################################

# Set up environment -----------------------------------------------------------

## Load functions

source("./R/functions/CLIMR_visualization-functions.R")
source("./R/functions/CLIMR_meta-analytic-functions.R")

# Meta-analysis and forest plot for each experiment ----------------------------

## Liberman & Trope (1998, Study 1): Temporal Distance -------------------------

### Primary meta-analysis

meta_mc_temporal <- rma(
  yi = d, 
  vi = var, 
  data = effects_mc_temporal)

## Fujita et al. (2006, Study 1): Spatial Distance -----------------------------

### Primary meta-analysis

meta_mc_spatial <- rma(
  yi = d, 
  vi = var, 
  data = effects_mc_spatial)

## Social Distance (Conceptual Replication) ------------------------------------

### Primary meta-analysis

meta_mc_social <- rma(
  yi = d, 
  vi = var, 
  data = effects_mc_social)

## Likelihood Distance (Conceptual Replication) --------------------------------

### Primary meta-analysis

meta_mc_likelihood <- rma(
  yi = d, 
  vi = var, 
  data = effects_mc_likelihood)
