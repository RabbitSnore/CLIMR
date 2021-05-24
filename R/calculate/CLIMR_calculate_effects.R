#######################################################################

# CLIMR -- Effect Size Calculation

#######################################################################

# Set up environment --------------------------------------------------

## Load general functions

source("./R/functions/CLIMR_effect_size_functions.R")

## Load data

# NOTE
# Insert code here to load the data after importation and wrangling

# Calculate each lab's effect sizes -----------------------------------

## Liberman et al. (2002, Study 1): Temporal Distance -----------------

### Primary effect sizes

effects_temporal <- lab_d_calc(
  data = data_temporal, 
  distance = "temporal", 
  experiment = "Liberman et al. (2002, Study 1)"
  )

### Comprehension check failures removed

effects_temporal_comp <- lab_d_calc(
  data = filter(data_temporal, comp_check == 0), 
  distance = "temporal", 
  experiment = "Liberman et al. (2002, Study 1)"
)

### Manipulation checks

effects_temporal_mc <- lab_mc_calc(
  data = temporal_mc, 
  distance = "temporal", 
  experiment = "Liberman et al. (2002, Study 1)"
)

## Henderson et al. (2006, Study 1): Spatial Distance -----------------

### Removal of outliers

total_cases_spatial <- nrow(data_spatial)

data_spatial <- mad_removal(data_spatial)

excluded_cases_spatial <- total_cases_spatial - nrow(data_spatial)

### Primary effect sizes

effects_spatial <- lab_d_calc(
  data = data_spatial, 
  distance = "spatial", 
  experiment = "Henderson et al. (2006, Study 1)"
  )

### Comprehension check failures removed

effects_spatial_comp <- lab_d_calc(
  data = filter(data_spatial, comp_check == 0), 
  distance = "spatial", 
  experiment = "Henderson et al. (2006, Study 1)"
)

### Manipulation checks

effects_spatial_mc <- lab_mc_calc(
  data = spatial_mc, 
  distance = "spatial", 
  experiment = "Henderson et al. (2006, Study 1)"
)

## Wakslak et al. (2006, Study 1): Likelihood Distance ----------------

### Primary effect sizes

effects_likelihood <- lab_d_calc(
  data = data_likelihood, 
  distance = "likelihood", 
  experiment = "Wakslak et al. (2006, Study 1)"
  )

### Comprehension check failures removed

effects_likelihood_comp <- lab_d_calc(
  data = filter(data_likelihood, comp_check == 0), 
  distance = "likelihood", 
  experiment = "Wakslak et al. (2006, Study 1)"
)

### Manipulation checks

effects_likelihood_mc <- lab_mc_calc(
  data = likelihood_mc, 
  distance = "likelihood", 
  experiment = "Wakslak et al. (2006, Study 1)"
)

## Liberman & Trope (1998, Study 1): Temporal Distance ----------------

### Primary effect sizes

effects_temporal_2 <- lab_d_calc(
  data = data_temporal_2, 
  distance = "temporal_2", 
  experiment = "Liberman & Trope (1998, Study 1)"
  )

### Comprehension check failures removed

effects_temporal_2_comp <- lab_d_calc(
  data = filter(data_temporal_2, comp_check == 0), 
  distance = "temporal_2", 
  experiment = "Liberman & Trope (1998, Study 1)"
)

### Manipulation checks

effects_temporal_2_mc <- lab_mc_calc(
  data = temporal_2_mc, 
  distance = "temporal_2", 
  experiment = "Liberman & Trope (1998, Study 1)"
)

## Tversky & Kahneman (1981, Study 10): Active Control ----------------

### Primary effect sizes

effects_control <- lab_lor_calc(
  data = data_control, 
  distance = "active_control", 
  experiment = "Tversky & Kahneman (1981, Study 10)",
  cond_1 = "expensive", 
  cond_2 = "cheap"
)

### Comprehension check failures removed

effects_control_comp <- lab_lor_calc(
  data = filter(data_control, comp_check == 0), 
  distance = "active_control", 
  experiment = "Tversky & Kahneman (1981, Study 10)",
  cond_1 = "expensive", 
  cond_2 = "cheap"
)

# Export effect size data ---------------------------------------------

## Combine all data

effects_complete <- bind_rows(
  effects_temporal,
  effects_spatial,
  effects_likelihood,
  effects_temporal_2
)

### Comprehension check failures removed

effects_complete_comp <- bind_rows(
  effects_temporal_comp,
  effects_spatial_comp,
  effects_likelihood_comp,
  effects_temporal_2_comp
)

if (simulation_mode == TRUE) {
  
  ## Join with modality data
  
  ### Full data
  
  effects_temporal <- effects_temporal %>% 
    left_join(modality_data, by = "ID")
  
  effects_temporal_2 <- effects_temporal_2 %>% 
    left_join(modality_data, by = "ID")
  
  effects_spatial <- effects_spatial %>% 
    left_join(modality_data, by = "ID")
  
  effects_likelihood <- effects_likelihood %>% 
    left_join(modality_data, by = "ID")
  
  ### Comprehension check failures removed
  
  effects_temporal_comp <- effects_temporal_comp %>% 
    left_join(modality_data, by = "ID")
  
  effects_temporal_2_comp <- effects_temporal_2_comp %>% 
    left_join(modality_data, by = "ID")
  
  effects_spatial_comp <- effects_spatial_comp %>% 
    left_join(modality_data, by = "ID")
  
  effects_likelihood_comp <- effects_likelihood_comp %>% 
    left_join(modality_data, by = "ID")
  
}
