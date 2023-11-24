################################################################################

# CLIMR -- Data Simulation

################################################################################

# Set up environment -----------------------------------------------------------

set.seed(1040)

# Shared Attributes ------------------------------------------------------------

### NOTE
# These attributes are shared between simulations for convenience. They are not 
# intended to be realistic or to reflect our beliefs about the likely outcome of
# the replications. The values specified throughout this document are basically 
# arbitrary. They are designed to test the code and analytic strategy, not to 
# model any theory or empirical results.
###

# Effect and basic design specification

## Intercept, condition slopes

fixed <- c(0, -.475)

## Conditions

condition <- c("distant", "close")

## Sample sizes

subs <- 25 # Participants per experiment

labs <- 99 # The number of contributing laboratories

# Liberman & Trope (1998, Study 1): Temporal Distance --------------------------

## 2 (between)

temporal_variances <- .05

## Data structure

total_subs_temporal <- subs*labs

sub_temporal <- paste("temporal_", 1:total_subs_temporal, sep = "")

lab_temporal <- sort(rep(1:labs, subs))

condition_temporal <- sample(condition, total_subs_temporal, replace = TRUE)

str_temporal <- data.frame(lab = lab_temporal, 
                           sub = sub_temporal, 
                           condition = condition_temporal)

levels(str_temporal$condition) <- c("distant", "close")

## Model simulation

# The data are simulated from a Poisson distribution,
# because BIF scores are discrete values.

model_temporal <- makeGlmer(bif_total ~ condition + (1|lab), 
                            family = poisson(link = "log"), 
                            fixef = fixed, 
                            VarCorr = temporal_variances, 
                            data = str_temporal)

## Data simulation

data_temporal <- getData(model_temporal)

data_temporal$condition <- as.factor(data_temporal$condition)

levels(data_temporal$condition) <- c("distant", "close")

contrasts(data_temporal$condition) <- contr.sum(2)

## Adding comprehension check

# For this variable, 0 indicates passing the check
# and 1 indicates failing the check.
# The data are set this way to facilitate easier analysis.

data_temporal$comp_check <- sample(c(0, 1), 
                                   nrow(data_temporal), 
                                   replace = TRUE, 
                                   prob = c(.95, .05))

# Fujita et al. (2006, Study 1): Spatial Distance ------------------------------

## 2 (between)

spatial_variances <- .05

## Data structure

total_subs_spatial <- subs*labs

sub_spatial <- paste("spatial_", 1:total_subs_spatial, sep = "")

lab_spatial <- sort(rep(1:labs, subs))

condition_spatial <- sample(condition, total_subs_spatial, replace = TRUE)

str_spatial <- data.frame(lab = lab_spatial, 
                          sub = sub_spatial, 
                          condition = condition_spatial)

levels(str_spatial$condition) <- c("distant", "close")

## Model simulation

# The data are simulated from a Poisson distribution,
# because BIF scores are discrete values.

model_spatial <- makeGlmer(bif_total ~ condition + (1|lab), 
                           family = poisson(link = "log"), 
                           fixef = fixed, 
                           VarCorr = spatial_variances, 
                           data = str_spatial)

## Data simulation

data_spatial <- getData(model_spatial)

data_spatial$condition <- as.factor(data_spatial$condition)

levels(data_spatial$condition) <- c("distant", "close")

contrasts(data_spatial$condition) <- contr.sum(2)

## Adding comprehension check

# For this variable, 0 indicates passing the check
# and 1 indicates failing the check.
# The data are set this way to facilitate easier analysis.

data_spatial$comp_check <- sample(c(0, 1), nrow(data_spatial), 
                                  replace = TRUE, 
                                  prob = c(.95, .05))

# Social Distance (Paradigmatic Replication) -----------------------------------

## 2 (between)

social_variances <- .05

## Data structure

total_subs_social <- subs*labs

sub_social <- paste("social_", 1:total_subs_social, sep = "")

lab_social <- sort(rep(1:labs, subs))

condition_social <- sample(condition, total_subs_social, replace = TRUE)

str_social <- data.frame(lab = lab_social, 
                         sub = sub_social, 
                         condition = condition_social)

levels(str_social$condition) <- c("distant", "close")

## Model simulation

# The data are simulated from a Poisson distribution,
# because BIF scores are discrete values.

