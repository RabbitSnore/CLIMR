#######################################################################

# CLIMR -- Meta-Analytic Models

#######################################################################

# Set up environment --------------------------------------------------

packages_meta <- c("metafor", "ggplot2", "ggbeeswarm", "ggstance")

lapply(packages_meta, library, character.only = TRUE)

## Load functions

source("./R/functions/CLIMR_visualization_functions.R")

## Load data

# NOTE
# Insert code here to load the effect size data

### Load original effects

original <- read.csv("./data/CLT_original.csv")

## Study colors

liberman_2002_color  <- "#37392E"
henderson_2006_color <- "#A47C79"
wakslak_2006_color   <- "#19647E"
liberman_1998_color  <- "#420039"
tversky_1981_color   <- "#96BDC6"

# Meta-analysis and forest plot for each experiment -------------------

## Liberman et al. (2002, Study 1): Temporal Distance -----------------

### Primary meta-analysis

meta_temporal <- rma(
  yi = d, 
  vi = var, 
  data = effects_temporal)

### Comprehension check meta-analysis

meta_temporal_comp <- rma(
  yi = d, 
  vi = var, 
  data = effects_temporal_comp)

### Forest plot

forest_temporal <- forest_plot(
  replication_data = effects_temporal, 
  meta_analysis    = meta_temporal,
  org_d            = original$d[original$study == "temporal"],
  org_ci_lower     = original$ci_lower[original$study == "temporal"], 
  org_ci_upper     = original$ci_upper[original$study == "temporal"], 
  title            = "Liberman et al. (2002, Study 1)", 
  study_color      = liberman_2002_color
  )

## Henderson et al. (2006, Study 1): Spatial Distance -----------------



## Wakslak et al. (2006, Study 1): Likelihood Distance ----------------



## Liberman & Trope (1998, Study 1): Temporal Distance ----------------



## Tversky & Kahneman (1981, Study 10): Active Control ----------------



## Full data ----------------------------------------------------------



# Arboretum plot ------------------------------------------------------

## Liberman et al. (2002, Study 1): Temporal Distance -----------------



## Henderson et al. (2006, Study 1): Spatial Distance -----------------



## Wakslak et al. (2006, Study 1): Likelihood Distance ----------------



## Liberman & Trope (1998, Study 1): Temporal Distance ----------------



## Tversky & Kahneman (1981, Study 10): Active Control ----------------



# Main results: Beeswarm plot -----------------------------------------
