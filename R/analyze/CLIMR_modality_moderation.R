################################################################################

# CLIMR -- Modality moderator Analyses

################################################################################

## Liberman et al. (2002, Study 1): Temporal Distance --------------------------

### Modality moderator meta-analysis

meta_temporal_mode_Q <- rma(
  yi = d, 
  vi = var, 
  mods = ~ modality,
  data = effects_temporal)

meta_temporal_mode <- rma(
  yi = d, 
  vi = var, 
  mods = ~ modality - 1,
  data = effects_temporal)

### Comprehension check meta-analysis

meta_temporal_mode <- rma(
  yi = d, 
  vi = var, 
  mods = ~ modality - 1,
  data = effects_temporal_comp)

## Fujita et al. (2006, Study 1): Spatial Distance -----------------------------

### Modality moderator meta-analysis

meta_spatial_mode_Q <- rma(
  yi = d, 
  vi = var,
  mods = ~ modality,
  data = effects_spatial)

meta_spatial_mode <- rma(
  yi = d, 
  vi = var,
  mods = ~ modality - 1,
  data = effects_spatial)

### Comprehension check meta-analysis

meta_spatial_comp_mode <- rma(
  yi = d, 
  vi = var, 
  mods = ~ modality - 1,
  data = effects_spatial_comp)

## Social Distance (Conceptual Replication) ------------------------------------

### Modality moderator meta-analysis

meta_social_mode_Q <- rma(
  yi = d, 
  vi = var, 
  mods = ~ modality,
  data = effects_social)

meta_social_mode <- rma(
  yi = d, 
  vi = var, 
  mods = ~ modality - 1,
  data = effects_social)

### Comprehension check meta-analysis

meta_social_comp_mode <- rma(
  yi = d, 
  vi = var, 
  mods = ~ modality - 1,
  data = effects_social_comp)

## Likelihood Distance (Conceptual Replication) --------------------------------

### Modality moderator meta-analysis

meta_likelihood_mode_Q <- rma(
  yi = d, 
  vi = var, 
  mods = ~ modality,
  data = effects_likelihood)

meta_likelihood_mode <- rma(
  yi = d, 
  vi = var, 
  mods = ~ modality - 1,
  data = effects_likelihood)

### Comprehension check meta-analysis

meta_likelihood_comp_mode <- rma(
  yi = d, 
  vi = var, 
  mods = ~ modality - 1,
  data = effects_likelihood_comp)
