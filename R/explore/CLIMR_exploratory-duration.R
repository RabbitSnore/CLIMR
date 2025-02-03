################################################################################

# CLIMR -- Moderating effect of study duration

################################################################################

# Wrangle ----------------------------------------------------------------------

# Join duration data

data_bif_temporal <- raw %>% 
  select(sub, total_duration) %>% 
  left_join(data_bif_temporal, by = "sub")

data_bif_spatial <- raw %>% 
  select(sub, total_duration) %>% 
  left_join(data_bif_spatial, by = "sub")

data_bif_social <- raw %>% 
  select(sub, total_duration) %>% 
  left_join(data_bif_social, by = "sub")

data_bif_likelihood <- raw %>% 
  select(sub, total_duration) %>% 
  left_join(data_bif_likelihood, by = "sub")

# Rescale duration

data_bif_temporal$total_duration   <- data_bif_temporal$total_duration/60
data_bif_spatial$total_duration    <- data_bif_spatial$total_duration/60
data_bif_social$total_duration     <- data_bif_social$total_duration/60
data_bif_likelihood$total_duration <- data_bif_likelihood$total_duration/60

# Analysis ---------------------------------------------------------------------

# Temporal

glmm_temporal_dur_base <- glmer(bif 
                                ~ condition 
                                + (1|lab:sub) 
                                + (1|lab) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data   = data_bif_temporal %>% 
                                  filter(total_duration <= 60))

glmm_temporal_dur_add  <- glmer(bif 
                                ~ condition 
                                + total_duration 
                                + (1|lab:sub) 
                                + (1|lab) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data   = data_bif_temporal %>% 
                                  filter(total_duration <= 60))

glmm_temporal_dur_int  <- glmer(bif 
                                ~ condition 
                                * total_duration 
                                + (1|lab:sub) 
                                + (1|lab) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data   = data_bif_temporal %>% 
                                  filter(total_duration <= 60))

lrt_dur_temporal       <- anova(glmm_temporal_dur_base, 
                                glmm_temporal_dur_add, 
                                glmm_temporal_dur_int, 
                                test = "LRT")

# Spatial

glmm_spatial_dur_base <- glmer(bif 
                               ~ condition 
                               + (1|lab:sub) 
                               + (1|lab) 
                               + (1|item), 
                               family = binomial(link = "logit"), 
                               data   = data_bif_spatial %>% 
                                 filter(total_duration <= 60))

glmm_spatial_dur_add  <- glmer(bif 
                               ~ condition 
                               + total_duration
                               + (1|lab:sub) 
                               + (1|lab) 
                               + (1|item), 
                               family = binomial(link = "logit"), 
                               data   = data_bif_spatial %>% 
                                 filter(total_duration <= 60))

glmm_spatial_dur_int  <- glmer(bif 
                               ~ condition 
                               * total_duration
                               + (1|lab:sub) 
                               + (1|lab) 
                               + (1|item), 
                               family = binomial(link = "logit"), 
                               data   = data_bif_spatial %>% 
                                 filter(total_duration <= 60),
                               control = glmerControl(
                                 optimizer = "bobyqa"
                               )
)

lrt_dur_spatial       <- anova(glmm_spatial_dur_base, 
                               glmm_spatial_dur_add, 
                               glmm_spatial_dur_int, 
                               test = "LRT")

# Social

glmm_social_dur_base <- glmer(bif 
                              ~ condition 
                              + (1|lab:sub) 
                              + (1|lab) 
                              + (1|item), 
                              family = binomial(link = "logit"), 
                              data   = data_bif_social %>% 
                                filter(total_duration <= 60))

glmm_social_dur_add  <- glmer(bif 
                              ~ condition 
                              + total_duration
                              + (1|lab:sub) 
                              + (1|lab) 
                              + (1|item), 
                              family = binomial(link = "logit"), 
                              data   = data_bif_social %>% 
                                filter(total_duration <= 60))

glmm_social_dur_int  <- glmer(bif 
                              ~ condition 
                              * total_duration
                              + (1|lab:sub) 
                              + (1|lab) 
                              + (1|item), 
                              family = binomial(link = "logit"), 
                              data   = data_bif_social %>% 
                                filter(total_duration <= 60),
                              control = glmerControl(
                                optimizer = "bobyqa"
                              ))

lrt_dur_social       <- anova(glmm_social_dur_base, 
                              glmm_social_dur_add, 
                              glmm_social_dur_int, 
                              test = "LRT")

# Likelihood

glmm_likelihood_dur_base <- glmer(bif 
                                  ~ condition 
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  data   = data_bif_likelihood %>% 
                                    filter(total_duration <= 60))

glmm_likelihood_dur_add  <- glmer(bif 
                                  ~ condition 
                                  + total_duration
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  data   = data_bif_likelihood %>% 
                                    filter(total_duration <= 60))

glmm_likelihood_dur_int  <- glmer(bif 
                                  ~ condition 
                                  * total_duration
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  data   = data_bif_likelihood %>% 
                                    filter(total_duration <= 60))

lrt_dur_likelihood       <- anova(glmm_likelihood_dur_base, 
                                  glmm_likelihood_dur_add, 
                                  glmm_likelihood_dur_int, 
                                  test = "LRT")
