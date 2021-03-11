#######################################################################

# CLIMR -- Effect Size Calculation

#######################################################################

# Set up environment --------------------------------------------------

## Load general functions

source("./R/functions/CLIMR_effect_size_functions.R")

## Load data

# Calculate each lab's effect sizes -----------------------------------

## Liberman et al. (2002, Study 1): Temporal Distance -----------------

### Calculate effect sizes for each lab

effects_temporal <- lab_d_calc(
  data = data_temporal, 
  distance = "temporal", 
  experiment = "Liberman et al. (2002, Study 1)"
  )

## Henderson et al. (2006, Study 1): Spatial Distance -----------------

effects_spatial <- lab_d_calc(
  data = data_spatial, 
  distance = "spatial", 
  experiment = "Henderson et al. (2006, Study 1)"
  )

## Wakslak et al. (2006, Study 1): Likelihood Distance ----------------

effects_likelihood <- lab_d_calc(
  data = data_likelihood, 
  distance = "spatial", 
  experiment = "Wakslak et al. (2006, Study 1)"
  )

## Liberman & Trope (1998, Study 1): Temporal Distance ----------------

effects_temporal_2 <- lab_d_calc(
  data = data_temporal_2, 
  distance = "temporal_2", 
  experiment = "Liberman & Trope (1998, Study 1)"
  )

## Tversky & Kahneman (1981, Study 10): Active Control ----------------

effects_control <- lab_lor_calc(
  data = data_control, 
  distance = "active_control", 
  experiment = "Tversky & Kahneman (1981, Study 10)",
  cond_1 = "expensive", 
  cond_2 = "cheap"
)



