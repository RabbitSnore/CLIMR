################################################################################

# CLIMR -- Robustness check for valence difference in BIF response options

################################################################################

# Data wrangling ---------------------------------------------------------------

data_bif_temporal <- data_bif_temporal %>% 
  left_join(select(bif_d_rel, item, d), by = "item")

data_bif_spatial <- data_bif_spatial %>% 
  left_join(select(bif_d_rel, item, d), by = "item")

data_bif_social <- data_bif_social %>% 
  left_join(select(bif_d_rel, item, d), by = "item")

data_bif_likelihood <- data_bif_likelihood %>% 
  left_join(select(bif_d_rel, item, d), by = "item")

# Analysis ---------------------------------------------------------------------

# Temporal

glmm_temporal_bif_base <- glmer(bif 
                                ~ condition 
                                + (1|lab:sub) 
                                + (1|lab) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data = data_bif_temporal)

glmm_temporal_bif_val  <- glmer(bif 
                                ~ condition 
                                + d 
                                + (1|lab:sub) 
                                + (1|lab) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data = data_bif_temporal)

glmm_temporal_bif_int  <- glmer(bif 
                                ~ condition 
                                * d 
                                + (1|lab:sub) 
                                + (1|lab) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data = data_bif_temporal)

lrt_val_temporal       <- anova(glmm_temporal_bif_base, 
                                glmm_temporal_bif_val, 
                                glmm_temporal_bif_int, 
                                test = "LRT")

# Spatial

glmm_spatial_bif_base <- glmer(bif 
                               ~ condition 
                               + (1|lab:sub) 
                               + (1|lab) 
                               + (1|item), 
                               family = binomial(link = "logit"), 
                               data = data_bif_spatial)

glmm_spatial_bif_val  <- glmer(bif 
                               ~ condition 
                               + d 
                               + (1|lab:sub) 
                               + (1|lab) 
                               + (1|item), 
                               family = binomial(link = "logit"), 
                               data = data_bif_spatial)

glmm_spatial_bif_int  <- glmer(bif 
                               ~ condition 
                               * d 
                               + (1|lab:sub) 
                               + (1|lab) 
                               + (1|item), 
                               family = binomial(link = "logit"), 
                               data = data_bif_spatial)

lrt_val_spatial       <- anova(glmm_spatial_bif_base, 
                               glmm_spatial_bif_val, 
                               glmm_spatial_bif_int, 
                               test = "LRT")

# Social

glmm_social_bif_base <- glmer(bif 
                              ~ condition 
                              + (1|lab:sub) 
                              + (1|lab) 
                              + (1|item), 
                              family = binomial(link = "logit"), 
                              data = data_bif_social)

glmm_social_bif_val  <- glmer(bif 
                              ~ condition 
                              + d 
                              + (1|lab:sub) 
                              + (1|lab) 
                              + (1|item), 
                              family = binomial(link = "logit"), 
                              data = data_bif_social)

glmm_social_bif_int  <- glmer(bif 
                              ~ condition 
                              * d 
                              + (1|lab:sub) 
                              + (1|lab) 
                              + (1|item), 
                              family = binomial(link = "logit"), 
                              data = data_bif_social)

lrt_val_social       <- anova(glmm_social_bif_base, 
                              glmm_social_bif_val, 
                              glmm_social_bif_int, 
                              test = "LRT")

# Likelihood

glmm_likelihood_bif_base <- glmer(bif 
                                  ~ condition 
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  data = data_bif_likelihood)

glmm_likelihood_bif_val  <- glmer(bif 
                                  ~ condition 
                                  + d 
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  data = data_bif_likelihood)

glmm_likelihood_bif_int  <- glmer(bif 
                                  ~ condition 
                                  * d 
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  data = data_bif_likelihood)

lrt_val_likelihood       <- anova(glmm_likelihood_bif_base, 
                                  glmm_likelihood_bif_val, 
                                  glmm_likelihood_bif_int, 
                                  test = "LRT")

