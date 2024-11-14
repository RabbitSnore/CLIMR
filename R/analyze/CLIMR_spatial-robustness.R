################################################################################

# CLIMR -- Robustness check for spatial experiment

################################################################################

# Create exclusion sets --------------------------------------------------------

# Remove online cases where participant indicates incorrect location

data_spatial_loc <- data_spatial %>% 
  filter(!(modality == "online" & location == 2)) %>% 
  # Remove SK_01 because they did not have a location check
  filter(lab != "SK_01") %>% 
  # Remove CH_01 because they did not have a location check
  filter(lab != "CH_01") %>% 
  # Remove IT_01 because they did not have a location check
  filter(lab != "IT_01") 

# Calculate effects

### Primary effect sizes

effects_spatial_loc <- lab_d_calc(
  data       = data_spatial_loc, 
  distance   = "spatial", 
  experiment = "Spatial (Fujita et al., 2006, Study 1)"
)

### Comprehension check failures removed

effects_spatial_loc_comp <- lab_d_calc(
  data       = filter(data_spatial_loc, comp_check == 0), 
  distance   = "spatial", 
  experiment = "Spatial (Fujita et al., 2006, Study 1)"
)

# Meta-analytic models ---------------------------------------------------------

# Primary analysis

meta_spatial_loc <- rma(
  yi = d, 
  vi = var, 
  data = effects_spatial_loc)

bt_spatial_loc <- diff_calc(
  y        = data_spatial_loc$bif_total, 
  d        = meta_spatial_loc$beta[[1]], 
  ci_lower = meta_spatial_loc$ci.lb[[1]], 
  ci_upper = meta_spatial_loc$ci.ub[[1]])

## Comprehension check exclusions

meta_spatial_loc_comp <- rma(
  yi = d, 
  vi = var, 
  data = effects_spatial_loc_comp)

bt_spatial_loc_comp <- diff_calc(
  y        = filter(data_spatial_loc, comp_check == 0)$bif_total, 
  d        = meta_spatial_loc_comp$beta[[1]], 
  ci_lower = meta_spatial_loc_comp$ci.lb[[1]], 
  ci_upper = meta_spatial_loc_comp$ci.ub[[1]])

# Modality moderator meta-analysis

meta_spatial_loc_mode_Q <- rma(
  yi = d, 
  vi = var,
  mods = ~ modality,
  data = effects_spatial_loc)

meta_spatial_loc_mode <- rma(
  yi = d, 
  vi = var,
  mods = ~ modality - 1,
  data = effects_spatial_loc)

# Comprehension check meta-analysis

meta_spatial_loc_comp_mode <- rma(
  yi = d, 
  vi = var, 
  mods = ~ modality - 1,
  data = effects_spatial_loc_comp)
