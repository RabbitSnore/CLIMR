################################################################################

# CLIMR -- Exploratory analysis, additional BIF response option analyses

################################################################################

# Additional valence analysis --------------------------------------------------

# It is reasonable to add random slopes for the effect of the manipulation for
# labs and for BIF items. These models add those random slopes.

# Temporal

glmm_temporal_bif_base_rs <- glmer(bif 
                                   ~ condition 
                                   + (1|lab:sub) 
                                   + (1 + condition |lab) 
                                   + (1 + condition |item), 
                                   family = binomial(link = "logit"), 
                                   data   = data_bif_temporal)

glmm_temporal_bif_val_rs  <- glmer(bif 
                                   ~ condition 
                                   + d 
                                   + (1|lab:sub) 
                                   + (1 + condition |lab) 
                                   + (1 + condition |item), 
                                   family = binomial(link = "logit"), 
                                   data   = data_bif_temporal)

glmm_temporal_bif_int_rs  <- glmer(bif 
                                   ~ condition 
                                   * d 
                                   + (1|lab:sub) 
                                   + (1 + condition |lab) 
                                   + (1 + condition |item), 
                                   family = binomial(link = "logit"), 
                                   data   = data_bif_temporal)

lrt_val_temporal_rs       <- anova(glmm_temporal_bif_base_rs, 
                                   glmm_temporal_bif_val_rs, 
                                   glmm_temporal_bif_int_rs, 
                                   test = "LRT")

# Spatial

glmm_spatial_bif_base_rs <- glmer(bif 
                                  ~ condition 
                                  + (1|lab:sub) 
                                  + (1 + condition |lab) 
                                  + (1 + condition |item), 
                                  family = binomial(link = "logit"), 
                                  data   = data_bif_spatial)

glmm_spatial_bif_val_rs  <- glmer(bif 
                                  ~ condition 
                                  + d 
                                  + (1|lab:sub) 
                                  + (1 + condition |lab) 
                                  + (1 + condition |item), 
                                  family = binomial(link = "logit"), 
                                  data   = data_bif_spatial)

glmm_spatial_bif_int_rs  <- glmer(bif 
                                  ~ condition 
                                  * d 
                                  + (1|lab:sub) 
                                  + (1 + condition |lab) 
                                  + (1 + condition |item), 
                                  family = binomial(link = "logit"), 
                                  data   = data_bif_spatial)

lrt_val_spatial_rs       <- anova(glmm_spatial_bif_base_rs, 
                                  glmm_spatial_bif_val_rs, 
                                  glmm_spatial_bif_int_rs, 
                                  test = "LRT")

# Social

glmm_social_bif_base_rs <- glmer(bif 
                                 ~ condition 
                                 + (1|lab:sub) 
                                 + (1 + condition |lab) 
                                 + (1 + condition |item), 
                                 family = binomial(link = "logit"), 
                                 data   = data_bif_social)

glmm_social_bif_val_rs  <- glmer(bif
                                 ~ condition 
                                 + d 
                                 + (1|lab:sub) 
                                 + (1 + condition |lab) 
                                 + (1 + condition |item), 
                                 family = binomial(link = "logit"), 
                                 control = glmerControl(
                                   optimizer = "Nelder_Mead", 
                                   optCtrl   = list(maxfun = 100000)
                                 ),
                                 data   = data_bif_social)

glmm_social_bif_int_rs  <- glmer(bif
                                 ~ condition 
                                 * d 
                                 + (1|lab:sub) 
                                 + (1 + condition |lab) 
                                 + (1 + condition |item), 
                                 family  = binomial(link = "logit"), 
                                 control = glmerControl(
                                   optimizer = "Nelder_Mead", 
                                   optCtrl   = list(maxfun = 100000)
                                 ),
                                 data    = data_bif_social)

lrt_val_social_rs       <- anova(glmm_social_bif_base_rs, 
                                 glmm_social_bif_val_rs, 
                                 glmm_social_bif_int_rs, 
                                 test = "LRT")

# Likelihood

glmm_likelihood_bif_base_rs <- glmer(bif 
                                     ~ condition 
                                     + (1|lab:sub) 
                                     + (1 + condition |lab) 
                                     + (1 + condition |item), 
                                     family = binomial(link = "logit"), 
                                     data   = data_bif_likelihood)

glmm_likelihood_bif_val_rs  <- glmer(bif 
                                     ~ condition 
                                     + d 
                                     + (1|lab:sub) 
                                     + (1 + condition |lab) 
                                     + (1 + condition |item), 
                                     family = binomial(link = "logit"), 
                                     data   = data_bif_likelihood)

glmm_likelihood_bif_int_rs  <- glmer(bif 
                                     ~ condition 
                                     * d 
                                     + (1|lab:sub) 
                                     + (1 + condition |lab) 
                                     + (1 + condition |item), 
                                     family = binomial(link = "logit"), 
                                     data   = data_bif_likelihood)

lrt_val_likelihood_rs       <- anova(glmm_likelihood_bif_base_rs, 
                                     glmm_likelihood_bif_val_rs, 
                                     glmm_likelihood_bif_int_rs, 
                                     test = "LRT")

# Data wrangling for full BIF --------------------------------------------------

