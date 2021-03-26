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

### Load original effects

original <- read.csv("./data/CLT_original.csv")

## Study colors

liberman_2002_color  <- "#37392E"
liberman_1998_color  <- "#B9E28C"
henderson_2006_color <- "#A47C79"
wakslak_2006_color   <- "#19647E"

study_colors <- c(liberman_2002_color,
                  liberman_1998_color,
                  henderson_2006_color,
                  wakslak_2006_color)

# Meta-analysis and forest plot for each experiment -------------------

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
