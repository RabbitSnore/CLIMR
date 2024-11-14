################################################################################

# CLIMR -- Exploratory analysis, BIF reliability

################################################################################

# Set up data ------------------------------------------------------------------

bif_rel_temporal   <- data_bif_temporal_wide %>% 
  select(starts_with("bif"))

bif_rel_spatial    <- data_bif_spatial_wide %>% 
  select(starts_with("bif"))

bif_rel_social     <- data_bif_social_wide %>% 
  select(starts_with("bif"))

bif_rel_likelihood <- data_bif_likelihood_wide %>% 
  select(starts_with("bif"))

# Reliability analysis ---------------------------------------------------------

# Alpha

bif_alpha_temporal   <- psych::alpha(bif_rel_temporal)
bif_alpha_spatial    <- psych::alpha(bif_rel_spatial)
bif_alpha_social     <- psych::alpha(bif_rel_social)
bif_alpha_likelihood <- psych::alpha(bif_rel_likelihood)

# Omega

bif_alpha_temporal   <- psych::omega(bif_rel_temporal)
bif_alpha_spatial    <- psych::omega(bif_rel_spatial)
bif_alpha_social     <- psych::omega(bif_rel_social)
bif_alpha_likelihood <- psych::omega(bif_rel_likelihood)
