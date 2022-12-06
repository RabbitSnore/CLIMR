################################################################################

# CLIMR -- Effect Size Calculation, Validation Pretest

################################################################################

# Set up environment -----------------------------------------------------------

## Load general functions

source("./R/functions/CLIMR_effect-size-functions.R")

# Calculate each study's effect sizes ------------------------------------------

## Liberman et al. (2002, Study 1): Temporal Distance, Categorization ----------

### Primary effect size

effect_temporal <- d_calc(
  ID = 1, 
  x = data_temporal$condition, 
  y = data_temporal$y,
  cond_1 = "close", cond_2 = "distant"
)

### Robustness check

effect_temporal_cc <- d_calc(
  ID = 1, 
  x = data_temporal_cc$condition, 
  y = data_temporal_cc$y,
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

### Robustness check

effect_spatial_cc <- d_calc(
  ID = 1, 
  x = data_spatial_cc$condition, 
  y = data_spatial_cc$y,
  cond_1 = "close", cond_2 = "distant"
)

## Liberman & Trope (1998, Study 1): Temporal Distance, BIF --------------------

### Primary effect size

effect_temporal_2 <- d_calc(
  ID = 1, 
  x = data_temporal_2$condition, 
  y = data_temporal_2$y,
  cond_1 = "distant", cond_2 = "close"
)

### Robustness check

effect_temporal_2_cc <- d_calc(
  ID = 1, 
  x = data_temporal_2_cc$condition, 
  y = data_temporal_2_cc$y,
  cond_1 = "distant", cond_2 = "close"
)
