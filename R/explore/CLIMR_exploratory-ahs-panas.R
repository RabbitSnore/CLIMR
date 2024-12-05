################################################################################

# CLIMR -- Exploratory analyses, Analysis-Holistic Thinking and Affect

################################################################################

# Data wrangling ---------------------------------------------------------------

# Extract AHS data

data_ahs <- raw %>% 
  select(sub, starts_with("ahs"))

# Reverse code items 7, 8, and 9 and calculate total score

data_ahs <- data_ahs %>% 
  mutate(
    ahs_7 = 8 - ahs_7,
    ahs_8 = 8 - ahs_8,
    ahs_9 = 8 - ahs_9
  )

data_ahs$ahs_mean <- rowMeans(select(data_ahs, starts_with("ahs")))

# Extract PANAS data

data_panas <- raw %>% 
  select(sub, starts_with("panas"))

# Calculate positive and negative composites

panas_pos <- data_panas %>% 
  select(
    panas_1,
    panas_3,
    panas_5,
    panas_9,
    panas_10,
    panas_12,
    panas_14,
    panas_16,
    panas_17,
    panas_19
  )

panas_neg <- data_panas %>% 
  select(
    panas_2,
    panas_4,
    panas_6,
    panas_7,
    panas_8,
    panas_11,
    panas_13,
    panas_15,
    panas_18,
    panas_20
  )

data_panas$panas_pos <- rowMeans(panas_pos)
data_panas$panas_neg <- rowMeans(panas_neg)

# Join with BIF data

data_bif_temporal   <- data_bif_temporal %>% 
  left_join(data_ahs, by = "sub") %>% 
  left_join(data_panas, by = "sub")

data_bif_spatial    <- data_bif_spatial %>% 
  left_join(data_ahs, by = "sub") %>% 
  left_join(data_panas, by = "sub")

data_bif_social     <- data_bif_social %>% 
  left_join(data_ahs, by = "sub") %>% 
  left_join(data_panas, by = "sub")

data_bif_likelihood <- data_bif_likelihood %>% 
  left_join(data_ahs, by = "sub") %>% 
  left_join(data_panas, by = "sub")

# Mean centering

data_bif_temporal$ahs_mean <- as.numeric(
  scale(data_bif_temporal$ahs_mean, scale = FALSE)
  ) 
data_bif_temporal$panas_pos <- as.numeric(
  scale(data_bif_temporal$panas_pos, scale = FALSE)
  ) 
data_bif_temporal$panas_neg <- as.numeric(
  scale(data_bif_temporal$panas_neg, scale = FALSE)
  ) 

data_bif_spatial$ahs_mean <- as.numeric(
  scale(data_bif_spatial$ahs_mean, scale = FALSE)
  ) 
data_bif_spatial$panas_pos <- as.numeric(
  scale(data_bif_spatial$panas_pos, scale = FALSE)
  ) 
data_bif_spatial$panas_neg <- as.numeric(
  scale(data_bif_spatial$panas_neg, scale = FALSE)
  ) 

data_bif_social$ahs_mean <- as.numeric(
  scale(data_bif_social$ahs_mean, scale = FALSE)
  ) 
data_bif_social$panas_pos <- as.numeric(
  scale(data_bif_social$panas_pos, scale = FALSE)
  ) 
data_bif_social$panas_neg <- as.numeric(
  scale(data_bif_social$panas_neg, scale = FALSE)
  ) 

data_bif_likelihood$ahs_mean <- as.numeric(
  scale(data_bif_likelihood$ahs_mean, scale = FALSE)
  ) 
data_bif_likelihood$panas_pos <- as.numeric(
  scale(data_bif_likelihood$panas_pos, scale = FALSE)
  ) 
data_bif_likelihood$panas_neg <- as.numeric(
  scale(data_bif_likelihood$panas_neg, scale = FALSE)
  ) 

# Analysis: AHS ----------------------------------------------------------------

# Temporal

glmm_temporal_ahs_base <- glmer(bif 
                                ~ condition 
                                + (1|lab:sub) 
                                + (1|lab) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data   = data_bif_temporal %>% 
                                  filter(complete.cases(ahs_mean)))

glmm_temporal_ahs_add  <- glmer(bif 
                                ~ condition 
                                + ahs_mean 
                                + (1|lab:sub) 
                                + (1|lab) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data   = data_bif_temporal %>% 
                                  filter(complete.cases(ahs_mean)))

glmm_temporal_ahs_int  <- glmer(bif 
                                ~ condition 
                                * ahs_mean 
                                + (1|lab:sub) 
                                + (1|lab) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data   = data_bif_temporal %>% 
                                  filter(complete.cases(ahs_mean)))

lrt_ahs_temporal       <- anova(glmm_temporal_ahs_base, 
                                glmm_temporal_ahs_add, 
                                glmm_temporal_ahs_int, 
                                test = "LRT")

# Spatial

glmm_spatial_ahs_base <- glmer(bif 
                               ~ condition 
                               + (1|lab:sub) 
                               + (1|lab) 
                               + (1|item), 
                               family = binomial(link = "logit"), 
                               data   = data_bif_spatial %>% 
                                 filter(complete.cases(ahs_mean)))

