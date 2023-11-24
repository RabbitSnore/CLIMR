################################################################################

# CLIMR -- Reporting Functions

################################################################################

# Report meta-analytic effect size ---------------------------------------------

# Effect estimate

report_meta_effect <- function(meta) {
  
  d     <- round(meta$beta, 2)
  ci_lb <- round(meta$ci.lb, 2)
  ci_ub <- round(meta$ci.ub, 2)
  
  paste("d = ", 
        format(d, nsmall = 2), 
        " 95% CI [", 
        format(ci_lb, nsmall = 2), 
        ", ", 
        format(ci_ub, nsmall = 2), 
        "]",
        sep = "")
  
}

# Significance test

report_meta_ci <- function(meta) {
  
  if (meta$ci.lb > 0) {
    
    "excluded zero"
    
  } else {
    
    "did not exclude zero"
    
  }
  
}

# Back-transformed effect size

report_meta_bt <- function(bt) {
  
  d     <- round(bt$diff, 2)
  ci_lb <- round(bt$ci_lower, 2)
  ci_ub <- round(bt$ci_upper, 2)
  
  sign <- ifelse(d > 0, "more", "fewer")
  
  paste(format(d, nsmall = 2), 
        " 95% CI [", 
        format(ci_lb, nsmall = 2), 
        ", ", 
        format(ci_ub, nsmall = 2), 
        "] ",
        sign,
        sep = "")
  
}

# Heterogeneity report

report_meta_het <- function(meta) {
  
  Q    <- round(meta$QE, 2)
  Q_df <- meta$k - 1
  Q_p  <- round(meta$QEp, 3)
  I2   <- round(meta$I2, 2)
  tau  <- round(sqrt(meta$tau2), 3)
  
  sign <- ifelse(
    Q_p < .05,
    "greater than what would be expected by random sampling error",
    "not greater than what would be expected by random sampling error"
    )
  
  paste(sign,
        ", Q(",
        Q_df,
        ") = ",
        format(Q, nsmall = 2),
        ", p = ",
        format(Q_p, nsmall = 3),
        ", I2 = ",
        format(I2, nsmall = 2),
        "%, τ = ",
        format(tau, nsmall = 3),
        sep = "")
  
}

# Report power analysis --------------------------------------------------------

# Percent with 80% power

report_power_80 <- function(prop, det = detectable_effects) {
  
  perc <- round(prop * 100)
  count <- prop * nrow(det)
  
  paste(perc,
        "% (k = ",
        count,
        ")",
        sep = "")
  
}


