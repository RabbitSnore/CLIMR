################################################################################

# CLIMR -- General Effect Size Functions

################################################################################

# STANDARDIZED MEAN DIFFERENCE -------------------------------------------------

## Calculate standardized mean difference, sampling variance, and 95% confidence intervals

### Note that this function is designed to compute a mean difference standardized by the standard deviation pooled across the conditions, and it will ignore any dependence of observations.
### This approach is consistent with the recommendations of Jake Westfall in the documentation for the PANGEA power calculation tool, as well as in discussions of computing generalized standardized mean differences.
### One key advantage of this approach is that it is highly general and produces effect sizes that are easy to compare to other standardized effect sizes. However, it does not account for the correlation of errors between observations that, e.g., come from the same person. But this is on purpose.

d_calc <- function(ID, x, y, cond_1, cond_2) {
  
  # ID is an arbitrary identifier attached to the output
  # x is a vector of condition codes
  # y is a vector of dependent variable values
  # cond_1 and cond_2 are values for the conditions being compared
  
  m_diff <- mean(y[x == cond_1], na.rm = TRUE) - mean(y[x == cond_2], na.rm = TRUE)
  
  n_1 <- sum(!is.na(y[x == cond_1]), na.rm = TRUE) 
  
  n_2 <- sum(!is.na(y[x == cond_2]), na.rm = TRUE)
  
  df <- n_1 + n_2 - 2
  
  sd_1 <- sd(y[x == cond_1], na.rm = TRUE)
  
  sd_2 <- sd(y[x == cond_2], na.rm = TRUE)
  
  sd_pooled <- sqrt( (((n_1 - 1) * sd_1^2) + ((n_2 - 1) * sd_2^2)) / df )
  
  d <- m_diff/sd_pooled
  
  var <- ((n_1 + n_2) / (n_1 * n_2)) + ((d^2) / (2*df))
  
  ci_upper <- d + sqrt(var) * qt(.975, df)
  
  ci_lower <- d - sqrt(var) * qt(.975, df)
  
  out <- data.frame(ID = ID, d = d, var = var, ci_lower = ci_lower, ci_upper = ci_upper)
  
  return(out)
  
}

# LOG ODDS RATIO ---------------------------------------------------------------

## Calculate logs odds ratio, sampling variance, and 95% confidence intervals

odds_calc <- function(ID, x, y, cond_1, cond_2) {
  
  # ID is an arbitrary identifier attached to the output
  # x is a vector of condition codes
  # y is a vector of dependent variable values (0/1)
  # cond_1 and cond_2 are values for the conditions being compared
  
  a <- sum(y[x == cond_1] == 1, na.rm = TRUE)
  b <- sum(y[x == cond_1] == 0, na.rm = TRUE)
  c <- sum(y[x == cond_2] == 1, na.rm = TRUE)
  d <- sum(y[x == cond_2] == 0, na.rm = TRUE)
  
  log_odds <- log( ( a/b )/( c/d ) )
  
  var <- 1/a + 1/b + 1/c + 1/d
  
  ci_upper <- log_odds + sqrt(var)*qnorm(.975)
  
  ci_lower <- log_odds - sqrt(var)*qnorm(.975)
  
  out <- data.frame(ID = ID, log_odds = log_odds, var = var, ci_lower = ci_lower, ci_upper = ci_upper)
  
  return(out)
  
}

# UNSTANDARDIZED MEAN DIFFERENCE -----------------------------------------------

## Back-transform standardized mean difference to raw difference

diff_calc <- function(y, d, ci_lower, ci_upper) {
  
  sd <- sd(y, na.rm = TRUE)
  
  diff <- d*sd
  
  ci_upper_us <- ci_upper*sd
  
  ci_lower_us <- ci_lower*sd
  
  out <- data.frame(diff = diff, ci_lower = ci_lower_us, ci_upper = ci_upper_us)
  
  return(out)
  
}

# DIFFERENCE IN PROPORTIONS ----------------------------------------------------

## Calculate the raw difference in proportions, with 95% confidence intervals

prop_calc <- function(x, y) {
  
  tbl <- table(x, y)
  
  props <- (tbl/rowSums(tbl))[, 2]
  
  diff <- props[1] - props[2]
  
  n1 <- rowSums(tbl)[1]
  n2 <- rowSums(tbl)[2]
  
  var <- ( sqrt( props[1] * (1 - props[1]) / n1 ) )^2 + ( sqrt( props[2] * (1 - props[2]) / n2 ) )^2
  
  ci_upper <- diff + sqrt(var)*qnorm(.975)
  
  ci_lower <- diff - sqrt(var)*qnorm(.975)
  
  out <- data.frame(diff = diff, ci_lower = ci_lower, ci_upper = ci_upper, row.names = NULL)
  
  return(out)
  
}