glmm_spatial_ahs_add  <- glmer(bif 
                               ~ condition 
                               + ahs_mean
                               + (1|lab:sub) 
                               + (1|lab) 
                               + (1|item), 
                               family = binomial(link = "logit"), 
                               data   = data_bif_spatial %>% 
                                 filter(complete.cases(ahs_mean)))

glmm_spatial_ahs_int  <- glmer(bif 
                               ~ condition 
                               * ahs_mean
                               + (1|lab:sub) 
                               + (1|lab) 
                               + (1|item), 
                               family = binomial(link = "logit"), 
                               data   = data_bif_spatial %>% 
                                 filter(complete.cases(ahs_mean)),
                               control = glmerControl(
                                 optimizer = "bobyqa"
                                 )
                               )

lrt_ahs_spatial       <- anova(glmm_spatial_ahs_base, 
                               glmm_spatial_ahs_add, 
                               glmm_spatial_ahs_int, 
                               test = "LRT")

# Social

glmm_social_ahs_base <- glmer(bif 
                              ~ condition 
                              + (1|lab:sub) 
                              + (1|lab) 
                              + (1|item), 
                              family = binomial(link = "logit"), 
                              data   = data_bif_social %>% 
                                filter(complete.cases(ahs_mean)))

glmm_social_ahs_add  <- glmer(bif 
                              ~ condition 
                              + ahs_mean
                              + (1|lab:sub) 
                              + (1|lab) 
                              + (1|item), 
                              family = binomial(link = "logit"), 
                              data   = data_bif_social %>% 
                                filter(complete.cases(ahs_mean)))

glmm_social_ahs_int  <- glmer(bif 
                              ~ condition 
                              * ahs_mean
                              + (1|lab:sub) 
                              + (1|lab) 
                              + (1|item), 
                              family = binomial(link = "logit"), 
                              data   = data_bif_social %>% 
                                filter(complete.cases(ahs_mean)),
                              control = glmerControl(
                                optimizer = "bobyqa"
                              ))

lrt_ahs_social       <- anova(glmm_social_ahs_base, 
                              glmm_social_ahs_add, 
                              glmm_social_ahs_int, 
                              test = "LRT")

# Likelihood

glmm_likelihood_ahs_base <- glmer(bif 
                                  ~ condition 
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  data   = data_bif_likelihood %>% 
                                    filter(complete.cases(ahs_mean)))

glmm_likelihood_ahs_add  <- glmer(bif 
                                  ~ condition 
                                  + ahs_mean
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  data   = data_bif_likelihood %>% 
                                    filter(complete.cases(ahs_mean)))

glmm_likelihood_ahs_int  <- glmer(bif 
                                  ~ condition 
                                  * ahs_mean
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  data   = data_bif_likelihood %>% 
                                    filter(complete.cases(ahs_mean)))

lrt_ahs_likelihood       <- anova(glmm_likelihood_ahs_base, 
                                  glmm_likelihood_ahs_add, 
                                  glmm_likelihood_ahs_int, 
                                  test = "LRT")

# Analysis: PANAS --------------------------------------------------------------

# Temporal

glmm_temporal_panas_base <- glmer(bif 
                                  ~ condition 
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  data   = data_bif_temporal %>% 
                                    filter(complete.cases(panas_pos, panas_neg)))

glmm_temporal_panas_add  <- glmer(bif 
                                  ~ condition 
                                  + panas_pos
                                  + panas_neg
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  data   = data_bif_temporal %>% 
                                    filter(complete.cases(panas_pos, panas_neg)))

glmm_temporal_panas_int  <- glmer(bif 
                                  ~ condition 
                                  * panas_pos
                                  + condition
                                  * panas_neg 
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  data   = data_bif_temporal %>% 
                                    filter(complete.cases(panas_pos, panas_neg)))

lrt_panas_temporal       <- anova(glmm_temporal_panas_base, 
                                  glmm_temporal_panas_add, 
                                  glmm_temporal_panas_int, 
                                  test = "LRT")

glmm_temporal_panas_val  <- glmer(bif 
                                  ~ condition 
                                  + panas_pos
                                  * d
                                  + panas_neg
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  data   = data_bif_temporal %>% 
                                    filter(complete.cases(panas_pos, panas_neg)))

lrt_panas_val_temporal <- anova(glmm_temporal_panas_add, 
                                glmm_temporal_panas_val, 
                                test = "LRT")

# Spatial

glmm_spatial_panas_base <- glmer(bif 
                                 ~ condition 
                                 + (1|lab:sub) 
                                 + (1|lab) 
                                 + (1|item), 
                                 family = binomial(link = "logit"), 
                                 data   = data_bif_spatial %>% 
                                   filter(complete.cases(panas_pos, panas_neg)))

glmm_spatial_panas_add  <- glmer(bif 
                                 ~ condition 
                                 + panas_pos
                                 + panas_neg
                                 + (1|lab:sub) 
                                 + (1|lab) 
                                 + (1|item), 
                                 family = binomial(link = "logit"), 
                                 data   = data_bif_spatial %>% 
                                   filter(complete.cases(panas_pos, panas_neg)))

