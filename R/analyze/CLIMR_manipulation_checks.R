#######################################################################

# CLIMR -- Meta-analysis of manipulation checks

#######################################################################

# Set up environment --------------------------------------------------

## Load functions

source("./R/functions/CLIMR_meta_analytic_functions.R")

# Meta-analysis for each experiment -----------------------------------

## Liberman et al. (2002, Study 1): Temporal Distance -----------------

### Primary meta-analysis

meta_mc_temporal <- rma(
  yi = d, 
  vi = var, 
  data = effects_temporal_mc)

## Liberman & Trope (1998, Study 1): Temporal Distance ----------------

### Primary meta-analysis

meta_mc_temporal_2 <- rma(
  yi = d, 
  vi = var, 
  data = effects_temporal_2_mc)

## Henderson et al. (2006, Study 1): Spatial Distance -----------------

### Primary meta-analysis

meta_mc_spatial <- rma(
  yi = d, 
  vi = var, 
  data = effects_spatial_mc)

## Wakslak et al. (2006, Study 1): Likelihood Distance ----------------

### Primary meta-analysis

meta_mc_likelihood <- rma(
  yi = d, 
  vi = var, 
  data = effects_likelihood_mc)

