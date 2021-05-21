#######################################################################

# CLIMR -- Meta-Analytic Models for Poisson Regression Coefficients

#######################################################################

# Set up environment --------------------------------------------------

## Load functions

source("./R/functions/CLIMR_poisson_functions.R")
source("./R/functions/CLIMR_meta_analytic_functions.R")

## Load data

# NOTE
# Insert code here to load the effect size data

# Meta-analysis for each experiment -----------------------------------

## Liberman et al. (2002, Study 1): Temporal Distance -----------------

### Primary meta-analysis

meta_poisson_temporal <- rma(
  yi = b, 
  vi = var, 
  data = poisson_temporal)

### Comprehension check meta-analysis

meta_poisson_temporal_comp <- rma(
  yi = b, 
  vi = var, 
  data = poisson_temporal_comp)

## Liberman & Trope (1998, Study 1): Temporal Distance ----------------

### Primary meta-analysis

meta_poisson_temporal_2 <- rma(
  yi = b, 
  vi = var, 
  data = poisson_temporal_2)

### Comprehension check meta-analysis

meta_poisson_temporal_2_comp <- rma(
  yi = b, 
  vi = var, 
  data = poisson_temporal_2_comp)

## Henderson et al. (2006, Study 1): Spatial Distance -----------------

### Primary meta-analysis

meta_poisson_spatial <- rma(
  yi = b, 
  vi = var, 
  data = poisson_spatial)

### Comprehension check meta-analysis

meta_poisson_spatial_comp <- rma(
  yi = b, 
  vi = var, 
  data = poisson_spatial_comp)

## Wakslak et al. (2006, Study 1): Likelihood Distance ----------------

### Primary meta-analysis

meta_poisson_likelihood <- rma(
  yi = b, 
  vi = var, 
  data = poisson_likelihood)

### Comprehension check meta-analysis

meta_poisson_likelihood_comp <- rma(
  yi = b, 
  vi = var, 
  data = poisson_likelihood_comp)

## Full data ----------------------------------------------------------

### Primary meta-analysis

meta_poisson_complete <- rma.mv(
  yi = b, 
  V = var,
  mods = ~ distance - 1,
  random = ~ 1|ID,
  data = poisson_complete)

I2_poisson_complete <- I2_mv(meta_poisson_complete, poisson_complete)

### Comprehension check meta-analysis

meta_poisson_complete_comp <- rma.mv(
  yi = b, 
  V = var, 
  mods = ~ distance - 1,
  random = ~ 1|ID,
  data = poisson_complete_comp)

I2_poisson_complete_comp <- I2_mv(meta_poisson_complete_comp, poisson_complete_comp)