glmm_spatial_panas_int  <- glmer(bif 
                                 ~ condition 
                                 * panas_pos
                                 + condition
                                 * panas_neg 
                                 + (1|lab:sub) 
                                 + (1|lab) 
                                 + (1|item), 
                                 family = binomial(link = "logit"), 
                                 data   = data_bif_spatial %>% 
                                   filter(complete.cases(panas_pos, panas_neg)))

lrt_panas_spatial       <- anova(glmm_spatial_panas_base, 
                                 glmm_spatial_panas_add, 
                                 glmm_spatial_panas_int, 
                                 test = "LRT")

glmm_spatial_panas_val  <- glmer(bif 
                                  ~ condition 
                                  + panas_pos
                                  * d
                                  + panas_neg
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  data   = data_bif_spatial %>% 
                                    filter(complete.cases(panas_pos, panas_neg)))

lrt_panas_val_spatial <- anova(glmm_spatial_panas_add, 
                                glmm_spatial_panas_val, 
                                test = "LRT")

# Social

glmm_social_panas_base <- glmer(bif 
                                ~ condition 
                                + (1|lab:sub) 
                                + (1|lab) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data   = data_bif_social %>% 
                                  filter(complete.cases(panas_pos, panas_neg)))

glmm_social_panas_add  <- glmer(bif 
                                ~ condition 
                                + panas_pos
                                + panas_neg
                                + (1|lab:sub) 
                                + (1|lab) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data   = data_bif_social %>% 
                                  filter(complete.cases(panas_pos, panas_neg)))

glmm_social_panas_int  <- glmer(bif 
                                ~ condition 
                                * panas_pos
                                + condition
                                * panas_neg 
                                + (1|lab:sub) 
                                + (1|lab) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                data   = data_bif_social %>% 
                                  filter(complete.cases(panas_pos, panas_neg)))

lrt_panas_social       <- anova(glmm_social_panas_base, 
                                glmm_social_panas_add, 
                                glmm_social_panas_int, 
                                test = "LRT")

glmm_social_panas_val_int  <- glmer(bif 
                                    ~ condition 
                                    * panas_pos
                                    + condition
                                    * panas_neg
                                    + condition
                                    * d
                                    + (1|lab:sub) 
                                    + (1|lab) 
                                    + (1|item), 
                                    family = binomial(link = "logit"), 
                                    data   = data_bif_social %>% 
                                      filter(complete.cases(panas_pos, panas_neg)))

glmm_social_panas_val_int_3  <- glmer(bif 
                                    ~ condition 
                                    * panas_pos
                                    + condition
                                    * panas_neg
                                    + condition
                                    * d
                                    * panas_pos
                                    + (1|lab:sub) 
                                    + (1|lab) 
                                    + (1|item), 
                                    family = binomial(link = "logit"), 
                                    data   = data_bif_social %>% 
                                      filter(complete.cases(panas_pos, panas_neg)),
                                    control = glmerControl(
                                      optimizer = "bobyqa"
                                    ))

lrt_panas_val_social <- anova(glmm_social_panas_int, 
                              glmm_social_panas_val_int,
                              glmm_social_panas_val_int_3,
                              test = "LRT")

# Likelihood

glmm_likelihood_panas_base <- glmer(bif 
                                    ~ condition 
                                    + (1|lab:sub) 
                                    + (1|lab) 
                                    + (1|item), 
                                    family = binomial(link = "logit"), 
                                    data   = data_bif_likelihood %>% 
                                      filter(complete.cases(panas_pos, panas_neg)))

glmm_likelihood_panas_add  <- glmer(bif 
                                    ~ condition 
                                    + panas_pos
                                    + panas_neg
                                    + (1|lab:sub) 
                                    + (1|lab) 
                                    + (1|item), 
                                    family = binomial(link = "logit"), 
                                    data   = data_bif_likelihood %>% 
                                      filter(complete.cases(panas_pos, panas_neg)))

glmm_likelihood_panas_int  <- glmer(bif 
                                    ~ condition 
                                    * panas_pos
                                    + condition
                                    * panas_neg 
                                    + (1|lab:sub) 
                                    + (1|lab) 
                                    + (1|item), 
                                    family = binomial(link = "logit"), 
                                    data   = data_bif_likelihood %>% 
                                      filter(complete.cases(panas_pos, panas_neg)))

lrt_panas_likelihood       <- anova(glmm_likelihood_panas_base, 
                                    glmm_likelihood_panas_add, 
                                    glmm_likelihood_panas_int, 
                                    test = "LRT")

glmm_likelihood_panas_val  <- glmer(bif 
                                    ~ condition 
                                    + panas_pos
                                    * d
                                    + panas_neg
                                    + (1|lab:sub) 
                                    + (1|lab) 
                                    + (1|item), 
                                    family = binomial(link = "logit"), 
                                    data   = data_bif_likelihood %>% 
                                      filter(complete.cases(panas_pos, panas_neg)))

lrt_panas_val_likelihood <- anova(glmm_likelihood_panas_add, 
                                  glmm_likelihood_panas_val, 
                                  test = "LRT")
