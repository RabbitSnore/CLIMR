################################################################################

# CLIMR -- Data Simulation

################################################################################

# Set up environment -----------------------------------------------------------

set.seed(1040)

# Shared Attributes ------------------------------------------------------------

### NOTE
# These attributes are shared between simulations for convenience. They are not intended to be realistic or to reflect our beliefs about the likely outcome of the replications. The values specified throughout this document are basically arbitrary. They are designed to test the code and analytic strategy, not to model any theory or empirical results.
###

# Effect and basic design specification

## Intercept, condition slopes

fixed <- c(0, -.475)

## Conditions

condition <- c("close", "distant")

## Sample sizes

subs <- 25 # Participants per experiment

labs <- 99 # The number of contributing laboratories

# Liberman et al. (2002, Study 1): Temporal Distance ---------------------------

## Design: 2 (between) x 4 (within)

## Random effects

temporal_scenarios <- 4

### Variances

temporal_variances <- list(.30, .05, .05, .05, .05)

## Data structure

total_subs_temporal <- subs*labs

obs_per_lab_temporal <- subs*temporal_scenarios

sub_temporal <- sort(rep(1:total_subs_temporal, temporal_scenarios))

lab_temporal <- sort(rep(1:labs, obs_per_lab_temporal))

stimulus_temporal <- rep(1:temporal_scenarios, total_subs_temporal)

condition_temporal <- sample(condition, total_subs_temporal, replace = TRUE)

str_temporal <- data.frame(lab = lab_temporal, sub = sub_temporal, stimulus = stimulus_temporal) %>% 
  left_join(data.frame(sub = 1:total_subs_temporal, condition = condition_temporal), by = "sub")

levels(str_temporal$condition) <- c("close", "distant")

## Model simulation

# The data are simulated from a Poisson distribution,
# because object categorization is a count variable and
# there is some evidence that the measure tends to be
# positively skewed.
#
# This simulation is somewhat unrealistic, as it produces
# zeroes as valid values for the response variable.
# But this does not affect the usefulness of the simulation.

model_temporal <- makeGlmer(y ~ condition + (1|lab) + (1|lab:sub) + (1 + condition|stimulus), family = poisson(link = "log"), fixef = fixed, VarCorr = temporal_variances, data = str_temporal)

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

## Adding manipulation check

model_mc_temporal <- makeGlmer(mc ~ condition + (1|lab) + (1|lab:sub) + (1 + condition|stimulus), family = poisson(link = "log"), fixef = fixed, VarCorr = temporal_variances, data = str_temporal)

temporal_mc <- getData(model_mc_temporal)

temporal_mc$condition <- as.factor(temporal_mc$condition)

levels(temporal_mc$condition) <- c("close", "distant")

contrasts(temporal_mc$condition) <- contr.sum(2)

# Henderson et al. (2006, Study 1): Spatial Distance ------------------

## 2 (between)

spatial_variances <- .05

## Data structure

total_subs_spatial <- subs*labs

sub_spatial <- rep((total_subs_temporal + 1):(total_subs_spatial + total_subs_temporal))

lab_spatial <- sort(rep(1:labs, subs))

condition_spatial <- sample(condition, total_subs_spatial, replace = TRUE)

str_spatial <- data.frame(lab = lab_spatial, sub = sub_spatial, condition = condition_spatial)

levels(str_spatial$condition) <- c("close", "distant")

## Model simulation

# The data are simulated from a Poisson distribution,
# because segmentation is a count variable.
#
# This simulation is somewhat unrealistic, as it produces
# zeroes as valid values for the response variable,
# and it is not clear whether segmentation data tends to be skewed.
# But this does not affect the usefulness of the simulation.

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

## Adding manipulation check

model_mc_spatial <- makeGlmer(mc ~ condition + (1|lab), family = poisson(link = "log"), fixef = fixed, VarCorr = spatial_variances, data = str_spatial)

spatial_mc <- getData(model_mc_spatial)

spatial_mc$condition <- as.factor(spatial_mc$condition)

levels(spatial_mc$condition) <- c("close", "distant")

contrasts(spatial_mc$condition) <- contr.sum(2)

# Wakslak et al. (2006, Study 1): Likelihood Distance -----------------

## 2 (between) x 4 (within)

# Effect and design specification

## Random effects

likelihood_scenarios <- 4

### Variances

likelihood_variances <- list(.30, .05, .05, .05, .05)

## Data structure

total_subs_likelihood <- subs*labs

