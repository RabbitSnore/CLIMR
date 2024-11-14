################################################################################

# CLIMR -- Exploratory analysis, country and language

################################################################################

# Country as a random effect ---------------------------------------------------

meta_temporal_country <- rma.mv(
  yi     = d, 
  V      = var, 
  random = ~ 1 | country,
  data   = effects_temporal)

meta_spatial_country <- rma.mv(
  yi     = d, 
  V      = var,
  random = ~ 1 | country,
  data   = effects_spatial)

meta_social_country <- rma.mv(
  yi     = d, 
  V      = var, 
  random = ~ 1 | country,
  data   = effects_social)

meta_likelihood_country <- rma.mv(
  yi     = d, 
  V      = var, 
  random = ~ 1 | country,
  data   = effects_likelihood)

ranef_temporal_country   <- ranef(meta_temporal_country)
ranef_spatial_country    <- ranef(meta_spatial_country)
ranef_social_country     <- ranef(meta_social_country)
ranef_likelihood_country <- ranef(meta_likelihood_country)

# Language as a random effect --------------------------------------------------

meta_temporal_language <- rma.mv(
  yi     = d, 
  V      = var, 
  random = ~ 1 | language,
  data   = effects_temporal %>% filter(complete.cases(language)))

meta_spatial_language <- rma.mv(
  yi     = d, 
  V      = var,
  random = ~ 1 | language,
  data   = effects_spatial %>% filter(complete.cases(language)))

meta_social_language <- rma.mv(
  yi     = d, 
  V      = var, 
  random = ~ 1 | language,
  data   = effects_social %>% filter(complete.cases(language)))

meta_likelihood_language <- rma.mv(
  yi     = d, 
  V      = var, 
  random = ~ 1 | language,
  data   = effects_likelihood %>% filter(complete.cases(language)))

ranef_temporal_language   <- ranef(meta_temporal_language)
ranef_spatial_language    <- ranef(meta_spatial_language)
ranef_social_language     <- ranef(meta_social_language)
ranef_likelihood_language <- ranef(meta_likelihood_language)
