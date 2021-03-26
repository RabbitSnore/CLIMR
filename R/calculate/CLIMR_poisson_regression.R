#######################################################################

# CLIMR -- Poisson Regression Analysis

#######################################################################

# Set up environment --------------------------------------------------

## Load general functions

source("./R/functions/CLIMR_poisson_functions.R")

## Load data

# NOTE
# Insert code here to load the data after importation and wrangling

# Calculate Poisson regressions for each lab --------------------------

## Liberman et al. (2002, Study 1): Temporal Distance -----------------

### Primary effect sizes

poisson_temporal <- lab_pois_mm_calc(
  data = data_temporal, 
  distance = "temporal", 
  experiment = "Liberman et al. (2002, Study 1)"
)

### Comprehension check failures removed

poisson_temporal_comp <- lab_pois_mm_calc(
  data = filter(data_temporal, comp_check == 0), 
  distance = "temporal", 
  experiment = "Liberman et al. (2002, Study 1)"
)

## Henderson et al. (2006, Study 1): Spatial Distance -----------------

### Primary effect sizes

poisson_spatial <- lab_poisson_calc(
  data = data_spatial, 
  distance = "spatial", 
  experiment = "Henderson et al. (2006, Study 1)"
)

### Comprehension check failures removed

poisson_spatial_comp <- lab_poisson_calc(
  data = filter(data_spatial, comp_check == 0), 
  distance = "spatial", 
  experiment = "Henderson et al. (2006, Study 1)"
)

## Wakslak et al. (2006, Study 1): Likelihood Distance ----------------

### Primary effect sizes

poisson_likelihood <- lab_pois_mm_calc(
  data = data_likelihood, 
  distance = "likelihood", 
  experiment = "Wakslak et al. (2006, Study 1)"
)

### Comprehension check failures removed

poisson_likelihood_comp <- lab_pois_mm_calc(
  data = filter(data_likelihood, comp_check == 0), 
  distance = "likelihood", 
  experiment = "Wakslak et al. (2006, Study 1)"
)

## Liberman & Trope (1998, Study 1): Temporal Distance ----------------

### Primary effect sizes

poisson_temporal_2 <- lab_poisson_calc(
  data = data_temporal_2, 
  distance = "temporal_2", 
  experiment = "Liberman & Trope (1998, Study 1)"
)

### Comprehension check failures removed

poisson_temporal_2_comp <- lab_poisson_calc(
  data = filter(data_temporal_2, comp_check == 0), 
  distance = "temporal_2", 
  experiment = "Liberman & Trope (1998, Study 1)"
)

# Export effect size data ---------------------------------------------

## Combine all data

poisson_complete <- bind_rows(
  poisson_temporal,
  poisson_temporal_2,
  poisson_spatial,
  poisson_likelihood
)

### Comprehension check failures removed

poisson_complete_comp <- bind_rows(
  poisson_temporal_comp,
  poisson_temporal_2_comp,
  poisson_spatial_comp,
  poisson_likelihood_comp
)