obs_per_lab_likelihood <- subs*likelihood_scenarios

sub_likelihood <- sort(rep((total_subs_temporal + total_subs_spatial + 1):(total_subs_likelihood + total_subs_temporal + total_subs_spatial), likelihood_scenarios))

lab_likelihood <- sort(rep(1:labs, obs_per_lab_likelihood))

stimulus_likelihood <- rep(1:likelihood_scenarios, total_subs_likelihood)

condition_likelihood <- sample(condition, total_subs_likelihood, replace = TRUE)

str_likelihood <- data.frame(lab = lab_likelihood, sub = sub_likelihood, stimulus = stimulus_likelihood) %>% 
  left_join(data.frame(sub = (total_subs_temporal + total_subs_spatial + 1):max(sub_likelihood), condition = condition_likelihood), by = "sub")

levels(str_likelihood$condition) <- c("close", "distant")

## Model simulation

# The data are simulated from a Poisson distribution,
# because object categorization is a count variable and
# there is some evidence that the measure tends to be
# positively skewed.
#
# This simulation is somewhat unrealistic, as it produces
# zeroes as valid values for the response variable.
# But this does not affect the usefulness of the simulation.

model_likelihood <- makeGlmer(y ~ condition + (1|lab) + (1|lab:sub) + (1 + condition|stimulus), family = poisson(link = "log"), fixef = fixed, VarCorr = likelihood_variances, data = str_likelihood)

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

## Adding manipulation check

model_mc_likelihood <- makeGlmer(mc ~ condition + (1|lab) + (1|lab:sub) + (1 + condition|stimulus), family = poisson(link = "log"), fixef = fixed, VarCorr = likelihood_variances, data = str_likelihood)

likelihood_mc <- getData(model_mc_likelihood)

likelihood_mc$condition <- as.factor(likelihood_mc$condition)

levels(likelihood_mc$condition) <- c("close", "distant")

contrasts(likelihood_mc$condition) <- contr.sum(2)

# Liberman & Trope (1998, Study 1): Temporal Distance -----------------

## 2 (between)

temporal_2_variances <- .05

## Data structure

total_subs_temporal_2 <- subs*labs

sub_temporal_2 <- rep((total_subs_temporal + total_subs_spatial + total_subs_likelihood + 1):(total_subs_temporal_2 + total_subs_temporal + total_subs_spatial + total_subs_likelihood))

lab_temporal_2 <- sort(rep(1:labs, subs))

condition_temporal_2 <- sample(condition, total_subs_temporal_2, replace = TRUE)

str_temporal_2 <- data.frame(lab = lab_temporal_2, sub = sub_temporal_2, condition = condition_temporal_2)

levels(str_temporal_2$condition) <- c("close", "distant")

## Model simulation

# The data are simulated from a Poisson distribution,
# because BIF scores are discrete values from  0 to 19.

model_temporal_2 <- makeGlmer(y ~ condition + (1|lab), family = poisson(link = "log"), fixef = fixed, VarCorr = temporal_2_variances, data = str_temporal_2)

## Data simulation

data_temporal_2 <- getData(model_temporal_2)

data_temporal_2$condition <- as.factor(data_temporal_2$condition)

levels(data_temporal_2$condition) <- c("close", "distant")

contrasts(data_temporal_2$condition) <- contr.sum(2)

## Adding comprehension check

# For this variable, 0 indicates passing the check
# and 1 indicates failing the check.
# The data are set this way to facilitate easier analysis.

data_temporal_2$comp_check <- sample(c(0, 1), nrow(data_temporal_2), replace = TRUE, prob = c(.95, .05))

## Adding manipulation check

model_mc_temporal_2 <- makeGlmer(mc ~ condition + (1|lab), family = poisson(link = "log"), fixef = fixed, VarCorr = temporal_2_variances, data = str_temporal_2)

temporal_2_mc <- getData(model_mc_temporal_2)

temporal_2_mc$condition <- as.factor(temporal_2_mc$condition)

levels(temporal_2_mc$condition) <- c("close", "distant")

contrasts(temporal_2_mc$condition) <- contr.sum(2)

# Tversky & Kahneman (1981, Study 10): Active Control -----------------

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

# In-person vs. Online Moderator --------------------------------------

## This will create a roughly even split of labs collecting online and in person.

modality_data <- data.frame(
  ID = 1:labs,
  modality = sample(c("lab", "online"), labs, replace = TRUE)
)
