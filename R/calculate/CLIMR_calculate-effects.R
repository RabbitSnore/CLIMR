################################################################################

# CLIMR -- Effect Size Calculation

################################################################################

# Set up environment -----------------------------------------------------------

## Load general functions

source("./R/functions/CLIMR_effect-size-functions.R")

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

# Manage exclusions for modality analysis --------------------------------------

# SK_01 reported switching from in-lab to online partway through data
# collection. Because there is no way to clearly identify which cases were
# collected in-lab vs. online, this lab should be excluded from the modality
# moderation analysis.

effects_temporal$modality[effects_temporal$lab == "SK_01"]     <- NA
effects_spatial$modality[effects_spatial$lab == "SK_01"]       <- NA
effects_social$modality[effects_social$lab == "SK_01"]         <- NA
effects_likelihood$modality[effects_likelihood$lab == "SK_01"] <- NA

# IT_01 reported that some participants took part online. The following
# participant IDs were collected online. However, because there are too few
# cases with which to calculate effect sizes, rather than creating separate
# effect sizes for each modality, this lab's data will be excluded from the
# modality analysis.

# 45
# 65
# 66
# 66
# 67
# 69
# 68
# 71
# 70
# 73
# 74
# 72
# 75
# 76
# 77
# 78
# 79
# 93
# 94
# 95
# 96
# 100
# 70

effects_temporal$modality[effects_temporal$lab == "IT_01"]     <- NA
effects_spatial$modality[effects_spatial$lab == "IT_01"]       <- NA
effects_social$modality[effects_social$lab == "IT_01"]         <- NA
effects_likelihood$modality[effects_likelihood$lab == "IT_01"] <- NA

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
