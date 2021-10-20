################################################################################

# CLIMR -- Effect Size Calculation, Validation Pretest

################################################################################

# Set up environment -----------------------------------------------------------

## Load general functions

source("./R/functions/CLIMR_effect_size_functions.R")

# Calculate each lab's effect sizes --------------------------------------------

## Liberman et al. (2002, Study 1): Temporal Distance, Categorization ----------

### Primary effect size

effect_temporal <- d_calc(
  ID = 1, 
  x = data_temporal$condition, 
  y = data_temporal$y,
  cond_1 = "close", cond_2 = "distant"
)

## Henderson et al. (2006, Study 1): Spatial Distance, Segmentation ------------

### Removal of outliers

total_cases_spatial <- nrow(data_spatial)

data_spatial <- mad_removal(data_spatial)

excluded_cases_spatial <- total_cases_spatial - nrow(data_spatial)

### Primary effect size

effect_spatial <- d_calc(
  ID = 1, 
  x = data_spatial$condition, 
  y = data_spatial$y,
  cond_1 = "close", cond_2 = "distant"
)

## Liberman & Trope (1998, Study 1): Temporal Distance, BIF --------------------

### Primary effect size

effect_temporal_2 <- d_calc(
  ID = 1, 
  x = data_temporal_2$condition, 
  y = data_temporal_2$y,
  cond_1 = "close", cond_2 = "distant"
)
