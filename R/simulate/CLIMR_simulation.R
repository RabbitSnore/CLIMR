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

condition <- c("close", "distant")

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

str_temporal <- data.frame(lab = lab_temporal, sub = sub_temporal, condition = condition_temporal)

levels(str_temporal$condition) <- c("close", "distant")

## Model simulation

# The data are simulated from a Poisson distribution,
# because BIF scores are discrete values from  0 to 13, 19, or 25.

model_temporal <- makeGlmer(y ~ condition + (1|lab), family = poisson(link = "log"), fixef = fixed, VarCorr = temporal_variances, data = str_temporal)

## Data simulation

data_temporal <- getData(model_temporal)

data_temporal$condition <- as.factor(data_temporal$condition)

levels(data_temporal$condition) <- c("close", "distant")

contrasts(data_temporal$condition) <- contr.sum(2)

## Adding comprehension check

# For this variable, 0 indicates passing the check
# and 1 indicates failing the check.
# The data are set this way to facilitate easier analysis.

data_temporal$comp_check <- sample(c(0, 1), nrow(data_temporal), replace = TRUE, prob = c(.95, .05))

# Fujita et al. (2006, Study 1): Spatial Distance ------------------------------

## 2 (between)

spatial_variances <- .05

## Data structure

total_subs_spatial <- subs*labs

sub_spatial <- paste("spatial_", 1:total_subs_spatial, sep = "")

lab_spatial <- sort(rep(1:labs, subs))

condition_spatial <- sample(condition, total_subs_spatial, replace = TRUE)

str_spatial <- data.frame(lab = lab_spatial, sub = sub_spatial, condition = condition_spatial)

levels(str_spatial$condition) <- c("close", "distant")

## Model simulation

# The data are simulated from a Poisson distribution,
# because BIF scores are discrete values from  0 to 13, 19, or 25.

model_spatial <- makeGlmer(y ~ condition + (1|lab), family = poisson(link = "log"), fixef = fixed, VarCorr = spatial_variances, data = str_spatial)

## Data simulation

data_spatial <- getData(model_spatial)

data_spatial$condition <- as.factor(data_spatial$condition)

levels(data_spatial$condition) <- c("close", "distant")

contrasts(data_spatial$condition) <- contr.sum(2)

## Adding comprehension check

# For this variable, 0 indicates passing the check
# and 1 indicates failing the check.
# The data are set this way to facilitate easier analysis.

data_spatial$comp_check <- sample(c(0, 1), nrow(data_spatial), replace = TRUE, prob = c(.95, .05))

# Social Distance (Conceptual Replication) -------------------------------------

## 2 (between)

social_variances <- .05

## Data structure

total_subs_social <- subs*labs

sub_social <- paste("social_", 1:total_subs_social, sep = "")

lab_social <- sort(rep(1:labs, subs))

condition_social <- sample(condition, total_subs_social, replace = TRUE)

str_social <- data.frame(lab = lab_social, sub = sub_social, condition = condition_social)

levels(str_social$condition) <- c("close", "distant")

## Model simulation

# The data are simulated from a Poisson distribution,
# because BIF scores are discrete values from  0 to 13, 19, or 25.

model_social <- makeGlmer(y ~ condition + (1|lab), family = poisson(link = "log"), fixef = fixed, VarCorr = social_variances, data = str_social)

## Data simulation

data_social <- getData(model_social)

data_social$condition <- as.factor(data_social$condition)

levels(data_social$condition) <- c("close", "distant")

contrasts(data_social$condition) <- contr.sum(2)

## Adding comprehension check

# For this variable, 0 indicates passing the check
# and 1 indicates failing the check.
# The data are set this way to facilitate easier analysis.

data_social$comp_check <- sample(c(0, 1), nrow(data_social), replace = TRUE, prob = c(.95, .05))

# Likelihood Distance (Conceptual Replication) ---------------------------------

## 2 (between)

likelihood_variances <- .05

## Data structure

total_subs_likelihood <- subs*labs

sub_likelihood <- paste("likelihood_", 1:total_subs_likelihood, sep = "")

lab_likelihood <- sort(rep(1:labs, subs))

condition_likelihood <- sample(condition, total_subs_likelihood, replace = TRUE)

str_likelihood <- data.frame(lab = lab_likelihood, sub = sub_likelihood, condition = condition_likelihood)

levels(str_likelihood$condition) <- c("close", "distant")

## Model simulation

# The data are simulated from a Poisson distribution,
# because BIF scores are discrete values from  0 to 13, 19, or 25.

model_likelihood <- makeGlmer(y ~ condition + (1|lab), family = poisson(link = "log"), fixef = fixed, VarCorr = likelihood_variances, data = str_likelihood)

## Data simulation

data_likelihood <- getData(model_likelihood)

data_likelihood$condition <- as.factor(data_likelihood$condition)

levels(data_likelihood$condition) <- c("close", "distant")

contrasts(data_likelihood$condition) <- contr.sum(2)

## Adding comprehension check

# For this variable, 0 indicates passing the check
# and 1 indicates failing the check.
# The data are set this way to facilitate easier analysis.

data_likelihood$comp_check <- sample(c(0, 1), nrow(data_likelihood), replace = TRUE, prob = c(.95, .05))

# Tversky & Kahneman (1981, Study 10): Active Control --------------------------

## 2 (between)

condition_ac <- c("expensive", "cheap")

control_fixed <- c(0, -1.60)

## Random effects

control_variances <- .05

## Data structure

primary_experiments <- 4 # Number of replication experiments

total_subs_control <- subs*labs*primary_experiments

sub_control <- 1:total_subs_control

lab_control <- sort(rep(1:labs, subs*primary_experiments))

condition_control <- sample(condition_ac, total_subs_control, replace = TRUE)

str_control <- data.frame(lab = lab_control, sub = sub_control, condition = condition_control)

levels(str_control$condition) <- c("expensive", "cheap")

## Model simulation

# The data are simulated from a Poisson distribution,
# because segmentation is a count variable.
#
# This simulation is somewhat unrealistic, as it produces
# zeroes as valid values for the response variable,
# and it is not clear whether segmentation data tends to be skewed.
# But this does not affect the usefulness of the simulation.

model_control <- makeGlmer(y ~ condition + (1|lab), family = binomial(link = "logit"), fixef = control_fixed, VarCorr = control_variances, data = str_control)

## Data simulation

data_control <- getData(model_control)

data_control$condition <- as.factor(data_control$condition)

levels(data_control$condition) <- c("expensive", "cheap")

contrasts(data_control$condition) <- contr.sum(2)

# In-person vs. Online Moderator -----------------------------------------------

## This will create a roughly even split of labs collecting online and in person.

modality_data <- data.frame(
  ID = 1:labs,
  modality = sample(c("lab", "online"), labs, replace = TRUE)
)
