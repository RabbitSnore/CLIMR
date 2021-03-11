#######################################################################

# CLIMR -- Data Simulation

#######################################################################

# Set up environment --------------------------------------------------

packages_simulation <- c("tidyverse", "lme4", "simr")

lapply(packages_simulation, library, character.only = TRUE)

set.seed(1040)

# Shared Attributes ---------------------------------------------------

### NOTE
# These attributes are shared between simulations for convenience. They are not intented to be realistic or to reflect our beliefs about the likely outcome of the replications. The values specified throughout this document are basically arbitrary. They are designed to test the code and analytic strategy, not to model any theory or empirical results.
###

# Effect and basic design specification

## Intercept, condition slopes

fixed <- c(0, -.475)

## Conditions

condition <- c("near", "far")

## Sample sizes

subs <- 25 # Participants per experiment

labs <- 99 # The number of contributing laboratories

# Liberman et al. (2002, Study 1): Temporal Distance) -----------------

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

levels(str_temporal$condition) <- c("near", "far")

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

levels(data_temporal$condition) <- c("near", "far")

contrasts(data_temporal$condition) <- contr.sum(2)

## Adding comprehension check

# For this variable, 0 indicates passing the check
# and 1 indicates failing the check.
# The data are set this way to facilitate easier analysis.

data_temporal$comp_check <- sample(c(0, 1), nrow(data_temporal), replace = TRUE, prob = c(.95, .05))

