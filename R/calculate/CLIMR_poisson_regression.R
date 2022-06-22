################################################################################

# CLIMR -- Poisson Regression Analysis

################################################################################

# Set up environment -----------------------------------------------------------

## Load general functions

source("./R/functions/CLIMR_poisson_functions.R")

## Load data

# NOTE
# Insert code here to load the data after importation and wrangling

# Calculate Poisson regressions for each lab -----------------------------------

## Liberman et al. (2002, Study 1): Temporal Distance --------------------------

### Primary effect sizes

poisson_temporal <- lab_poisson_calc(
  data = data_temporal, 
  distance = "temporal", 
  experiment = "Liberman et al. (1998, Study 1)"
)

### Comprehension check failures removed

poisson_temporal_comp <- lab_poisson_calc(
  data = filter(data_temporal, comp_check == 0), 
  distance = "temporal", 
  experiment = "Liberman et al. (1998, Study 1)"
)

## Fujita et al. (2006, Study 1): Spatial Distance -----------------------------

### Primary effect sizes

poisson_spatial <- lab_poisson_calc(
  data = data_spatial, 
  distance = "spatial", 
  experiment = "Fujita et al. (2006, Study 1)"
)

### Comprehension check failures removed

poisson_spatial_comp <- lab_poisson_calc(
  data = filter(data_spatial, comp_check == 0), 
  distance = "spatial", 
  experiment = "Fujita et al. (2006, Study 1)"
)

## Social Distance (Conceptual Replication) ------------------------------------

### Primary effect sizes

poisson_social <- lab_poisson_calc(
  data = data_social, 
  distance = "social", 
  experiment = "Social Distance (Conceptual Replication)"
)

### Comprehension check failures removed

poisson_social_comp <- lab_poisson_calc(
  data = filter(data_social, comp_check == 0), 
  distance = "social", 
  experiment = "Social Distance (Conceptual Replication)"
)

## Likelihood Distance (Conceptual Replication) --------------------------------

### Primary effect sizes

poisson_likelihood <- lab_poisson_calc(
  data = data_likelihood, 
  distance = "likelihood", 
  experiment = "Likelihood Distance (Conceptual Replication)"
)

### Comprehension check failures removed

poisson_likelihood_comp <- lab_poisson_calc(
  data = filter(data_likelihood, comp_check == 0), 
  distance = "likelihood", 
  experiment = "Likelihood Distance (Conceptual Replication)"
)

# Export effect size data ------------------------------------------------------

## Combine all data

poisson_complete <- bind_rows(
  poisson_temporal,
  poisson_spatial,
  poisson_social,
  poisson_likelihood
)

### Comprehension check failures removed

poisson_complete_comp <- bind_rows(
  poisson_temporal_comp,
  poisson_spatial_comp,
  poisson_social_comp,
  poisson_likelihood_comp
)
