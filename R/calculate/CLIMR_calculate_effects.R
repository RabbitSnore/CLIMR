################################################################################

# CLIMR -- Effect Size Calculation

################################################################################

# Set up environment -----------------------------------------------------------

## Load general functions

source("./R/functions/CLIMR_effect_size_functions.R")

## Load data

# NOTE
# Insert code here to load the data after importation and wrangling

# Calculate each lab's effect sizes --------------------------------------------

## Liberman & Trope (1998, Study 1): Temporal Distance -------------------------

### Primary effect sizes

effects_temporal <- lab_d_calc(
  data       = data_temporal, 
  distance   = "temporal", 
  experiment = "Temporal (Liberman & Trope, 1998, Study 1)"
)

### Comprehension check failures removed

effects_temporal_comp <- lab_d_calc(
  data       = filter(data_temporal, comp_check == 0), 
  distance   = "temporal", 
  experiment = "Temporal (Liberman & Trope, 1998, Study 1)"
)

## Fujita et al. (2006, Study 1): Spatial Distance -----------------------------

### Primary effect sizes

effects_spatial <- lab_d_calc(
  data       = data_spatial, 
  distance   = "spatial", 
  experiment = "Spatial (Fujita et al., 2006, Study 1)"
)

### Comprehension check failures removed

effects_spatial_comp <- lab_d_calc(
  data       = filter(data_spatial, comp_check == 0), 
  distance   = "spatial", 
  experiment = "Spatial (Fujita et al., 2006, Study 1)"
)

## Social Distance (Paradigmatic Replication) ----------------------------------

### Primary effect sizes

effects_social <- lab_d_calc(
  data       = data_social, 
  distance   = "social", 
  experiment = "Social (paradigmatic replication)"
)

### Comprehension check failures removed

effects_social_comp <- lab_d_calc(
  data       = filter(data_social, comp_check == 0), 
  distance   = "social", 
  experiment = "Social (paradigmatic replication)"
)

## Likelihood Distance (Paradigmatic Replication) ------------------------------

### Primary effect sizes

effects_likelihood <- lab_d_calc(
  data       = data_likelihood, 
  distance   = "likelihood", 
  experiment = "Likelihood (paradigmatic replication)"
)

### Comprehension check failures removed

effects_likelihood_comp <- lab_d_calc(
  data       = filter(data_likelihood, comp_check == 0), 
  distance   = "likelihood", 
  experiment = "Likelihood (paradigmatic replication)"
)

# Export effect size data ------------------------------------------------------

## Combine all data

effects_complete <- bind_rows(
  effects_temporal,
  effects_spatial,
  effects_social,
  effects_likelihood
)

### Comprehension check failures removed

effects_complete_comp <- bind_rows(
  effects_temporal_comp,
  effects_spatial_comp,
  effects_social_comp,
  effects_likelihood_comp
)

if (simulation_mode == TRUE) {
  
  # Remove dummy modality column
  
  effects_temporal        <- effects_temporal %>% 
    select(-modality)
  
  effects_spatial         <- effects_spatial %>% 
    select(-modality)

  effects_social          <- effects_social %>% 
    select(-modality)
    
  effects_likelihood      <- effects_likelihood %>% 
    select(-modality)
  
  effects_temporal_comp   <- effects_temporal_comp %>% 
    select(-modality)
  
  effects_spatial_comp    <- effects_spatial_comp %>% 
    select(-modality)
  
  effects_social_comp     <- effects_social_comp %>% 
    select(-modality)
  
  effects_likelihood_comp <- effects_likelihood_comp %>% 
    select(-modality)
  
  ## Join with modality data
  
  ### Full data
  
  effects_temporal   <- effects_temporal %>% 
    left_join(modality_data, by = "ID")
  
  effects_spatial    <- effects_spatial %>% 
    left_join(modality_data, by = "ID")
  
  effects_social     <- effects_social %>% 
    left_join(modality_data, by = "ID")
  
  effects_likelihood <- effects_likelihood %>% 
    left_join(modality_data, by = "ID")
  
  ### Comprehension check failures removed
  
  effects_temporal_comp   <- effects_temporal_comp %>% 
    left_join(modality_data, by = "ID")
  
  effects_spatial_comp    <- effects_spatial_comp %>% 
    left_join(modality_data, by = "ID")
  
  effects_social_comp     <- effects_social_comp %>% 
    left_join(modality_data, by = "ID")
  
  effects_likelihood_comp <- effects_likelihood_comp %>% 
    left_join(modality_data, by = "ID")
  
}
