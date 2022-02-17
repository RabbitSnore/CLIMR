################################################################################

# CLIMR -- Effect Size Calculation, Validation 2

################################################################################

# Set up environment -----------------------------------------------------------

## Load general functions

source("./R/functions/CLIMR_effect_size_functions.R")

# Calculate effects ------------------------------------------------------------

## Krüger et al. (2014) Study 4, close replication

effect_fruit_close <- d_calc(
  ID = 1, 
  x = fruit_close_wide$distance, 
  y = fruit_close_wide$interval_mean_z,
  cond_1 = "H", cond_2 = "L"
  )

effect_fruit_close_bif <- d_calc(
  ID = 1, 
  x = fruit_close$condition, 
  y = fruit_close$bif_total,
  cond_1 = "abstract", cond_2 = "concrete"
  )

## Krüger et al. (2014) Study 4, modified replication

effect_fruit_modified <- d_calc(
  ID = 1, 
  x = fruit_modified_wide$distance, 
  y = fruit_modified_wide$interval_mean_z,
  cond_1 = "H", cond_2 = "L"
  )

effect_fruit_modified_bif <- d_calc(
  ID = 1, 
  x = fruit_modified$condition, 
  y = fruit_modified$bif_total,
  cond_1 = "abstract", cond_2 = "concrete"
  )

## Krüger et al. (2014) Study 1, validation

effect_bridge <- d_calc(
  ID = 1, 
  x = bridges_wide$distance, 
  y = bridges_wide$interval_mean_z,
  cond_1 = "H", cond_2 = "L"
)

effect_bridge_bif <- d_calc(
  ID = 1, 
  x = bridges$condition, 
  y = bridges$bif_total,
  cond_1 = "abstract", cond_2 = "concrete"
)