model_social <- makeGlmer(bif_total ~ condition + (1|lab), 
                          family = poisson(link = "log"), 
                          fixef = fixed, 
                          VarCorr = social_variances, 
                          data = str_social)

## Data simulation

data_social <- getData(model_social)

data_social$condition <- as.factor(data_social$condition)

levels(data_social$condition) <- c("distant", "close")

contrasts(data_social$condition) <- contr.sum(2)

## Adding comprehension check

# For this variable, 0 indicates passing the check
# and 1 indicates failing the check.
# The data are set this way to facilitate easier analysis.

data_social$comp_check <- sample(c(0, 1), nrow(data_social), 
                                 replace = TRUE, 
                                 prob = c(.95, .05))

# Likelihood Distance (Paradigmatic Replication) -------------------------------

## 2 (between)

likelihood_variances <- .05

## Data structure

total_subs_likelihood <- subs*labs

sub_likelihood <- paste("likelihood_", 1:total_subs_likelihood, sep = "")

lab_likelihood <- sort(rep(1:labs, subs))

condition_likelihood <- sample(condition, total_subs_likelihood, replace = TRUE)

str_likelihood <- data.frame(lab = lab_likelihood, 
                             sub = sub_likelihood, 
                             condition = condition_likelihood)

levels(str_likelihood$condition) <- c("distant", "close")

## Model simulation

# The data are simulated from a Poisson distribution,
# because BIF scores are discrete values.

model_likelihood <- makeGlmer(bif_total ~ condition + (1|lab), 
                              family = poisson(link = "log"), 
                              fixef = fixed, 
                              VarCorr = likelihood_variances, 
                              data = str_likelihood)

## Data simulation

data_likelihood <- getData(model_likelihood)

data_likelihood$condition <- as.factor(data_likelihood$condition)

levels(data_likelihood$condition) <- c("distant", "close")

contrasts(data_likelihood$condition) <- contr.sum(2)

## Adding comprehension check

# For this variable, 0 indicates passing the check
# and 1 indicates failing the check.
# The data are set this way to facilitate easier analysis.

data_likelihood$comp_check <- sample(c(0, 1),
                                     nrow(data_likelihood), 
                                     replace = TRUE, 
                                     prob = c(.95, .05))

# In-person vs. Online Moderator -----------------------------------------------

## This will create a roughly even split of labs collecting online and in person.

modality_data <- data.frame(
  lab = 1:labs,
  modality = sample(c("lab", "online"), labs, replace = TRUE)
)

modality_data$lab_modality <- paste(
  "XX_",
  str_pad(1:labs, 2, "left", "0"), 
  "_",
  modality_data$modality,
  sep = ""
  )

data_temporal <- data_temporal %>% 
  left_join(modality_data, by = "lab")

data_spatial <- data_spatial %>% 
  left_join(modality_data, by = "lab")

data_social <- data_social %>% 
  left_join(modality_data, by = "lab")

data_likelihood <- data_likelihood %>% 
  left_join(modality_data, by = "lab")

# Raw BIF data simulation ------------------------------------------------------

# Temporal

bif_columns_temporal <- matrix(
  rep(NA, 25 * nrow(str_temporal)),
  nrow = nrow(str_temporal)) %>% 
  as.data.frame()

colnames(bif_columns_temporal) <- paste("bif_", 
                                        str_pad(1:25, width = 2, pad = "0"), 
                                        sep = "")

bif_temporal_long <- bind_cols(str_temporal, bif_columns_temporal) %>% 
  pivot_longer(
    cols      = starts_with("bif"),
    names_to  = "item",
    values_to = "bif"
  ) %>% 
  select(-bif)

model_bif_temporal <- makeGlmer(bif 
                                ~ condition 
                                + (1|lab:sub) 
                                + (1|lab) 
                                + (1|item), 
                                family = binomial(link = "logit"), 
                                fixef = fixed, 
                                VarCorr = list(.01, .05, .01), 
                                data = bif_temporal_long)

data_bif_temporal <- getData(model_bif_temporal)

# Spatial

bif_columns_spatial <- matrix(
  rep(NA, 25 * nrow(str_spatial)),
  nrow = nrow(str_spatial)) %>% 
  as.data.frame()