# STANDARDIZED MEAN DIFFEENCE FROM LOG ODDS RATIO

## Calculate a d-like statistic, given a log odds ratio and confidence interval bounds

d_lor_calc <- function(lor, ci_lower, ci_upper) {
  
  d <- lor * (sqrt(3) / pi)
  
  ci_upper_d <- ci_upper * (sqrt(3) / pi)
  
  ci_lower_d <- ci_lower * (sqrt(3) / pi)
  
  out <- data.frame(d = d, ci_lower = ci_lower_d, ci_upper = ci_upper_d)
  
  return(out)
  
}

# CREATING EMPTY DATA SETS FOR EFFECT SIZES ------------------------------------

## The data frame produced by this function is designed to work with the d_calc() function

empty_smd_data <- function(n) {
  
  out <- data.frame(
    ID       = rep(NA, n),
    d        = rep(NA, n),
    var      = rep(NA, n),
    ci_lower = rep(NA, n),
    ci_upper = rep(NA, n)
  )
  
  return(out)
  
}

## The data frame produced by this function is designed to work with the odds_calc() function

empty_lor_data <- function(n) {
  
  out <- data.frame(
    ID       = rep(NA, n),
    log_odds = rep(NA, n),
    var      = rep(NA, n),
    ci_lower = rep(NA, n),
    ci_upper = rep(NA, n)
  )
  
  return(out)
  
}

# CALCULATE EFFECT SIZES FOR EACH LAB ------------------------------------------

## Calculate standardized mean difference for each lab

lab_d_calc <- function(data, distance, experiment, cond_1 = "close", cond_2 = "distant") {
  
  lab_count <- length(unique(data$lab))
  
  effect_data <- empty_smd_data(lab_count)
  
  for (i in 1:lab_count) {
    
    lab_temp <- unique(data$lab)[i]
    
    effect_data[i, ] <- d_calc(
      ID = lab_temp, 
      x = data$condition[data$lab == lab_temp], 
      y = data$y[data$lab == lab_temp],
      cond_1 = cond_1, 
      cond_2 = cond_2
    )
    
  }
  
  effect_data$distance   <- distance
  effect_data$experiment <- experiment
  
  effect_data <- extract(effect_data, ID, "modality", ".*_(.*)", remove = FALSE)
  
  return(effect_data)
  
}

## Calculate log odds ratio for each lab

lab_lor_calc <- function(data, distance, experiment, cond_1 = "close", cond_2 = "distant") {
  
  lab_count <- length(unique(data$lab))
  
  effect_data <- empty_lor_data(lab_count)
  
  for (i in 1:lab_count) {
    
    lab_temp <- unique(data$lab)[i]
    
    effect_data[i, ] <- odds_calc(
      ID = lab_temp, 
      x = data$condition[data$lab == lab_temp], 
      y = data$y[data$lab == lab_temp],
      cond_1 = cond_1, 
      cond_2 = cond_2
    )
    
  }
  
  effect_data$distance <- distance
  effect_data$experiment <- experiment
  
  return(effect_data)
  
}

## Calculate standardized mean difference for manipulation checks

lab_mc_calc <- function(data, distance, experiment, cond_1 = "close", cond_2 = "distant") {
  
  lab_count <- length(unique(data$lab))
  
  effect_data <- empty_smd_data(lab_count)
  
  for (i in 1:lab_count) {
    
    lab_temp <- unique(data$lab)[i]
    
    effect_data[i, ] <- d_calc(
      ID = lab_temp, 
      x = data$condition[data$lab == lab_temp], 
      y = data$mc[data$lab == lab_temp],
      cond_1 = cond_1, 
      cond_2 = cond_2
    )
    
  }
  
  effect_data$distance <- distance
  effect_data$experiment <- experiment
  
  return(effect_data)
  
}

# OUTLIER REMOVAL BASED ON MEDIAN ABSOLUTE DEVIATION ---------------------------

## Given a data frame with a variable y, this function returns a data frame with rows removed for cases that exceed the upper and lower bound based on median absolute deviations. 
## By default, this function uses 3.0 MADs as a cutoff.

mad_removal <- function(data, cutoff = 3.0, constant = 1/qnorm(.75)) {
  
  sample_median <- median(data$y, na.rm = TRUE)
  sample_mad    <- mad(data$y, constant = constant, na.rm = TRUE)
  
  upper <- sample_median + sample_mad * cutoff
  lower <- sample_median - sample_mad * cutoff
  
  out <- data[data$y > lower & data$y < upper, ]
  
  return(out)
  
}