data_bif_temporal_full   <- data_bif_temporal_full %>% 
  left_join(select(bif_d_rel, item, d), by = "item")

data_bif_spatial_full    <- data_bif_spatial_full %>% 
  left_join(select(bif_d_rel, item, d), by = "item")

data_bif_likelihood_full <- data_bif_likelihood_full %>% 
  left_join(select(bif_d_rel, item, d), by = "item")

# Analysis of full BIF, rather than selected items -----------------------------

# Temporal

glmm_temporal_bif_base_full <- glmer(bif 
                                     ~ condition 
                                     + (1|lab:sub) 
                                     + (1|lab) 
                                     + (1|item), 
                                     family = binomial(link = "logit"), 
                                     data   = data_bif_temporal_full)

glmm_temporal_bif_val_full  <- glmer(bif 
                                     ~ condition 
                                     + d 
                                     + (1|lab:sub) 
                                     + (1|lab) 
                                     + (1|item), 
                                     family = binomial(link = "logit"), 
                                     data   = data_bif_temporal_full)

glmm_temporal_bif_int_full  <- glmer(bif 
                                     ~ condition 
                                     * d 
                                     + (1|lab:sub) 
                                     + (1|lab) 
                                     + (1|item), 
                                     family = binomial(link = "logit"), 
                                     data   = data_bif_temporal_full)

lrt_val_temporal_full       <- anova(glmm_temporal_bif_base_full, 
                                     glmm_temporal_bif_val_full, 
                                     glmm_temporal_bif_int_full, 
                                     test = "LRT")

# Spatial

glmm_spatial_bif_base_full <- glmer(bif 
                                    ~ condition 
                                    + (1|lab:sub) 
                                    + (1|lab) 
                                    + (1|item), 
                                    family = binomial(link = "logit"), 
                                    data   = data_bif_spatial_full)

glmm_spatial_bif_val_full  <- glmer(bif 
                                    ~ condition 
                                    + d 
                                    + (1|lab:sub) 
                                    + (1|lab) 
                                    + (1|item), 
                                    family = binomial(link = "logit"), 
                                    data   = data_bif_spatial_full)

glmm_spatial_bif_int_full  <- glmer(bif 
                                    ~ condition 
                                    * d 
                                    + (1|lab:sub) 
                                    + (1|lab) 
                                    + (1|item), 
                                    family = binomial(link = "logit"), 
                                    data   = data_bif_spatial_full)

lrt_val_spatial_full       <- anova(glmm_spatial_bif_base_full, 
                                    glmm_spatial_bif_val_full, 
                                    glmm_spatial_bif_int_full, 
                                    test = "LRT")

# Likelihood

glmm_likelihood_bif_base_full <- glmer(bif 
                                       ~ condition 
                                       + (1|lab:sub) 
                                       + (1|lab) 
                                       + (1|item), 
                                       family = binomial(link = "logit"), 
                                       data   = data_bif_likelihood_full)

glmm_likelihood_bif_val_full  <- glmer(bif 
                                       ~ condition 
                                       + d 
                                       + (1|lab:sub) 
                                       + (1|lab) 
                                       + (1|item), 
                                       family = binomial(link = "logit"), 
                                       data   = data_bif_likelihood_full)

glmm_likelihood_bif_int_full  <- glmer(bif 
                                       ~ condition 
                                       * d 
                                       + (1|lab:sub) 
                                       + (1|lab) 
                                       + (1|item), 
                                       family = binomial(link = "logit"), 
                                       data   = data_bif_likelihood_full)

lrt_val_likelihood_full       <- anova(glmm_likelihood_bif_base_full, 
                                       glmm_likelihood_bif_val_full, 
                                       glmm_likelihood_bif_int_full, 
                                       test = "LRT")

# Analysis of temporal distance interaction ------------------------------------

# A visual inspection of a plot of the interaction between valence differences
# and temporal distance suggests that the effect may not be robust to the
# removal of the item with the smallest valence difference.

# Temporal

glmm_temporal_bif_base_rem <- glmer(bif 
                                    ~ condition 
                                    + (1|lab:sub) 
                                    + (1|lab) 
                                    + (1|item), 
                                    family = binomial(link = "logit"), 
                                    data   = data_bif_temporal %>% 
                                      filter(d != min(d)))

glmm_temporal_bif_val_rem  <- glmer(bif 
                                    ~ condition 
                                    + d 
                                    + (1|lab:sub) 
                                    + (1|lab) 
                                    + (1|item), 
                                    family = binomial(link = "logit"), 
                                    data   = data_bif_temporal %>% 
                                      filter(d != min(d)))

glmm_temporal_bif_int_rem  <- glmer(bif 
                                    ~ condition 
                                    * d 
                                    + (1|lab:sub) 
                                    + (1|lab) 
                                    + (1|item), 
                                    family = binomial(link = "logit"), 
                                    data   = data_bif_temporal %>% 
                                      filter(d != min(d)))

lrt_val_temporal_rem       <- anova(glmm_temporal_bif_base_rem, 
                                    glmm_temporal_bif_val_rem, 
                                    glmm_temporal_bif_int_rem, 
                                    test = "LRT")