colnames(bif_columns_spatial) <- paste("bif_", 
                                       str_pad(1:25, width = 2, pad = "0"), 
                                       sep = "")

bif_spatial_long <- bind_cols(str_spatial, bif_columns_spatial) %>% 
  pivot_longer(
    cols      = starts_with("bif"),
    names_to  = "item",
    values_to = "bif"
  ) %>% 
  select(-bif)

model_bif_spatial <- makeGlmer(bif 
                               ~ condition 
                               + (1|lab:sub) 
                               + (1|lab) 
                               + (1|item) , 
                               family = binomial(link = "logit"), 
                               fixef = fixed, 
                               VarCorr = list(.01, .05, .01), 
                               data = bif_spatial_long)

data_bif_spatial <- getData(model_bif_spatial)

# Social

bif_columns_social <- matrix(
  rep(NA, 25 * nrow(str_social)),
  nrow = nrow(str_social)) %>% 
  as.data.frame()

colnames(bif_columns_social) <- paste("bif_", 
                                      str_pad(1:25, width = 2, pad = "0"), 
                                      sep = "")

bif_social_long <- bind_cols(str_social, bif_columns_social) %>% 
  pivot_longer(
    cols      = starts_with("bif"),
    names_to  = "item",
    values_to = "bif"
  ) %>% 
  select(-bif)

model_bif_social <- makeGlmer(bif 
                              ~ condition 
                              + (1|lab:sub) 
                              + (1|lab) 
                              + (1|item), 
                              family = binomial(link = "logit"), 
                              fixef = fixed, 
                              VarCorr = list(.01, .05, .01), 
                              data = bif_social_long)

data_bif_social <- getData(model_bif_social)

# Likelihood

bif_columns_likelihood <- matrix(
  rep(NA, 25 * nrow(str_likelihood)),
  nrow = nrow(str_likelihood)) %>% 
  as.data.frame()

colnames(bif_columns_likelihood) <- paste("bif_", 
                                          str_pad(1:25, width = 2, pad = "0"), 
                                          sep = "")

bif_likelihood_long <- bind_cols(str_likelihood, bif_columns_likelihood) %>% 
  pivot_longer(
    cols      = starts_with("bif"),
    names_to  = "item",
    values_to = "bif"
  ) %>% 
  select(-bif)

model_bif_likelihood <- makeGlmer(bif 
                                  ~ condition 
                                  + (1|lab:sub) 
                                  + (1|lab) 
                                  + (1|item), 
                                  family = binomial(link = "logit"), 
                                  fixef = fixed, 
                                  VarCorr = list(.01, .05, .01), 
                                  data = bif_likelihood_long)

data_bif_likelihood <- getData(model_bif_likelihood)

# Manipulation checks ----------------------------------------------------------

fixed_mc <- c(0, .475)

model_mc_temporal   <- makeLmer(mc ~ condition + (1|lab), 
                                fixef = fixed_mc, 
                                VarCorr = temporal_variances, 
                                sigma = 1, 
                                data = str_temporal)

data_mc_temporal    <- getData(model_mc_temporal)

model_mc_spatial    <- makeLmer(mc ~ condition + (1|lab), 
                                fixef = fixed_mc, 
                                VarCorr = spatial_variances, 
                                sigma = 1, 
                                data = str_spatial)

data_mc_spatial     <- getData(model_mc_spatial)

model_mc_social     <- makeLmer(mc ~ condition + (1|lab), 
                                fixef = fixed_mc, 
                                VarCorr = social_variances, 
                                sigma = 1, 
                                data = str_social)

data_mc_social      <- getData(model_mc_social)

model_mc_likelihood <- makeLmer(mc ~ condition + (1|lab), 
                                fixef = fixed_mc, 
                                VarCorr = likelihood_variances, 
                                sigma = 1, 
                                data = str_likelihood)

data_mc_likelihood  <- getData(model_mc_likelihood)

data_mc_temporal <- data_mc_temporal %>% 
  left_join(modality_data, by = "lab")

data_mc_spatial <- data_mc_spatial %>% 
  left_join(modality_data, by = "lab")

data_mc_social <- data_mc_social %>% 
  left_join(modality_data, by = "lab")

data_mc_likelihood <- data_mc_likelihood %>% 
  left_join(modality_data, by = "lab")
