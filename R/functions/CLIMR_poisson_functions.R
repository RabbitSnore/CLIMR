#######################################################################

# CLIMR -- Poisson Regression Analysis Functions

#######################################################################

# POISSON REGRESSION  -------------------------------------------------

## Fit a Poisson regression and extract the coefficient and sampling variance

poisson_calc <- function(ID, x, y, cond_1, cond_2) {
  
  # ID is an arbitrary identifier attached to the output
  # x is a vector of condition codes
  # y is a vector of dependent variable values
  # cond_1 and cond_2 are values for the conditions being compared
  
  x <- factor(x, levels = c(cond_2, cond_1))
  
  poisson_model <- glm(y ~ x, family = poisson(link = "log"))
  
  b <- summary(poisson_model)$coefficients[2, 1]
  
  var <- summary(poisson_model)$coefficients[2, 2]^2
  
  ci_upper <- b + sqrt(var) * qnorm(.975)
  
  ci_lower <- b - sqrt(var) * qnorm(.975)
  
  out <- data.frame(ID = ID, b = b, var = var, ci_lower = ci_lower, ci_upper = ci_upper)
  
  return(out)
  
}

# MIXED EFFECT POISSON REGRESSION  ------------------------------------

## Fit a mixed effects Poisson regression and extract the coefficient and sampling variance
## These are set up to account for the non-independence of observations by fitting random intercepts for participants and for stimuli

pois_mm_calc <- function(ID, sub, stimulus, x, y, cond_1, cond_2) {
  
  require(lme4)
  
  # ID is an arbitrary identifier attached to the output
  # x is a vector of condition codes
  # y is a vector of dependent variable values
  # cond_1 and cond_2 are values for the conditions being compared
  
  x <- factor(x, levels = c(cond_2, cond_1))
  
  poisson_model <- glmer(y ~ x + (1|sub) + (1|stimulus), family = poisson(link = "log"))
  
  b <- summary(poisson_model)$coefficients[2, 1]
  
  var <- summary(poisson_model)$coefficients[2, 2]^2
  
  ci_upper <- b + sqrt(var) * qnorm(.975)
  
  ci_lower <- b - sqrt(var) * qnorm(.975)
  
  out <- data.frame(ID = ID, b = b, var = var, ci_lower = ci_lower, ci_upper = ci_upper)
  
  return(out)
  
}

# CREATING EMPTY DATA SETS FOR POISSON REGRESSION DATA ----------------

## The data frame produced by this function is designed to work with the poisson_calc() function

empty_pois_data <- function(n) {
  
  out <- data.frame(
    ID       = rep(NA, n),
    b        = rep(NA, n),
    var      = rep(NA, n),
    ci_lower = rep(NA, n),
    ci_upper = rep(NA, n)
  )
  
  return(out)
  
}

# FIT POISSON REGRESSIONS FOR EACH LAB --------------------------------

lab_poisson_calc <- function(data, distance, experiment, cond_1 = "close", cond_2 = "distant") {
  
  lab_count <- length(unique(data$lab))
  
  effect_data <- empty_pois_data(lab_count)
  
  for (i in 1:lab_count) {
    
    lab_temp <- unique(data$lab)[i]
    
    effect_data[i, ] <- poisson_calc(
      ID     = lab_temp, 
      x      = data$condition[data$lab == lab_temp], 
      y      = data$y[data$lab == lab_temp],
      cond_1 = cond_1, 
      cond_2 = cond_2
    )
    
  }
  
  effect_data$distance <- distance
  effect_data$experiment <- experiment
  
  return(effect_data)
  
}

# FIT MIXED EFFECTS POISSON REGRESSIONS FOR EACH LAB ------------------

lab_pois_mm_calc <- function(data, distance, experiment, cond_1 = "close", cond_2 = "distant") {
  
  lab_count <- length(unique(data$lab))
  
  effect_data <- empty_pois_data(lab_count)
  
  for (i in 1:lab_count) {
    
    lab_temp <- unique(data$lab)[i]
    
    effect_data[i, ] <- pois_mm_calc(
      ID       = lab_temp, 
      sub      = data$sub[data$lab == lab_temp],
      stimulus = data$stimulus[data$lab == lab_temp],
      x        = data$condition[data$lab == lab_temp], 
      y        = data$y[data$lab == lab_temp],
      cond_1   = cond_1, 
      cond_2   = cond_2
    )
    
  }
  
  effect_data$distance <- distance
  effect_data$experiment <- experiment
  
  return(effect_data)
  
}